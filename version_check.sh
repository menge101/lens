set -e

function check {
  if [ "$1" = "$2" ] && [ "$2" = "$3" ]; then
    exit 0
  else
    echo "Release notes file should have the topmost release match the tagged semantic version"
    echo "pyproject.toml should have the version set to match the README and the tagged version being published"
    echo "Extracted from release notes $1"
    echo "CI_COMMIT_TAG = $2"
    echo "Extracted from pyproject.toml $3"
    exit 1
  fi
}

function get_readme_version {
  cat $1 | head -n1 | awk '{print $3}'
}

function get_project_version {
  # Please note this function cheats a little and adds a v, because we EXPECT the version tags to include v
  # This will have to be changed if I stop using tags with a v.
  cat $1 | head -n4 | tail -n1 | awk '{print $3}' | sed 's/"//g' | sed 's/^/v/g'
}

check "$(get_readme_version README.md)" "$GITHUB_REF_NAME" "$(get_project_version pyproject.toml)"
