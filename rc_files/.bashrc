# Please, don't replace your .bashrc
# Append the following lines to your .bashrc
# And please, please, use it in your home folder

# Shows git branch on parenthesis when you're in a repo
PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\[\033[31m\]\`git branch 2>/dev/null | grep \"^\*\" | sed -r \"s/\*\ (.*)/ \(\1\)/\"\` \[\033[00m\]$ "
