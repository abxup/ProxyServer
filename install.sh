#!/bin/bash

# 更新软件包列表
apt-get update
apt-get upgrade -y

# 安装 screen
apt install -y screen

# 下载 install.sh 脚本到本地
curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh -o install-x-ui.sh

# 赋予执行权限
chmod +x install-x-ui.sh

# 执行本地脚本
./install-x-ui.sh

# 在后台screen会话中运行 x-ui
screen -dmS x-ui-session bash -c 'cd /usr/local/x-ui && ./x-ui'

# 安装 Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# 在后台screen会话中运行 tailscaled
screen -dmS tailscale-session bash -c 'tailscaled'
