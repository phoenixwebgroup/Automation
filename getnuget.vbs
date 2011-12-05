Set wshShell = CreateObject( "WScript.Shell" )
PATH = wshShell.ExpandEnvironmentStrings( "PATH=%PATH%" )
Result = InStr(PATH,"C:\Nuget\")

if Result = 0 then

strFolder = "C:\Nuget"

set objFSO = createobject("Scripting.FileSystemObject")

if objFSO.FolderExists(strFolder) = False then
	objFSO.CreateFolder strFolder
else

end if

Set objShell = CreateObject("Wscript.Shell")
objShell.Run("powershell.exe -noexit . .\getnuget.ps1")
 
Set WshEnv = WshShell.Environment("SYSTEM") 
WshEnv("Path") = WshEnv("Path") & ";C:\Nuget\"

wscript.sleep(2000)

Set objShell = CreateObject("Wscript.Shell")
objShell.Run("powershell.exe -noexit . .\getenvironmentvariable.ps1")

else 
WScript.Echo("NuGet is already installed and in the path.")
end if
