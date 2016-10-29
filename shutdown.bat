

@set testIP=192.168.1.1
@echo 正在检测%testIP%状态并断电自动关机, 请勿关闭本窗口

:start
@set count=0
@set kill=20

:test
@rem DELAY for some time
@rem If no sleep.exe, use below as alternative:
@rem ping 127.0.0.1 -n 2 -w 1000 > nul
@rem ping 127.0.0.1 -n %1% -w 1000> nul
@sleep 10

@rem @echo 检查是否存在丢包，有则跳转并累加到count变量里，无则持续检测!192.168.1.1是你的网关
ping %testIP% -n 1 | find /i "Request timed out." && goto loop || goto start

:loop
@rem @echo 累加count，并测试是否达到预定值，达到则跳转关机
@set /a count=%count%+1
@echo %testIP% 无法连接 %count%
@if %count%==%kill% goto end
@goto test

:end
@echo 要关机咯~~~~
shutdown -s -f -t 1


