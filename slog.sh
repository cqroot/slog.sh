#!/usr/bin/env bash

SLOG_LEVEL_DEBUG=0
SLOG_LEVEL_INFO=1
SLOG_LEVEL_WARNING=2
SLOG_LEVEL_ERROR=3
SLOG_LEVEL=${SLOG_LEVEL:-1}

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

__slog_level_msgs=(
	"DEBUG"
	"$(__slog_color_green) INFO$(__slog_color_nc)"
	"$(__slog_color_yellow) WARN$(__slog_color_nc)"
	"$(__slog_color_red)ERROR$(__slog_color_nc)"
)

function __slog_msg() {
	if [ "$1" -lt "${SLOG_LEVEL}" ]; then
		return
	fi

	printf "$(__slog_color_purple)%s$(__slog_color_nc) [${__slog_level_msgs[$1]}] %s\n" \
		"$(date '+%Y-%m-%d %H:%M:%S:%3N')" \
		"$2"
}

function slog_debug() {
	__slog_msg ${SLOG_LEVEL_DEBUG} "$1"
}

function slog_info() {
	__slog_msg ${SLOG_LEVEL_INFO} "$1"
}

function slog_warning() {
	__slog_msg ${SLOG_LEVEL_WARNING} "$1"
}

function slog_error() {
	__slog_msg ${SLOG_LEVEL_ERROR} "$1"
}
