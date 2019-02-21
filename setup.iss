; -- 64Bit.iss --
; Demonstrates installation of a program built for the x64 (a.k.a. AMD64)
; architecture.
; To successfully run this installation and the program it installs,
; you must have a "x64" edition of Windows.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=PewDiePie vs T-Series
AppVersion=1.0
DefaultDirName={pf}\PewDiePie vs T-Series
DefaultGroupName=PewDiePie vs T-Series
UninstallDisplayIcon={app}\subcount.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:PewDiePie vs T-Series
; "ArchitecturesAllowed=x64" specifies that Setup cannot run on
; anything but x64.
ArchitecturesAllowed=x64
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "C:\Users\Mathias\PycharmProjects\PewDiePie-vs-TSeries\subcount.exe"; DestDir: "{app}"; DestName: "subcount.exe"
Source: "C:\Users\Mathias\PycharmProjects\PewDiePie-vs-TSeries\python36.dll"; DestDir: "{app}"
Source: "C:\Users\Mathias\PycharmProjects\PewDiePie-vs-TSeries\avbin64.dll"; DestDir: "{app}"

[Icons]
Name: "{group}\PewDiePie vs T-Series"; Filename: "{app}\subcount.exe"
