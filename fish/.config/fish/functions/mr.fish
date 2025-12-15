function mr
    set cur (hyprctl -j monitors | jq -r '.[]|select(.name=="eDP-1").refreshRate')
    echo "current refresh: $cur Hz"
    if test "$cur" = "120.00300"
        hyprctl keyword monitor "eDP-1,2880x1800@60,auto,2"
    else
        hyprctl keyword monitor "eDP-1,2880x1800@120,auto,2"
    end
end
