function myip
    echo ""

    # 1. 打印所有接口 IPv4 简要信息
    ip -br -4 a

    # 2. 取出 wlan0 的纯地址（去掉掩码）
    set -l ip (ip -br -4 a show wlan0 2>/dev/null | awk '{print $3}' | cut -d/ -f1)

    if test -z "$ip" # 没拿到地址
        echo ""
        echo "❌ 无法获取 wlan0 的 IPv4 地址" >&2
        return 1
    end

    # 3. 尝试写进 Wayland 剪贴板
    echo -n $ip | wl-copy 2>/dev/null
    set -l copy_ok $status

    if test $copy_ok -eq 0
        echo ""
        echo "✅ wlan0 IP 地址 $ip 已复制到剪贴板"
    else
        # 红色高亮提示失败
        echo ""
        echo "❌ 复制失败：请确认已安装 wl-clipboard 且运行在 Wayland 会话" >&2
        echo "   原始地址：$ip"
    end
end
