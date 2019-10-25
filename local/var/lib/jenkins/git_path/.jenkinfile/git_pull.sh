#!/usr/bin/env sh
if [ -f /var/lib/jenkins/git_path/.energy_emit_log/last_version ]; then
  echo '上次构建失败,请检查'
  exit 1
fi
cd /var/lib/jenkins/git_path/energy_platform
echo 'git pull 最新版本'
git pull
#echo '检出版本，选择版本后，checkout文件，scp远程服务器'
echo "上次版本号:"&&cat /var/lib/jenkins/git_path/.energy_emit_log/local_version
echo "最新日志:\n-------------------start--------------------"
git log -5
show_log=$(git log -5)
echo $show_log|head -n 1|awk '{print \$2}'>/var/lib/jenkins/git_path/.energy_emit_log/last_version
echo "--------------------end---------------------"