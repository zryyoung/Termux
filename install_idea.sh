#!/bin/bash

# 更新包管理器
pkg update

# 安装所需软件包
pkg install -y x11-repo termux-x11-nightly xfce4 openjdk-17 maven wget tar

# 创建安装目录（如果不存在）
mkdir -p /data/data/com.termux/files/usr/opt

# 下载 IDEA 安装包（更新为 2025.2.1）
wget https://download.jetbrains.com/idea/ideaIU-2025.2.1-aarch64.tar.gz

# 解压安装包到指定目录
tar -xzvf ideaIU-2025.2.1-aarch64.tar.gz -C /data/data/com.termux/files/usr/opt

# 动态检测 IDEA 目录
IDEA_DIR=$(find /data/data/com.termux/files/usr/opt -maxdepth 1 -type d -name "idea-IU-*")
echo "Detected IDEA directory: $IDEA_DIR"

# 编辑 IDEA 启动脚本，添加 Java 路径
echo 'export PATH=$PATH:/data/data/com.termux/files/usr/opt/openjdk-17/bin' >> "$IDEA_DIR/bin/idea.sh"

# 可选：重命名 JBR 目录（如果使用 OpenJDK 替代 JetBrains Runtime）
if [ -d "$IDEA_DIR/jbr" ]; then
    mv "$IDEA_DIR/jbr" "$IDEA_DIR/jbr-old"
fi

# 创建 IDEA 桌面图标
mkdir -p ~/Desktop
echo "[Desktop Entry]
Type=Application
Version=$(basename $IDEA_DIR)
Name=IDEA
Comment=Run IDEA
Icon=$IDEA_DIR/bin/idea.png
Exec=$IDEA_DIR/bin/idea.sh
Terminal=false
StartupNotify=false" > ~/Desktop/IDEA.desktop

# 提示安装完成
echo "IDEA 2025.2.1 已安装完成，请在桌面上找到 IDEA 图标启动。"
