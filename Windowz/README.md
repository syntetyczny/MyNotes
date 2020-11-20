# Here will be tools which are very usefull in Windowz #
## Everything ##
Very fast and good file search
www.voidtools.com


## ConEmu ##
Multiple terminal manager. Many terminals with + in the middle
To run 4 Git Bash terminals use configuration as below
Settings -> Startup -> Task -> Add Group

```
set "PATH=%ConEmuDrive%\Program Files\Git\usr\bin;%PATH%" & "%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i -cur_console:n

-cur_console:s1TVn -cur_console:d:C:\Users\pdobrowolski set "PATH=%ConEmuDrive%\Program Files\Git\usr\bin;%PATH%" & "%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i

-cur_console:s1THn -cur_console:d:C:\Users\pdobrowolski set "PATH=%ConEmuDrive%\Program Files\Git\usr\bin;%PATH%" & "%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i

-cur_console:s2THn -cur_console:d:C:\Users\pdobrowolski set "PATH=%ConEmuDrive%\Program Files\Git\usr\bin;%PATH%" & "%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i
```
