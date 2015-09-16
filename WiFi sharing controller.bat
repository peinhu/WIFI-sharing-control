@echo off

REM @version 1.0
REM @author Payne
REM @email huyang110yahoo@gmail.com
REM @github https://github.com/peinhu
REM @date 2015-09-12

echo ===========================
echo ==== WIFI������� v1.0 ====
echo ===========================
echo Tip:���п�����Ҫ����ԱȨ��
goto MenuShow

:MenuSelect
set input=
set /p input=��ѡ��
if not defined input ( goto Exception )
if %input%==0 ( goto WIFIStatus ) else if %input%==1 ( goto WIFISet ) else if %input%==2 ( goto WIFIStart ) else if %input%==3 ( goto WIFIStop ) else if %input%==bye ( goto Bye ) else if %input%==exit ( goto Exit ) else ( goto Exception )

:WIFIStatus
netsh wlan show hostednetwork
goto MenuSelect

:WIFISet
set ssid=
set /p ssid=������������(ssid):
if not defined ssid ( goto Exception )
set key=
set /p key=������������(key):
if not defined key ( goto Exception )
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
goto MenuSelect

:WIFIStart
netsh wlan start hostednetwork
echo ��������ȷ�� ��������-����-���� ���ѹ�ѡ�������ӹ���
echo.
goto MenuSelect

:WIFIStop
netsh wlan stop hostednetwork
goto MenuSelect

:Exception
echo ������Ч��ָ��!
goto MenuShow

:MenuShow
echo.
echo 1 - ����WIFI����
echo 2 - ����WIFI����
echo 3 - �ر�WIFI����
echo 0 - ��ʾWIFI״̬
echo bye/exit - �˳�
goto MenuSelect

:Bye
echo Bye!
ping -n 2 127.0.0.1 >nul
exit

:Exit
exit

