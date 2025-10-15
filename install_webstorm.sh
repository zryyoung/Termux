#!/bin/bash

# 更新包管理器
pkg update -y

# 安装所需软件包
pkg install x11-repo -y
pkg install termux-x11-nightly xfce4 openjdk-17 wget -y

# 下载 WebStorm 安装包（2025.2.3 aarch64）
wget https://download.jetbrains.com/webstorm/WebStorm-2025.2.3-aarch64.tar.gz -O WebStorm-2025.2.3-aarch64.tar.gz

# 解压安装包到指定目录
tar -xzvf WebStorm-2025.2.3-aarch64.tar.gz -C /data/data/com.termux/files/usr/opt

# 假设解压后的目录为 WebStorm-252.26830.93
WEBSTORM_DIR="WebStorm-252.26830.93"

# 删除 jbr 目录，避免兼容问题，减小体积
rm -rf "/data/data/com.termux/files/usr/opt/$WEBSTORM_DIR/jbr"

# 创建桌面图标
mkdir -p ~/Desktop
echo "[Desktop Entry]
Type=Application
Version=252.26830.93
Name=WebStorm
Comment=Run WebStorm
Icon=/data/data/com.termux/files/usr/opt/$WEBSTORM_DIR/bin/webstorm.png
Exec=/data/data/com.termux/files/usr/opt/$WEBSTORM_DIR/bin/webstorm.sh
Terminal=false
Path=
StartupNotify=false" > ~/Desktop/WebStorm.desktop

# 提示安装完成
echo "WebStorm 2025.2.3 已安装完成，请在桌面上找到 WebStorm 图标启动。"