; Batch DOS
; An DOSBox Wrapper by AutoIt
; Author: Nam Le
; leqnam@live.com, nam@nready.net
; https://nready.net
; First Release: 11/10/2010
; Open source: 01/23/2021
; MIT
;
Opt("TrayMenuMode", 1)
FileInstall("DOsBox.dll", @TempDir & "\DOsBox.exe", 1)
FileInstall("SDL.lib", @TempDir & "\SDL.dll", 1)
FileInstall("SDL_net.lib", @TempDir & "\SDL_net.dll", 1)
FileDelete(@TempDir & "\cmd.bat")
TrayTip("Batch DOSBox", "16bit Application Wrapper" & @CRLF & "from NREADY.NET", 0x001E, 1)

$Var0000 = FileOpenDialog("Choose a 16bit Application", "", "Exe 16bit (*.exe)", 1, "")

If @error Then Exit
FileWrite(@TempDir & "\BatchDOS.bat", "cls" & @CRLF & 'dosbox "' & $Var0000 & '" -noconsole -c "MOUNT Y C:\MyFolder"' & @CRLF & 'del "' & @TempDir & '\DOSBox.exe"' & @CRLF & 'del "' & @TempDir & '\SDL.dll"' & @CRLF & 'del "' & @TempDir & '\SDL_net.dll"' & @CRLF & 'del "' & @TempDir & '\BatchDOS.bat"')
Sleep(0x0064)
ShellExecute(@TempDir & "\BatchDOS.bat", "", @TempDir, "open", @SW_HIDE)