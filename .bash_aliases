# If you see errors when you try to import this file into .bashrc, run this command:
#dos2unix .bash_aliases

### ALIASES ###

# list commands
alias ls='ls -ltaX'
alias la='ls -a'
alias ll='ls -alFh'
alias l='ls'

# fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='update'

# git commands
alias gits='git status'

# maven commands
alias mvnt='mvn clean test'
alias mvnv='mvn clean verify'
alias mvni='mvn clean install'

# variety command
alias varietys='variety --move-to-favorites'
alias varietyn='variety --next'
alias varietyp='variety --previous'

# Make sure you put this line in .bashrc after copying it from skel
# [[ -f ~/.bash_aliases ]] && . ~/.bash_aliases