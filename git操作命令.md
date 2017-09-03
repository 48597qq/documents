####1.使用vim查看git的配置文件
```
vim ~/.gitconfig
```
####2.使用git命令查看git配置
查看所有的配置信息：

```
git config --list 或者：git config -l 
```
查看某个参数的信息:

```
git config user.name #查看git的用户名
```

####3.创建git仓库
进入当前文件夹,创建git仓库：

```
git init #创建git仓库
```
或者:

```
# 将远程仓库的flask-mail项目拷贝到本地并且重命名为test_mail
git clone https://github.com/mattupstate/flask-mail.git test_mail  
```
#####1、查看git仓库分支状态:
git仓库创建完成后，一般会查看远程仓库和本地仓库有哪些分支

```
# 查看本地仓库的分支
git branch
# 输出结果
* master
```
```
# 查看远程仓库的分支
git branch -a
# 输出结果
* master
```
#####2、创建新的分支：
在主分支master下创建新的分支develop:

```
# 创建分支
git branch develop

# 输出结果
  develop
* master
```

```
# 切换状态到develop
git check develop
# 输出结果
Switched to branch 'develop'
```
表明已经从master主分支切换到develop状态，再次输入git branch查看本地分支时：

```
* develop  
  master
```

#####3、将修改的文件提交到缓存中：
如果新建或者修改过文件之后，要提交到仓库中，首先需要将改动的部分提交到缓存当中

```
# 提交单个文件到缓存
git add test.txt
# 提交多个文件到魂村
git add -A 或者git add --all
```
#####4、查看缓存文件状态：
文件提交到缓存区域后，查看当前文件缓存区的状态

```
# 查看缓存文件状态
git status 
# 输出结果
n branch develop
Changes to be committed:
	new file:   test.txt
```
#####5、查看缓存文件改动的详细信息：
执行 git diff 来查看执行 git status 的结果的详细信息，git diff 命令显示已写入缓存与已修改但尚未写入缓存的改动的区别。git diff 有两个主要的应用场景。

```
# 尚未缓存的改动
git diff

# 查看已缓存的改动
git diff --cached

# 查看已缓存的与未缓存的所有改动
git diff HEAD

# 显示摘要而非整个diff：
git diff --stat
```
#####6、提交文件到仓库：
将缓存区的文件提交到git仓库当中

```
# 测试文件的提交， -m 用于对此次提交的进行描述
git commit -m '测试文本文件提交'
# 输出结果
[develop d33ac57] 测试文本文件提交
	1 file changed, 0 insertions(+), 0 deletions(-)
	create mode 100644 111111.txt
```
#####7、撤销提交
撤销缓存区的提交，即git add提交过的

```
#工作不改变，但是暂存区会回退到上一次提交之前，引用也会回退一次。
git reset 或者 git reset HEAD
```

撤销已经提交到仓库的操作，即 git commit提交

```
# 彻底撤销最近的提交。引用回退到前一次，而且工作区和暂存区都会回退到上一次提交的状态。自上一次以来的提交全部丢失。
git reset --hard HEAD^
```

#####8、合并分支
系统在发布前，通常都要进行分支合并，首先要切换到要合并进去的分支，如果当前所在分支是develop，要合并到主分支master

```
# 切换到master分支
git checkout master
# 输出结果
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
```
将develop分支合并到master分支中：

```
# 合并develop分支到master主分支
git merge develop
# 输出结果
Updating 1709c70..ccfe7b2
Fast-forward
```
如果在合并过程中，出现文件冲突，git会提示有哪些文件冲突，比如：

```
<<<<<<< HEAD:test.txt

printf (“test1″);

=======

printf (“test2″);

>>>>>>> develop:test.txt
```
在解决了所有文件里的所有冲突后，运行 git add 将把它们标记为已解决（resolved）。因为一旦暂存，就表示冲突已经解决。






