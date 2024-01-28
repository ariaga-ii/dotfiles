function fzf-find-files(){
  local file=$(fzf --multi --reverse) #get file from fzf
  if [[ $file ]]; then
    for prog in $(echo $file); #open all the selected files
    do; $EDITOR $prog; done;
  else
    echo "cancelled fzf"
  fi
}
alias ffind=fzf-find-files

function fzf-env-vars() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}
alias fenv=fzf-env-vars

fzf-git-status() {
  git rev-parse --git-dir > /dev/null 2>&1 || { echo "You are not in a git repository" && return }
  local selected
  selected=$(git -c color.status=always status --short |
      fzf "$@" --border -m --ansi --nth 2..,.. \
      --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
      cut -c4- | sed 's/.* -> //')
          if [[ $selected ]]; then
              for prog in $(echo $selected);
              do; $EDITOR $prog; done;
          fi
}
alias gs=fzf-git-status


# fzf-checkout(){
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         if [[ "$#" -eq 0 ]]; then
#             local branches branch
#             branches=$(git branch -a) &&
#             branch=$(echo "$branches" |
#             fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
#             git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
#         elif [ `git rev-parse --verify --quiet $*` ] || \
#              [ `git branch --remotes | grep  --extended-regexp "^[[:space:]]+origin/${*}$"` ]; then
#             echo "Checking out to existing branch"
#             git checkout "$*"
#         else
#             echo "Creating new branch"
#             git checkout -b "$*"
#         fi
#     else
#         echo "Can't check out or create branch. Not in a git repo"
#     fi
# }
