function sbuv
    command -v deactivate &>/dev/null && deactivate
    test -d .venv && rm -rf .venv
    uv venv
    uv sync
end
