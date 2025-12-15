function back --description '交互式回退 @home 快照'
    # 1. 列出可用快照
    echo 'Available @home snapshots:'
    sudo snapper -c home list
    echo

    # 2. 交互读取编号
    read -l -P 'Enter snapshot number to rollback: ' num
    or return # Ctrl-C 直接退出

    # 3. 合法性检查：必须纯数字且存在于列表
    if not string match -qr '^\d+$' $num
        echo "Invalid input: must be a number"
        return 1
    end

    # 检查该编号是否存在（取第 1 列序号）
    if not sudo snapper -c home list | awk 'NR>1 {print $1}' | grep -qx $num
        echo "Snapshot #$num not found"
        return 1
    end

    # 4. 二次确认
    read -l -P "Confirm rollback to snapshot $num? [y/N]: " sure
    if test "$sure" != y -a "$sure" != Y
        echo "Cancelled."
        return
    end

    # 5. 执行回退
    echo "Rolling back @home to snapshot $num ..."
    sudo snapper -c home undochange $num..0
    echo "Done. Your /home is now at snapshot $num."
end
