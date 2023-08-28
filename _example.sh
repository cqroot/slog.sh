#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${SCRIPT_DIR}/slog.sh"

function log_all() {
	slog_error "Error message."
	slog_warning "Warning message."
	slog_info "Info message."
	slog_debug "Debug message."
	echo
}

echo "DEFAULT LEVEL ***********************************************************"
log_all

echo "ERROR LEVEL *************************************************************"
SLOG_LEVEL=${SLOG_LEVEL_ERROR}
log_all

echo "DEBUG LEVEL *************************************************************"
SLOG_LEVEL=${SLOG_LEVEL_DEBUG}
log_all

echo "ENABLE CALLER ***********************************************************"
SLOG_ENABLE_CALLER=1
log_all
