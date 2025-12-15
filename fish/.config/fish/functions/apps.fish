# function apps --description "备份 yay -Qqe 列表到 NewDotfiles"
#     set dst /home/zy/NewDotfiles/pkglist_yay-qqe.txt
#     mkdir -p (dirname $dst)
#     yay -Qqe >$dst
#     echo "✅ 已保存 $(yay -Qqe | wc -l) 个包到 $dst"
#     echo "恢复：yay -S --needed - < $dst"
# end
function apps --description "备份 repo 与 AUR 明确分开"
    set repo_list /home/zy/NewDotfiles/pkglist_repo.txt
    set aur_list /home/zy/NewDotfiles/pkglist_aur.txt

    mkdir -p (dirname $repo_list)
    yay -Qqne >$repo_list
    yay -Qqme >$aur_list

    echo "✅ repo 包 $(wc -l < $repo_list) 个 → $repo_list"
    echo "✅ AUR  包 $(wc -l < $aur_list)  个 → $aur_list"
    echo "恢复 repo： sudo pacman -S --needed - < $repo_list"
    echo "恢复 AUR ： yay -S --needed - < $aur_list"
end
