#!/usr/bin/env bash
#
# A logging library for Bash.

SLOG_LEVEL_DEBUG=0
SLOG_LEVEL_INFO=1
SLOG_LEVEL_WARNING=2
SLOG_LEVEL_ERROR=3
SLOG_LEVEL=${SLOG_LEVEL:-1}

SLOG_ENABLE_CALLER=0

function __slog_color_red() {
	# shellcheck disable=SC2028
	echo '\033[0;31m'
}

function __slog_color_green() {
	# shellcheck disable=SC2028
	echo '\033[0;32m'
}

function __slog_color_yellow() {
	# shellcheck disable=SC2028
	echo '\033[0;33m'
}

function __slog_color_purple() {
	# shellcheck disable=SC2028
	echo '\033[0;35m'
}

function __slog_color_nc() {
	# shellcheck disable=SC2028
	echo '\033[0m'
}

function __slog_module_caller() {
	if [ $SLOG_ENABLE_CALLER -eq 1 ]; then
		echo "${BASH_SOURCE[3]}:${BASH_LINENO[2]} "
	fi
}

__slog_level_msgs=(
	"[DEBUG]"
	"$(__slog_color_green) [INFO]$(__slog_color_nc)"
	"$(__slog_color_yellow) [WARN]$(__slog_color_nc)"
	"$(__slog_color_red)[ERROR]$(__slog_color_nc)"
)

function __slog_msg() {
	if [ "$1" -lt "${SLOG_LEVEL}" ]; then
		return
	fi

	printf "$(__slog_color_purple)%s$(__slog_color_nc) ${__slog_level_msgs[$1]} %s%s\n" \
		"$(date '+%Y-%m-%d %H:%M:%S:%3N')" \
		"$(__slog_module_caller)" \
		"$2"
}

#######################################
# Debug.
# Arguments:
#   Msg
#######################################
function slog_debug() {
	__slog_msg ${SLOG_LEVEL_DEBUG} "$1"
}

#######################################
# Info.
# Arguments:
#   Msg
#######################################
function slog_info() {
	__slog_msg ${SLOG_LEVEL_INFO} "$1"
}

#######################################
# Warning.
# Arguments:
#   Msg
#######################################
function slog_warning() {
	__slog_msg ${SLOG_LEVEL_WARNING} "$1"
}

#######################################
# Error.
# Arguments:
#   Msg
#######################################
function slog_error() {
	__slog_msg ${SLOG_LEVEL_ERROR} "$1"
}
