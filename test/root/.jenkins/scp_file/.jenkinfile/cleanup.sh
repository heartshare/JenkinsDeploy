#!/usr/bin/env sh
cd /root/.jenkins/scp_file
echo "备份历史版本号"
set -x
cat ./test_version>./old_version
set +x

echo "将本次更新版本写回测试版本test_version"
cat ./local_version
set -x
cat ./local_version>./test_version
set +x

echo "删除更新包，删除解包文件，删除更新列表"
set -x
rm -fr local_version update_test.zip update.list update_test
set +x