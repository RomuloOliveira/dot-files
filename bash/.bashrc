PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\[\033[31m\]\`git branch 2>/dev/null | grep \"^\*\" | sed -r \"s/\*\ (.*)/ \(\1\)/\"\` \[\033[00m\]$ "
