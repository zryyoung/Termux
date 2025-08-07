# Termux 网页图形化桌面及 Android Studio 安装尝试指南

本指南将引导你从零开始，在 Termux 中安装并配置一个完整的 XFCE4 图形化桌面环境，并通过任何现代浏览器进行访问。最后，本指南还将包含**实验性**的步骤，尝试安装 Android Studio。

**优点:**
* **无需客户端:** 只需手机上的浏览器即可访问桌面。
* **跨平台访问:** 同一局域网内的任何设备（电脑、平板）都可以访问。
* **流程完整:** 包含从环境搭建到应用安装的完整步骤。

---

## 步骤一：基础环境准备

首先，确保你的 Termux 是最新的。

```bash
pkg update && pkg upgrade -y
```

---

## 步骤二：安装核心组件

我们需要一次性安装所有必需的软件包，包括桌面环境和您脚本中提到的依赖。

```bash
pkg install x11-repo
pkg install termux-x11-nightly tigervnc xfce4 xfce4-goodies novnc websockify openjdk-17 maven wget -y
```

**组件说明:**
* `tigervnc`, `xfce4`, `novnc`, `websockify`: 用于搭建网页版桌面。
* `termux-x11-nightly`: 您的脚本中包含的依赖，用于 X11 图形支持。
* `openjdk-17`: Java 开发环境，是运行 Android Studio 的必需品。
* `maven`: Java 项目管理工具。
* `wget`: 用于从网络下载文件的工具。

---

## 步骤三：配置 VNC (仅需一次)

这一步是首次使用的初始化设置。

1.  **设置 VNC 连接密码**

    运行以下命令来启动 VNC 服务器的密码设置程序：
    ```bash
    vncserver
    ```
    > **重要提示:**
    > 系统会提示你输入并验证一个密码。此密码是之后从浏览器连接时所必需的，请务必记住。
    >
    > * 输入密码时，屏幕上不会显示任何字符，这是正常的安全措施。
    > * 密码长度至少需要6位。
    > * 接下来会询问是否设置一个 view-only (只能看不能操作) 的密码，直接输入 `n` 然后回车即可。

2.  **配置桌面环境**

    首次设置密码后，系统会自动启动一个临时的桌面。我们需要先将它关闭，然后配置成我们想要的 XFCE4 桌面。

    ```bash
    # 关闭刚才由系统启动的 :1 桌面
    vncserver -kill :1

    # 将 "启动 XFCE4 会话" 的命令写入 VNC 的启动配置文件中
    echo "xfce4-session &" > ~/.vnc/xstartup

    # 赋予该启动文件可执行权限
    chmod +x ~/.vnc/xstartup
    ```
    现在，VNC 服务器已经配置完毕，以后每次启动都会自动加载 XFCE4 桌面。

---

## 步骤四：启动并访问桌面

日常使用时，你需要执行以下两个步骤来启动服务。建议打开两个独立的 Termux 会话。

#### 4.1 在会话一：启动 VNC 服务器

```bash
vncserver -geometry 1600x900 -dpi 150 :1
```

成功后会提示 `New 'X' desktop is localhost:1`。

#### 4.2 在会话二：启动 noVNC 网页服务

```bash
novnc --listen 8080 --vnc localhost:5901
```

#### 4.3 连接桌面

1.  打开手机上的任意浏览器（如 Chrome, Firefox）。
2.  在地址栏输入 `http://localhost:8080` 并访问。
3.  点击 **Connect** 按钮，在弹出的密码框中输入你在 **步骤三** 中设置的 **VNC 密码**。
4.  连接成功后，你将看到一个完整的 XFCE4 桌面。

---

## (实验性) 步骤五：尝试安装 Android Studio

在进入这一步之前，请仔细阅读以下警告。

> ### **警告：架构不兼容与资源限制**
>
> 1.  **CPU 架构不匹配**: 您脚本中下载的 Android Studio 是 Google 官方发布的 **Linux 版**，它是为 `x86_64` 架构的 CPU (英特尔/AMD 电脑) 编译的。而几乎所有的安卓手机都使用 `aarch64` (ARM) 架构的 CPU。**因此，这个 `x86_64` 的程序无法在您的手机上直接运行。** 强行执行会报 `Exec format error` 之类的错误。
> 2.  **资源消耗巨大**: 完整的 Android Studio 需要至少 8GB 内存和强大的 CPU 才能勉强运行。手机的硬件资源远不能满足其要求，即使能通过模拟器运行，速度也会非常缓慢，几乎没有实用价值。
>
> **结论：以下步骤仅为流程演示，在普通手机上几乎注定会失败。** 一个更现实的方案是在 Termux 中使用 `code-server` (VS Code 网页版) 进行轻量级开发。

现在，我们将在已经运行的图形化桌面中，通过终端执行您脚本中的安装步骤。

#### 5.1 打开桌面中的终端

在浏览器显示的 XFCE4 桌面中，找到并打开一个终端模拟器 (Terminal Emulator) 应用。接下来的所有命令都在这个**桌面内的终端**里执行。

#### 5.2 下载并解压 Android Studio

```bash
# 下载您指定版本的 Android Studio (x86_64 架构)
wget [https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.2.11/android-studio-2025.1.2.11-linux.tar.gz](https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.2.11/android-studio-2025.1.2.11-linux.tar.gz)

# 解压到 /usr/opt 目录 (需要 sudo 或者 root 权限，在 Termux 环境下直接操作)
tar -xzvf android-studio-2025.1.2.11-linux.tar.gz -C /data/data/com.termux/files/usr/opt
```

#### 5.3 配置 Java 环境

这一步尝试用 Termux 自带的 OpenJDK 替换 Android Studio 内置的 Java 运行环境。

```bash
# 删除官方的 jbr 目录
rm -rf /data/data/com.termux/files/usr/opt/android-studio/jbr

# 链接 OpenJDK-17 作为新的 jbr
ln -s /data/data/com.termux/files/usr/opt/openjdk-17 /data/data/com.termux/files/usr/opt/android-studio/jbr
```

#### 5.4 创建桌面快捷方式

```bash
# 确保桌面目录存在
mkdir -p ~/Desktop

# 创建 .desktop 文件
echo '[Desktop Entry]
Type=Application
Version=2023.3.1
Name=Android Studio (Experimental)
Comment=Attempt to run Android Studio
Icon=/data/data/com.termux/files/usr/opt/android-studio/bin/studio.png
Exec=/data/data/com.termux/files/usr/opt/android-studio/bin/studio.sh
Terminal=false
Path=
StartupNotify=false' > ~/Desktop/AndroidStudio.desktop
```
执行完毕后，你的 XFCE4 桌面上应该会出现一个名为 "Android Studio (Experimental)" 的图标。

---

## 步骤六：验证结果

双击桌面上的 Android Studio 图标。

如前文警告所述，由于 CPU 架构不兼容，程序将无法启动。你什么也看不到，或者如果从终端里直接运行 `/data/data/com.termux/files/usr/opt/android-studio/bin/studio.sh`，会收到 `bad executable format` 或类似的错误信息。

这证明了直接在 ARM 架构的 Termux 上运行 x86_64 软件是行不通的。
