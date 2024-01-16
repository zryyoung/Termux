# Termux
## Termux安装图形化界面

1. 安装必要的软件包：

   ```
   pkg install x11-repo
   pkg install xfce4
   pkg install xorg
   ```

2. 在新的 Termux 会话中设置 DISPLAY 变量并启动 Xfce：

   ```
   export DISPLAY=:0
   startxfce4 &
   ```

3. 打开新的 Termux 会话并运行 termux-x11：

   ```
   termux-x11 &
   ```

现在，你应该能够在 Termux 中看到 Xfce 图形界面。

请注意，这是一种基本的设置，可能会因设备和具体情况而有所不同。确保参考 Termux、Xfce 和 termux-x11 的文档以获取更详细的信息。
