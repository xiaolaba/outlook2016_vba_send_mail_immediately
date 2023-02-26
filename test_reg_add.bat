:::: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/reg-add


::To add a registry entry to HKLM\Software\MyCo with a value named Data, the type REG_BINARY, and data of fe340ead, type:
::   reg add HKCU\SOFTWARE\Microsoft\Office\Outlook\Settings\Data /v a123 /t REG_BINARY /d fe340ead

set subKeyPath=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\Outlook\Settings\Data
set bin=global_Advanced_SendImmediately
set testbin={"""name""":"""Accessibility_Always_Show_Reminders_On_Top""","""itemClass""":"""""","""id""":"""""","""scope""":"""global""","""parentSetting""":"""""","""secondaryKey""":"""""","""status""":"""PENDINGSYNC""","""type""":"""Bool""","""timestamp""":0,"""metadata""":"""""","""value""":"""false""","""isFirstSync""":"""false""","""source""":"""UserOverride"""}


::"global_Advanced_SendImmediately"="{\"name\":\"Advanced_SendImmediately\",\"itemClass\":\"\",\"id\":\"\",\"scope\":\"global\",\"parentSetting\":\"\",\"secondaryKey\":\"\",\"status\":\"PENDINGSYNC\",\"type\":\"Bool\",\"timestamp\":0,\"metadata\":\"\",\"value\":\"false\",\"isFirstSync\":\"false\",\"source\":\"UserOverride\"}"


::reg add HKLM\Software\MyCo /v xiao /t REG_BINARY /d fe340ead

::reg add HKCU\SOFTWARE\Microsoft\Office\Outlook\Settings\Data /v a123 /t REG_BINARY /d fe340ead

::reg add %subKeyPath% /v a123 /t REG_BINARY /d fe340ead /f

reg add %subKeyPath% /v a234 /t REG_SZ /d {"""name"""} /f

reg add %subKeyPath% /v a456 /t REG_SZ /d %testbin% /f


::reg export %subKeyPath% subKeyPath.reg /y
pause
