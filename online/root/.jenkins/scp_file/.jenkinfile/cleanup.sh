#!/usr/bin/env sh
cd /root/.jenkins/scp_file
echo "备份历史版本号"
set -x
cat ./online_version>./old_version
set +x

echo "将本次更新版本写回线上版本online_version"
cat ./local_version
set -x
cat ./local_version>./online_version
set +x

echo "删除更新包，删除解包文件，删除更新列表"
set -x
rm -fr local_version update_online.zip update.list update_online
set +x