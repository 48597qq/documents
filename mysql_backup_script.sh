#!/bin/bash

#保存备份个数，备份31天数据
number=15

#备份保存路径
backup_dir=/data/local/mysql/backup

#日期
dd=`date +%Y-%m-%d-%H-%M-%S`

#备份工具
tool=mysqldump

#用户名密码，将要备份的数据库
username=root
password=123456
database_name=toolmall_customer

#如果文件夹不存在则创建
if [ ! -d $backup_dir ];
then
    mkdir -p $backup_dir;
fi

#写创建备份日志
echo "create $backup_dir/$database_name-$dd.dupm" >> $backup_dir/backup_record_log.txt


#简单写法，实例：mysqldump -utoolmall -pToolMall_123 users > /data/local/mysql/backup/toolmall_customer-2019-06-03-17-55-20.sql
$tool -u $username -p$password $database_name > $backup_dir/$database_name-$dd.sql


#找出需要删除的备份
delfile=`ls -l -crt  $backup_dir/*.sql | awk '{print $9 }' | head -1`

#判断现在的备份数量是否大于$number
count=`ls -l -crt  $backup_dir/*.sql | awk '{print $9 }' | wc -l`

if [ $count -gt $number ]
then
  #删除最早生成的备份，只保留number数量的备份
  rm $delfile
  #写删除文件日志
  echo "delete $delfile" >> $backup_dir/backup_record_log.txt
fi

