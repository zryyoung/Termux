# Termux/ZeroTermux
## 安装图形化界面
利用官方提供的图形显示软件Termux-x11，并安装xfce4图形化桌面显示。
注意要先下载 [Termux](https://github.com/termux/termux-app/releases)/[ZeroTermux](https://od.ixcmstudio.cn/repository/main/ZeroTermux/)和[Termux-x11](https://github.com/termux/termux-x11/releases)应用

1. 打开Termux/ZeroTermux，更新源：

   ```
   pkg update && pkg upgrade
   ```
   
2. 安装必要的软件包：

   ```
   pkg install x11-repo xfce4 termux-x11-nightly -y   
   ```

3. 在新的 Termux 会话中设置 DISPLAY 变量并启动 Xfce：

   ```
   export DISPLAY=:0
   startxfce4 &
   ```

4. 运行 termux-x11：

   ```
   termux-x11 &
   ```
   
5. 打开termux-x11应用，显示桌面

## 安装 Firefox 火狐浏览器

   ```
   pkg install firefox
   ```

打开桌面环境，点击桌面下方的浏览器图标，就可以使用firefox了，仅此而已



