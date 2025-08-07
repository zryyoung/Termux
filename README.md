# Termux/ZeroTermux

## 安装图形化界面

利用官方提供的图形显示软件Termux-x11，并安装xfce4图形化桌面显示。
注意要先下载 [Termux](https://github.com/termux/termux-app/releases)/[ZeroTermux](https://od.ixcmstudio.cn/repository/main/ZeroTermux/)和[Termux-x11](https://github.com/termux/termux-x11/releases)应用

1.  打开Termux/ZeroTermux，更新源：

    ```bash
    pkg update && pkg upgrade
    ```

2.  安装必要的软件包：

    ```bash
    pkg install x11-repo xfce4 termux-x11-nightly -y
    ```

3.  运行 termux-x11：

    ```bash
    termux-x11 &
    ```

4.  在新的 Termux 会话中设置 DISPLAY 变量并启动 Xfce：

    ```bash
    export DISPLAY=:0
    startxfce4 &
    ```

5.  打开termux-x11应用，显示桌面

## 安装 Java 集成开发环境AndroidStudio

```bash
wget [https://github.com/3431018930/Android-Studio/main/install_AndroidStudio.sh](https://github.com/3431018930/Android-Studio/main/install_AndroidStudio.sh) && bash install_AndroidStudio.sh
