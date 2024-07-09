set -e

function check {
  if [ "$1" = "$2" ] && [ "$2" = "$3" ] && [ "$3" = "$4" ]; then
    exit 0
  else
    echo "Release notes file should have the topmost release match the tagged semantic version"
    echo "pyproject.toml should have the version set to match the README and the tagged version being published"
    echo "changelog.md should have a new entry for the newly tagged release"
    echo "Extracted from release notes $1"
    echo "CI_COMMIT_TAG = $2"
    echo "Extracted from pyproject.toml $3"
    echo "Extracted from changelog.md $4"
    exit 1
  fi
}

function get_readme_version {
  cat $1 | head -n1 | awk '{print $3}'
}

function get_project_version {
  cat $1 | head -n4 | tail -n1 | awk '{print $3}' | sed 's/"//g'
}

function get_change_log_version {
  cat $1 | head -n3 | tail -n1 | awk '{print $2}'
}

check "$(get_readme_version README.md)" "$GITHUB_REF_NAME" "$(get_project_version pyproject.toml)" "$(get_change_log_version changelog.md)"
