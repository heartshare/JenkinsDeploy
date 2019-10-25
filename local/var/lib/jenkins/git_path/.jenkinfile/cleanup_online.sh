#!/usr/bin/env sh
cd /var/lib/jenkins/git_path/.energy_emit_log
echo "将本次更新版本写回线上版本online_version"
cat ./local_version
set -x
cat ./local_version>./online_version
set +x

echo "删除更新包，删除解包文件，删除更新列表"
set -x
rm -fr last_version update_online.zip update.list
set +x