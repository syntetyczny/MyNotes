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
To se actual system events
```
dmesg -w
```
it is usefull when you want to check if smth is actual interferencing started process.