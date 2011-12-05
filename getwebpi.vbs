Set objShell = CreateObject("Wscript.Shell")
objShell.Run("powershell.exe -noexit . .\getwebpi.ps1")

wscript.sleep(7000)

currentdirectory =  CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
ZipFile = currentdirectory & "\" & "myfile.zip"

Function Unzip(strFileName,strFolderName)
	Dim objshell, objfso

	' Create Shell.Application so we can use the CopyHere method
	Set objshell = CreateObject("Shell.Application")

	' Create FileSystemObject so we can use FolderExists and CreateFolder if necessary
	Set objfso = CreateObject("Scripting.FileSystemObject")
	objshell.NameSpace(strFolderName).CopyHere objshell.NameSpace(strFileName).Items

	Set objfso = Nothing
	Set objshell = Nothing
End Function

Unzip ZipFile, currentdirectory

wscript.sleep(5000)

objShell.Run("webpicmdline.exe /Products:ASP.Net MVC 2")

wscript.sleep(5000)

objShell.Run("webpicmdline.exe /Products:ASP.Net MVC 3 (Visual Studio 2010)")