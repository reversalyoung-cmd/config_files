function hx
    if test -f ./.venv/bin/activate
        source ./.venv/bin/activate
    end
    command helix $argv
end
