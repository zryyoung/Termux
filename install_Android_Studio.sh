#!/bin/bash

# 更新包管理器
pkg update -y && pkg upgrade -y

# 安装必要软件包
pkg install x11-repo -y
pkg install termux-x11-nightly xfce4 openjdk-17 maven wget unzip tar -y

# 定义安装目录
INSTALL_DIR=/data/data/com.termux/files/usr/opt

# 创建安装目录
mkdir -p $INSTALL_DIR

# 下载 Android Studio 安装包
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.3.7/android-studio-2025.1.3.7-linux.tar.gz

# 解压到指定目录
tar -xzvf android-studio-2025.1.3.7-linux.tar.gz -C $INSTALL_DIR

# 设置环境变量（追加到 ~/.bashrc）
echo 'export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk-17' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
echo "export PATH=\$PATH:$INSTALL_DIR/android-studio/bin" >> ~/.bashrc

# 立即加载环境变量
source ~/.bashrc

# 创建桌面图标（可选，Termux X11 桌面环境用）
mkdir -p ~/Desktop
echo "[Desktop Entry]
Type=Application
Version=2025.1.3.7
Name=Android Studio
Comment=Run Android Studio
Icon=$INSTALL_DIR/android-studio/bin/studio.png
Exec=$INSTALL_DIR/android-studio/bin/studio.sh
Terminal=false
Path=
StartupNotify=true" > ~/Desktop/AndroidStudio.desktop

# 提示完成
echo "✅ Android Studio 2025.1.3.7 已安装完成！"
echo "你可以运行以下命令启动："
echo "$INSTALL_DIR/android-studio/bin/studio.sh"
