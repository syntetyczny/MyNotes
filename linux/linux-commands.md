## nano
```
nano -Acpil name_file.cpp
```
-A, --smarthome
    Make the Home key smarter. When Home is pressed anywhere but at the very beginning of non-whitespace characters on a line, the cursor will jump to that beginning (either forwards or backwards). If the cursor is already at that position, it will jump to the true beginning of the line. 

-c, --const
    Constantly display the cursor position and line number on the statusbar. Note that this overrides -U. 

-p, --preserve
    Preserve the ^Q (XON) and ^S (XOFF) sequences so data being sent to the editor can be can be stopped and started. 

-i, --autoindent
    Automatically indent new lines to the same number of spaces and tabs as the previous line. 

-l, --nofollow
    When writing files, if the given file is a symbolic link, it is removed and a new file is created. 

## picocom
```
picocom --b 115200 /dev/ttyUSB0
```
To exit, what is not so straight forward. It is much easier to use if you want to analysie stream of data comming from device.
```
ctrl+a
ctrl+x
```
## tmux
To turn on tmux session
```
tmux
```
to exit without kill
```
Ctrl + b
```
then
```
d
```
to connect egain, check where it is
```
tmux ls
```
answere
```
syntetyczny@smcdesk:~$ tmux ls
0: 1 windows (created Mon Aug  3 08:04:01 2020) [80x23]
1: 1 windows (created Mon Aug  3 08:07:07 2020) [80x23]
```
and then attach to one you like
```
tmux attach -t 0
```
and then you can use terminal as you left last time

## usefull linux commends
To see actual system events
```
dmesg -w
```
it is usefull when you want to check if smth is actual interferencing started process.

To see what type of linux we are currentlu using you can use
```
lsb_release -a
```