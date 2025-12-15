function zip
    if test (count $argv) -eq 0
        echo "用法: zip <文件或文件夹路径>"
        return 1
    end

    set target $argv[1]

    if not test -e "$target"
        echo "错误: '$target' 不存在"
        return 1
    end

    set basename (basename "$target")
    set zipname (string replace -r '\.[^.]+$' '' "$basename").zip

    7z a -tzip "$zipname" "$target"

    echo "压缩完成: $zipname"
end
