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

box "AVaSt v${AVAST_VERSION}"
box "powered by GDPatch"

OS="unknown"
case "$(uname -s)" in
    Linux*) OS="linux" ;;
    Darwin*) OS="macos" ;;
    MINGW* | MSYS* | CYGWIN*) OS="windows" ;;
esac
box "test: detected OS is ${OS}"
box "test: installer not implemented yet"
