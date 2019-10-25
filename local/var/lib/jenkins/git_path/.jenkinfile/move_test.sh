#!/usr/bin/env sh
echo "scp文件到测试服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/update_test.zip root@testServer_ip:/root/.jenkins/scp_file/
set +x

echo "scp版本号到测试服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/local_version root@testServer_ip:/root/.jenkins/scp_file/
set +x

echo "scp文件更新列表到测试服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/update.list root@testServer_ip:/root/.jenkins/scp_file/
set +x