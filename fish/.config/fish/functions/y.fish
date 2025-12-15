function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (cat $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        builtin cd -- "$cwd"
        printf '\e[1A\e[K'
    end
    rm -f -- "$tmp"
end
