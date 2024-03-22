#!/bin/bash

# 更新包管理器
pkg update

# 安装所需软件包
pkg install x11-repo
pkg install termux-x11-nightly xfce4 openjdk-17 maven wget -y

# 下载 IDEA 安装包
wget https://download-cdn.jetbrains.com.cn/idea/ideaIU-2023.3.6-aarch64.tar.gz

# 解压安装包到指定目录
tar -xzvf ideaIU-2023.3.6-aarch64.tar.gz -C /data/data/com.termux/files/usr/opt

# 编辑 IDEA 启动脚本
echo 'export PATH=$PATH:/data/data/com.termux/files/usr/opt/openjdk-17/bin' >> /data/data/com.termux/files/usr/opt/idea-IU-233.15026.9/bin/idea.sh

# 重命名 jbr 目录
mv /data/data/com.termux/files/usr/opt/idea-IU-233.15026.9/jbr /data/data/com.termux/files/usr/opt/idea-IU-233.15026.9/jbr-old

# 创建 IDEA 图标
mkdir ~/Desktop
echo '[Desktop Entry]
Type=Application
Version=233.15026.9
Name=IDEA
Comment=Run IDEA
Icon=/data/data/com.termux/files/usr/opt/idea-IU-233.15026.9/bin/idea.png
Exec=/data/data/com.termux/files/usr/opt/idea-IU-233.15026.9/bin/idea.sh
Terminal=false
Path=
StartupNotify=false' >> ~/Desktop/IDEA.desktop

# 提示安装完成
echo "IDEA 已安装完成，请在桌面上找到 IDEA 图标启动。"