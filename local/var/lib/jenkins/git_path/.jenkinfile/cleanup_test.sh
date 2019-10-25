#!/usr/bin/env sh
cd /var/lib/jenkins/git_path/.energy_emit_log
echo "将本次更新版本写回测试版本test_version"
cat ./local_version
set -x
cat ./local_version>./test_version
set +x

echo "删除更新包，删除解包文件，删除更新列表"
set -x
rm -fr last_version update_test.zip update.list
set +x