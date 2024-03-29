#/usr/bin/env bash

__yarn_completion_complete_scripts()
{
    LIST=$(node ~/.bin/yarn-completion.js $PWD)
    COMPREPLY+=($(compgen -W "$LIST" "${COMP_WORDS[1]}"))
}

__yarn_completion_complete()
{
    complete -F __yarn_completion_complete_scripts $1
}

__yarn_completion_complete yarn
