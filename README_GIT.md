mkdir 文件名
cd 文件名
git init 
touch README.md
git add README.md
git add -A
git commit -m "first commit"
git remote add origin 仓库地址
git push -u origin "master"

备注：首次如果PULL失败 可能需要git pull --allow-unrelated-histories