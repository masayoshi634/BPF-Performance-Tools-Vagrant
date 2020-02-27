### これはなに?
[BPF Performance Tools](http://www.brendangregg.com/bpf-performance-tools-book.html)の輪読会で動作確認に利用するVagrantfile
Ubuntuだと構築難易度が高いので、Arch Linuxで作っている

### 使い方
- vagrant upして起動するとbcc関連のツールをインストールされた状態で起動します
  - 初回起動持などパッケージのアップデートが走った場合はvagrant halt && vagrang up で1回再起動したほうが無難です
- vagrant ssh archlinuxで入って本で紹介されているコマンドを打ってみましょう
  - PATHは設定してあるのでそのまま実行すればok
```
[vagrant@archlinux ~]$ sudo execsnoop
PCOMM            PID    PPID   RET ARGS
sshd             17112  325      0 /usr/bin/sshd -D -R
bash             17115  17114    0 /bin/bash
tty              17116  17115    0 /usr/bin/tty
```
