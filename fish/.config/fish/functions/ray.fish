function ray
    systemctl is-active --quiet v2ray v2raya
    if test $status -eq 0
        echo "v2ray/v2raya 正在运行，现在关闭并禁用..."
        sudo systemctl disable --now v2ray v2raya
    else
        echo "v2ray/v2raya 未运行，现在启用并启动..."
        sudo systemctl enable --now v2ray v2raya
    end
end
