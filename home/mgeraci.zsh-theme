local maybe_git_branch='$(/Users/mgeraci/.bin/parse_git_branch.sh)'
PROMPT='%{$fg[green]%}%~'${maybe_git_branch}' %{$fg[green]%}%(!.#.>) %{$reset_color%}'
setopt promptsubst
