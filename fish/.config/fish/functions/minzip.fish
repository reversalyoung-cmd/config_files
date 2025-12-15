function minzip
    if test (count $argv) -eq 0
        echo "用法: zipmin <文件或文件夹路径>"
        return 1
    end

    set target $argv[1]
    if not test -e "$target"
        echo "错误: '$target' 不存在"
        return 1
    end

    set basename (basename "$target")
    set zipname (string replace -r '\.[^.]+$' '' "$basename")_min.zip

    7z a -tzip -mx0 "$zipname" "$target"
    echo "最小压缩完成: $zipname"
end
