Sleep(360000)
$CMDSTR=@ComSpec & " /c " & @ScriptDir & "\shutdown.bat"
RunWait($CMDSTR,@SystemDir,@sw_hide)
