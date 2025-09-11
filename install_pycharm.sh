#!/bin/bash

# 更新包管理器
pkg update

# 安装所需软件包
pkg install x11-repo
pkg install termux-x11-nightly xfce4 openjdk-17 maven wget -y

# 下载 PyCharm 安装包（专业版，arm64）
wget https://download-cdn.jetbrains.com/python/pycharm-professional-2024.2.2-aarch64.tar.gz

# 解压安装包
tar -xzvf pycharm-professional-2024.2.2-aarch64.tar.gz -C /data/data/com.termux/files/usr/opt

# 重命名 jbr 目录（防止启动异常）
mv /data/data/com.termux/files/usr/opt/pycharm-2024.2.2/jbr /data/data/com.termux/files/usr/opt/pycharm-2024.2.2/jbr-old

# 可选：设置环境变量（加入 JDK 路径）
echo 'export PATH=$PATH:/data/data/com.termux/files/usr/opt/openjdk-17/bin' >> /data/data/com.termux/files/usr/opt/pycharm-2024.2.2/bin/pycharm.sh

# 创建桌面图标目录
mkdir -p ~/Desktop

# 创建 PyCharm 桌面图标
echo '[Desktop Entry]
Type=Application
Version=2024.2.2
Name=PyCharm
Comment=Run PyCharm
Icon=/data/data/com.termux/files/usr/opt/pycharm-2024.2.2/bin/pycharm.png
Exec=/data/data/com.termux/files/usr/opt/pycharm-2024.2.2/bin/pycharm.sh
Terminal=false
Path=
StartupNotify=false' >> ~/Desktop/pycharm.desktop

# 提示安装完成
echo "✅ PyCharm 已安装完成，请在桌面上找到 PyCharm 图标启动。"
