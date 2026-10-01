#!/usr/bin/env bash
set -euo pipefail

AVAST_VERSION="0.0.1"

box() {
    local text="$1"
    local width=${#text}
    local border
    border=$(printf '+%*s+' "$((width + 2))" '' | tr ' ' '-')
    printf '%s\n| %s |\n%s\n' "$border" "$text" "$border"
}

pause() {
    if [ -t 0 ]; then
        read -rp "press enter to continue..." _ || true
    else
        { read -rp "press enter to continue..." _ < /dev/tty; } 2>/dev/null || true
    fi
    printf '\n'
}

box "AVaSt v${AVAST_VERSION}"
box "powered by GDPatch"

OS="unknown"
case "$(uname -s)" in
    Linux*) OS="linux" ;;
    Darwin*) OS="macos" ;;
    MINGW* | MSYS* | CYGWIN*) OS="windows" ;;
esac
box "test: detected OS is ${OS}"

DESKTOP="${HOME}/Desktop"
TEST_FILE="${DESKTOP}/avast_test.txt"
printf 'AVaSt v%s test file\n' "${AVAST_VERSION}" > "${TEST_FILE}"
box "test: wrote ${TEST_FILE}"

pause

rm -f "${TEST_FILE}"
box "test: removed ${TEST_FILE}"
box "test: installer not implemented yet"
