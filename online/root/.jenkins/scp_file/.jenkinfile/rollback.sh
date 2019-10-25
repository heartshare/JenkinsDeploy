#!/usr/bin/env sh
cd /root/.jenkins/scp_file

if [ ! -f ./old_version ]; then
  	echo '目前没有回滚备份,不能回滚'
  	exit 1
fi

online_version=$(cat './online_version')
old_version=$(cat './old_version')
if [ $old_version = $online_version ]; then
	echo '只能回滚一次，当前版本与回滚版本一致,不能回滚'
  	exit 1
fi

echo "当前版本号：$online_version"
echo "回滚版本号: $old_version"
echo '解压回滚包到当前文件'
set -x
unzip ./old_back.zip -d ./old_back
set +x

echo '修改文件所属用户组'
set -x
chown -R www-data:www-data ./old_back
set +x

echo "移动文件到网站根目录覆盖文件"
set -x
cp -rf ./old_back/* /home/www/xiwanghulian/
set +x