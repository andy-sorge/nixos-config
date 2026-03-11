{ pkgs, ... }:
{  
  home.packages = with pkgs; [
    # e&e
    metasploit
    armitage
    dig
    sslscan
    evil-winrm
    evil-winrm-py
    sqlmap
    yara
    
    # reverse
    ghidra
    radare2
    
    # web
    burpsuite
    dirbuster
    dirstalk
    wpscan
    subfinder
    cadaver
    dirb
    ffuf
    
    # network
    nmap
    aircrack-ng
    traceroute
    netcat
    tcpdump
    wireshark
    macchanger
    airgeddon
    arping
    arp-scan
    netdiscover
    
    # password
    hashcat
    john
    hydra
    crunch
    cewl
    
    # forensic
    binwalk
    foremost
    binutils
    steghide
    testdisk
    imhex
    
    # osint
    sherlock
    exiftool
    dnsrecon
    
    # not working yet
    # 
    # mitmproxy
    # 
    # ophcrack
    expat # required for ophcrack
    
  ];
}
