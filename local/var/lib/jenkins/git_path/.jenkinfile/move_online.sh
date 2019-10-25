#!/usr/bin/env sh
echo "scp文件到线上服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/update_online.zip root@onlineServer_ip:/root/.jenkins/scp_file/
set +x

echo "scp版本号到线上服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/local_version root@onlineServer_ip:/root/.jenkins/scp_file/
set +x

echo "scp文件更新列表到线上服务器"
set -x
scp /var/lib/jenkins/git_path/.energy_emit_log/update.list root@onlineServer_ip:/root/.jenkins/scp_file/
set +x