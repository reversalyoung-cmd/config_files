function p
    set dest (wl-paste | tr -d '\n\r')
    if test -z "$dest"
        echo 剪贴板为空
        return 1
    end
    builtin cd -- "$dest" || return
end
