#MATE colors without path
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\[\033[00m\]\$ "


#without color
PS1="\u@\h\[\033[00m\] \$ "

#green
PS1="\e[0;32m[\u@\h] \$\e[m "
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]\$ "

#yellow or brown color
33

#red color
31

#default mate colors
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\[\033[00m\]\$ "


#ubuntu colors without path, without : separator
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]$ "



#MATE default
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "



    
    
    
    
# it works!
PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]$"
