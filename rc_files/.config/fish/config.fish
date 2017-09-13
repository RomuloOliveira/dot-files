alias s="git status"
alias d="git diff"
alias ds="git diff --cached"
alias yolo="git push -f"
alias got="fortune | cowsay; git"
alias jair="pip list --outdated --format=legacy"
alias rg="rg --no-heading --color always"
alias t="teresa"
alias testdox="pytest --testdox"

# Virtualfish - python virtualenv
eval (python -m virtualfish)

function my_prompt_pwd -d 'Print the current working directory'
  echo $PWD | sed -e "s|^$HOME|~|"
end

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
# Git colors
set __fish_git_prompt_color_branch red
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_untrackedfiles cyan

# Status Chars
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_untrackedfiles ' ✚ '
set __fish_git_prompt_char_dirtystate ' ☂ '
set __fish_git_prompt_char_stagedstate ' → '
set __fish_git_prompt_char_stashstate ' ↩ '
set __fish_git_prompt_char_upstream_ahead ' ↑ '
set __fish_git_prompt_char_upstream_behind ' ↓ '

function fish_prompt
  set_color $fish_color_cwd
  # echo ''
  echo -n (my_prompt_pwd)
  set_color normal
  if set -q VIRTUAL_ENV
    set_color yellow
    echo -n  " ("(basename "$VIRTUAL_ENV")")"
    set_color normal
  end
  echo (__fish_git_prompt)
  set_color normal
  echo ' ⟩ '
end

set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin ~/bin
status --is-interactive; and source (pyenv init -|psub)

export LC_ALL=en_US.UTF-8
