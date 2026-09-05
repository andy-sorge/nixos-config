flake-init() {
    if [[ -z "$1" ]]; then
        PROJECT_TYPE=$(
            nix flake show github:nixos/templates --json |\
            jq -r '.templates | keys[]' |\
            gum filter \
                --placeholder="project type..."
        )
        [[ $? -ne 0 || -z "$PROJECT_TYPE" ]] && return 1
    else
        PROJECT_TYPE=$1
    fi

    nix flake show github:nixos/templates --json |\
            jq -r '.templates | keys[]' |\
            grep $PROJECT_TYPE >/dev/null || {
                echo invalid project type && return 1
            };

    if [[ -z "$2" ]]; then
        PROJECT_NAME=$(gum input --placeholder="project name...")
        [[ $? -ne 0 || -z "$PROJECT_NAME" ]] && return 1
    else
        PROJECT_NAME=$2
    fi

    mkdir -p ~/code/$PROJECT_NAME
    cd ~/code/$PROJECT_NAME
    gum spin --title="initializing template..." -- nix flake init -t github:nixos/templates#$PROJECT_TYPE
    git init
    echo "use flake" >> .envrc
    git add .
    direnv allow
};

update() {
    echo "would you also like to update packages?"
    UPDATE_PKGS=$(gum choose "no" "yes")

    echo "would you like to apply changes now or on reboot?"
    WHEN=$(gum choose "now" "reboot")

    echo "garbage collect?"
    GC=$(gum choose "yes" "no")

    if [[ "$UPDATE_PKGS" == "yes" ]]; then
        gum spin --title="updating packages..." -- nix flake update
    fi

    if [[ "$WHEN" == "now" ]]; then
        sudo gum spin --title="building..." -- sudo nixos-rebuild switch
    else
        sudo gum spin --title="building..." -- sudo nixos-rebuild reboot
    fi

    if [[ "$GC" == "yes" ]]; then
        sudo gum spin --title="deleting old profiles..." -- sudo nix-env --delete-generations +3 --profile /nix/var/nix/profiles/system
        sudo gum spin --title="collecting garbage..." -- sudo nix-collect-garbage
    fi
}

make_scratch() {
    if [ ! -d "$HOME/.scratch" ]; then
        mkdir "$TMPDIR/.scratch"
        ln -s "$TMPDIR/.scratch" "$HOME/.scratch"
    fi
    cd "$HOME/.scratch"
}

cleartemp() {
    tmp_dir="$TMPDIR/.scratch"
    started_inside="false"
    if [[ "${PWD:A}/" == "${tmp_dir:A}/"* ]]; then
        cd ~
        started_inside="true"
    fi

    gum confirm --selected.background="2" --selected.foreground="7" \
        "completely clean the ~/.scratch directory?" && \
        rm -rf ~/.scratch && rm -rf $TMPDIR/.scratch

    make_scratch

    if [[ "$started_inside" == "true" ]]; then
        cd ~/.scratch
    fi
}
