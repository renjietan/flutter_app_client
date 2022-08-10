mkdir 文件名
cd 文件名
git init 
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin https://gitee.com/mapcan/mlh.git
git push -u origin "master"

备注：首次如果PULL失败 可能需要git pull --allow-unrelated-histories