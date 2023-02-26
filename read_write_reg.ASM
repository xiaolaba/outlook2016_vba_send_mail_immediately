;ref https://xiaolaba.wordpress.com/2015/03/06/win32asm-read-write-windows-registry/


format PE GUI 4.0
 
include "Win32A.Inc"
;include 'api\kernel32.inc'
include 'api\user32.inc'
 
entry start


section ".code" code readable executable
 

start:

        invoke  RegOpenKeyExA, HKEY_CURRENT_USER, sKey, 0, KEY_SET_VALUE, phkresult
        cmp eax, 0 ; ERROR_SUCCESS
        jnz @F   ;if fail, skip the msgbox following
        invoke MessageBox, 0, szMsg, szDlgOpenTitle, 0
@@:
        invoke  lstrlen, lpData ; eax = lenght of lpData
        invoke  RegSetValueExA, [phkresult], lpValueName, 0, REG_SZ, lpData, eax
        cmp eax, 0 ; ERROR_SUCCESS
        jnz @F ;if fail, skip the msgbox following
        invoke MessageBox, 0, szMsg, szDlgSetTitle, 0
@@:
        invoke  RegCloseKey, [phkresult]
exit:
        invoke  ExitProcess, 0




section ".data" data readable writeable

; outlook 2016, Microsoft office
;HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail

sKey            db "SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail",0
phkresult       dd ?

lpValueName     db "Text File",0
lpData          db "hello xiaolaba",0

 
szMsg   db "ERROR_SUCCESS=0",13,"test ok"
        db 0
szDlgOpenTitle db "Registry open test",0
szDlgSetTitle  db "Registry set test",0




section ".idata" import data readable writable
 
        library  kernel32,      "kernel32.dll",\
                 advapi32,      "advapi32.dll",\
                 user32,        "USER32.DLL"
 
        import   kernel32,\
                 lstrlen,       "lstrlenA",\
                 ExitProcess,   "ExitProcess"
 
        import   advapi32,\
                 RegOpenKeyExA, "RegOpenKeyExA",\
                 RegSetValueExA, "RegSetValueExA",\
                 RegCloseKey,   "RegCloseKey",\
                 RegCreateKeyExA, "RegCreateKeyExA"













