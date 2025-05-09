git_status=$(git status --short | wc -l)
if [[ $git_status -ge 1 ]] ; then 
  exit 1
else
  exit 0
fi
