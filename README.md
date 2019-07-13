交友后台
命令行指令

Git全球设置
git config --global user.name“管理员”
git config --global user.email“admin@zogheng.com”

创建一个新的存储库
git clone git@3.15.90.203：root / test.git
cd测试
触摸README.md
git add README.md
git commit -m“add README”
git push -u origin master

现有文件夹或Git存储库
cd existing_folder
git init
git remote add origin git@3.15.90.203：root / test.git
git add。
git commit
git push -u origin master