#!/usr/bin/env fish

if test (count $argv) -ne 2
    echo 'Wrong number of arguments. Usage: ./wsaction.fish <dispatcher> <workspace>'
    exit 1
end

set -l dispatcher $argv[1]
set -l target_workspace $argv[2]

# 检查DP-2显示器是否存在
set -l dp2_exists (hyprctl monitors -j | jq -r '.[] | select(.name == "DP-2") | .name')

if test -z "$dp2_exists" -a "$target_workspace" -ge 2 -a "$target_workspace" -le 5
    # DP-2不存在，且目标工作区是2-5
    # 在eDP-1上显示这些工作区（作为fallback）
    hyprctl dispatch $dispatcher $target_workspace
else
    # 正常情况：DP-2存在，或者目标工作区是1
    # Hyprland会自动根据workspace配置中的monitor绑定来放置工作区
    hyprctl dispatch $dispatcher $target_workspace
end
