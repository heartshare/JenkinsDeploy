#!/usr/bin/env sh
echo "scp测试服务器回滚版本号到本地"
set -x
scp root@testServer_ip:/root/.jenkins/scp_file/old_version /var/lib/jenkins/git_path/.energy_emit_log/old_version 
set +x