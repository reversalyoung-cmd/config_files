function remove
    set -l fzf_args --multi --preview 'yay -Qi {1}' --preview-label='alt-p: toggle description, alt-j/k: scroll, tab: multi-select' --preview-label-pos='bottom' --preview-window 'down:65%:wrap' --bind 'alt-p:toggle-preview' --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up' --bind 'alt-k:preview-up,alt-j:preview-down' --color 'pointer:red,marker:red'

    set pkg_names (yay -Qqe | fzf $fzf_args)

    if test -n "$pkg_names"
        echo "$pkg_names" | tr '\n' ' ' | xargs sudo pacman -Rns --noconfirm
    end
end
