#!/usr/bin/env sh
cd /root/.jenkins/scp_file

update_version=$(cat './local_version')
online_version=$(cat './online_version')
update_list=$(cat './update.list')
#更新处理
if [ $update_version = $online_version ]; then
	echo '更新版本与线上环境版本一样，不需要更新'
else
	echo '解压更新包到当前文件'
	set -x
	unzip ./update_online.zip -d ./update_online
	set +x

	echo '修改文件所属用户组'
	set -x
	chown -R www-data:www-data ./update_online
	cd /home/www/  #线上项目对应目录
	set +x

	echo "删除旧文件，同时备份要更新文件,方便回滚"
	set -x
	rm -fr /root/.jenkins/scp_file/old_back.zip
	echo $update_list | xargs zip /root/.jenkins/scp_file/old_back.zip
	set +x

	echo "移动文件到网站根目录覆盖文件"
	set -x
	cp -rf /root/.jenkins/scp_file/update_online/* ./
	set +x
fi
