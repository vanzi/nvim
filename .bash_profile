# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PATH="/home/$USER/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# prompt
function updatePrompt {
    GREEN='\[\e[0;32m\]'
    BLUE='\[\e[0;34m\]'
    RESET='\[\e[0m\]'

    PROMPT="\W"

    if type "__git_ps1" > /dev/null 2>&1; then
        PROMPT="$PROMPT $(__git_ps1 "${GREEN}(%s)${RESET}")"
    fi

    if [[ $VIRTUAL_ENV != "" ]]; then
        PROMPT="${BLUE}(${VIRTUAL_ENV##*/})${RESET} $PROMPT"
    fi

    PS1="$PROMPT\$ "
}
export -f updatePrompt
export PROMPT_COMMAND='updatePrompt'
