# bash function in my .rc file
awslogs() {
  set -e
  export AWS_PROFILE=$(cat ~/.aws/config | awk '/^\[profile /{print $2}' | tr -d ']' | fzf)
  local log_group=$(aws logs describe-log-groups | jq -r '.logGroups[].logGroupName' | fzf)
  aws logs tail "$log_group" --since 3h --follow --format=short
}

awsprofile() {
  export AWS_PROFILE=$(cat ~/.aws/config | awk '/^\[profile /{print $2}' | tr -d ']' | fzf)
}
