function pwd
    set _pwd (builtin pwd)
    printf '%s\n' "$_pwd"
    printf '%s' "$_pwd" | wl-copy
end
