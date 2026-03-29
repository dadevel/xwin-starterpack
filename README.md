# xwin-starterpack

> Develop and debug Windows software on Linux with the power of [Clang](https://clang.llvm.org/) and [Xwin](https://github.com/jake-shadle/xwin/).

Install LLVM and OpenSSH in a Windows VM.

~~~ powershell
winget install --source=winget --id=LLVM.LLVM

Add-WindowsCapability -Online -Name OpenSSH.Server
[System.IO.File]::WriteAllLines('C:\ProgramData\ssh\administrators_authroized_keys', 'YOUR SSH PUBLIC KEY HERE', (New-Object System.Text.UTF8Encoding $false))
icacls.exe C:\ProgramData\ssh\administrators_authorized_keys /inheritance:r /grant Administrators:F /grant SYSTEM:F
New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH' -Name DefaultShell -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -PropertyType String -Force
Set-Service -Name sshd -StartupType 'Automatic'
Restart-Service sshd
~~~

Forward the ports used by LLDB from your Linux machine over SSH to the Windows VM.

~~~ bash
ssh -L 127.0.0.1:1234:127.0.0.1:1234 -L 127.0.0.1:2345:127.0.0.1:2345 administrator@windev
~~~

Start the LLDB server on Windows.

~~~ powershell
mkdir C:\Build
cd C:\Build
& "C:\Program Files\LLVM\bin\lldb-server.exe" platform --server --listen 1234 --gdbserver-port 2345
~~~

Back on Linux open this project in Visual Studio Code and confirm the *Reopen in Container* recommendation.

~~~ bash
code .
~~~

When you are using Podman instead of Docker you need an additional environment variable.

~~~ bash
DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock code .
~~~

That's it.
Now you are ready to go.

References:

- [Cross compiling Windows binaries from Linux](https://jake-shadle.github.io/xwin/)
- [Introducing the Universal CRT](https://devblogs.microsoft.com/cppblog/introducing-the-universal-crt/)
- [LLDB DAP](https://github.com/llvm/vscode-lldb)
