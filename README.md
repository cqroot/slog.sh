# SLog

A logging library for **Bash**.

## Usage

```bash
source "/path/to/slog.sh"

SLOG_LEVEL=${SLOG_LEVEL_WARNING}

slog_error "Error message."
slog_warning "Warning message."
slog_info "Info message."
slog_debug "Debug message."
```
