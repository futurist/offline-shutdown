@set testIP=192.168.1.1
@echo ���ڼ��%testIP%״̬���ϵ��Զ��ػ�, ����رձ�����

:start
@set count=0
@set kill=3

:test
@rem DELAY for some time
@rem If no sleep.exe, use below as alternative:
@rem ping 127.0.0.1 -n 2 -w 1000 > nul
@rem ping 127.0.0.1 -n %1% -w 1000> nul
@sleep 10

@rem @echo ����Ƿ���ڶ�����������ת���ۼӵ�count���������������!192.168.1.1���������
ping %testIP% -n 1 | find /i "TTL" && goto start || goto loop

:loop
@rem @echo �ۼ�count���������Ƿ�ﵽԤ��ֵ���ﵽ����ת�ػ�
@set /a count=%count%+1
@echo %testIP% �޷����� %count%
@if %count%==%kill% goto end
@goto test

:end
@echo Ҫ�ػ���~~~~
shutdown -s -f -t 1
