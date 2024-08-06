# Changelog

## 1.1.6
- Implemented multi-focus function which performs multiple focus operations and returns a tuple of results

## 1.1.5
- Fixed default value to raise FocusingError if default is None

## 1.1.4
- Pypi mistake resulting in a dead version

## 1.1.3
- Fixed code coverage and added failure to pytest CI job if code coverage is not 100%
- Brought changelog up to date
- Enhanced version check script to check version from changelog as well
- Moved release versioning to not include a 'v' in version numbers

## 1.1.2
- Added support for default values when a collection is not focusable
- Added support for tuples, which really became a bug fix for the top level collection being anything other than a dict
- Improved version check script to include checking pyproject.toml

## 1.1.1
- Fixed issue when indexing an empty list
- Moved focus and FocusingError to package level
- Updated Github actions
- Updated minimum python to 3.11

## 1.1.0
- Fixed exception thrown when key sets finds an empty collection to be a FocusingError with explanation rather than an IndexError

## 1.0.5
- Fixing issue where strings that are _specifically_ two characters long get split as if they were two character tuples.
