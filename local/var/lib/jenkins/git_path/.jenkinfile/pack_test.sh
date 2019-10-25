#!/usr/bin/env sh
cd /var/lib/jenkins/git_path/energy_platform
#local_version = $(cat '/var/lib/jenkins/git_path/.energy_emit_log/local_version')
test_version=$(cat '/var/lib/jenkins/git_path/.energy_emit_log/test_version')
last_version=$(cat '/var/lib/jenkins/git_path/.energy_emit_log/last_version')
#online_version = $(cat '/var/lib/jenkins/git_path/.energy_emit_log/online_version')
if [ $1 = 'lastest' ] ;then
	update_version=$last_version
else
	update_version=$1
fi
#更新处理
if [ $update_version = $test_version ]; then
	echo '更新版本与测试环境版本一样，不需要更新'
elif [ $update_version = $last_version ];then
	#删除旧更新包
	rm -fr /var/lib/jenkins/git_path/.energy_emit_log/update_test.zip
	#不需要更新文件字符串与|串起来
	echo "更新忽略文件列表:"
	cat /var/lib/jenkins/git_path/.energy_emit_log/deny_file
	deny_files=$(sed -n '1h;1!H;${g;s/\n/|/g;p;}' /var/lib/jenkins/git_path/.energy_emit_log/deny_file)
	set -x
	git diff --name-only $update_version $test_version | grep -vE $deny_files >/var/lib/jenkins/git_path/.energy_emit_log/update.list
	set +x
	echo "最终更新文件列表:"
	cat /var/lib/jenkins/git_path/.energy_emit_log/update.list
	echo "文件打包位置:/var/lib/jenkins/git_path/.energy_emit_log/update_test.zip"
	cat /var/lib/jenkins/git_path/.energy_emit_log/update.list | xargs zip /var/lib/jenkins/git_path/.energy_emit_log/update_test.zip
else
	#删除旧更新包
	rm -fr /var/lib/jenkins/git_path/.energy_emit_log/update_test.zip
	set -x
	git checkout $update_version
	set +x

	deny_files=$(sed -n '1h;1!H;${g;s/\n/|/g;p;}' /var/lib/jenkins/git_path/.energy_emit_log/deny_file)
	git diff --name-only $update_version $test_version | grep -vE $deny_files >/var/lib/jenkins/git_path/.energy_emit_log/update.list
	cat /var/lib/jenkins/git_path/.energy_emit_log/update.list | xargs zip /var/lib/jenkins/git_path/.energy_emit_log/update_test.zip

	set -x
	git checkout master
	set +x
fi
echo "将本次更新版本写回本地版本local_version:$update_version"
echo $update_version>/var/lib/jenkins/git_path/.energy_emit_log/local_version
