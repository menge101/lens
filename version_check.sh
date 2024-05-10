set -e

function check {
  if [ "$1" = "$2" ]; then
    exit 0
  else
    echo "Release notes file should have the topmost release match the tagged semantic version"
    echo "Extracted from release notes $1"
    echo "CI_COMMIT_TAG = $2"
    exit 1
  fi
}

function get_version {
  cat $1 | head -n1 | awk '{print $3}'
}

if [ -z "$1" ]
    then
      echo "You must specify file as arg 1"
      exit 1
    else
      check "$(get_version "$1")" "$GITHUB_REF_NAME"
fi
