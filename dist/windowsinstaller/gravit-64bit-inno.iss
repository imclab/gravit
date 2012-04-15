; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{95BFE5C6-C019-4CA9-A971-4D12F05AEBDC}
AppName=Gravit (64bit)
AppVersion=0.5.0
AppVerName=Gravit 0.5.0 (64bit)
AppPublisher=Gravit Development Team
AppPublisherURL=http://gravit.slowchop.com/
AppSupportURL=http://gravit.slowchop.com/
AppUpdatesURL=http://gravit.slowchop.com/
DefaultDirName={pf64}\Gravit
DefaultGroupName=Gravit
AllowNoIcons=true
LicenseFile=.\files\COPYING
InfoAfterFile=.\files\README.txt
OutputDir=.\
OutputBaseFilename=setup-gravit-0.5.0-64bit
Compression=lzma/Max
SolidCompression=true
WizardSmallImageFile=.\SmallImage.bmp
WizardImageFile=.\Image.bmp
ShowLanguageDialog=no
; minimum windows version: Windows XP x64 edition
MinVersion=,5.2.3790
; "ArchitecturesAllowed=x64" specifies that Setup cannot run on
; anything but x64.
ArchitecturesAllowed=x64
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64
SetupIconFile=.\files\gravit.ico
SourceDir=.\

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: ".\64bit\gravit.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\files\cfg\*.cfg"; DestDir: "{app}\cfg"; Flags: ignoreversion; Permissions: users-modify
Source: ".\files\COPYING"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\files\data\*"; DestDir: "{app}\data"; Flags: ignoreversion
Source: ".\64bit\*.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\files\spawn\*"; DestDir: "{app}\spawn"; Flags: ignoreversion; Permissions: users-modify
Source: ".\files\stderr.txt"; DestDir: "{app}"; Flags: ignoreversion onlyifdoesntexist; Permissions: users-modify
Source: ".\files\stdout.txt"; DestDir: "{app}"; Flags: ignoreversion onlyifdoesntexist; Permissions: users-modify
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
; include Microsoft VC 2008 SP1 Redistributable Package for x64
Source: ".\vc_redist\vcredist_x64.exe"; DestDir: "{tmp}"; Flags: ignoreversion overwritereadonly; Permissions: everyone-full

[Dirs]
Name: "{app}\cfg"; Permissions: users-modify; 
Name: "{app}\spawn"; Permissions: users-modify; 
Name: "{app}\save"; Flags: setntfscompression; Permissions: users-modify; 
Name: "{app}\screenshots"; Permissions: users-modify; 

[INI]
Filename: "{app}\gravit.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://gravit.slowchop.com"

[Registry]
; register software setting for gravit
Root: HKLM; Subkey: "Software\Gravit"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\Gravit"; ValueType: string; ValueName: "path"; ValueData: "{app}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Gravit"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\Gravit"; ValueType: string; ValueName: "path"; ValueData: "{app}"; Flags: uninsdeletekey

[Icons]
Name: "{group}\Gravit"; Filename: "{app}\gravit.exe"; WorkingDir: "{app}";
Name: "{group}\Gravit (Compatible Mode)"; Filename: "{app}\gravit.exe"; Parameters: """particlerendermode 0"""; WorkingDir: "{app}";
Name: "{group}\Install Gravit Screen Saver"; Filename: "{app}\gravit.exe"; Parameters: "installscreensaver quit"; WorkingDir: "{app}";
Name: "{group}\Configure\Customise Gravit (gravit.cfg)"; Filename: "{win}\notepad.exe"; Parameters: "{app}\cfg\gravit.cfg";
Name: "{group}\Configure\Customise Screen Saver (screensaver.cfg)"; Filename: "{win}\notepad.exe"; Parameters: "{app}\cfg\screensaver.cfg";
Name: "{group}\Visit Gravit on the Internet"; Filename: "{app}\gravit.url"
Name: "{group}\{cm:UninstallProgram,Gravit}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Gravit"; Filename: "{app}\gravit.exe"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Gravit"; Filename: "{app}\gravit.exe"; WorkingDir: "{app}"; Tasks: quicklaunchicon

[Run]
; install vcredist_x64.exe
Filename: {tmp}\vcredist_x64.exe; Parameters: "/q:a /c:""vcredist_x64.exe /q:a /c:""""msiexec /i vcredist.msi /qn"""" """; StatusMsg: "Installing MS Visual C++ 2008 SP1 Redistributable Package (x64) ..."; Flags: waituntilterminated;
; post-install tasks
Filename: "{win}\notepad.exe"; Parameters: "{app}\cfg\gravit.cfg"; Description: "Modify gravit.cfg (Recommended)"; Flags: nowait postinstall skipifsilent
Filename: "{app}\gravit.exe"; Description: "Install Gravit Screensaver"; Parameters: "installscreensaver quit"; Flags: nowait postinstall skipifsilent
Filename: "{app}\gravit.exe"; Description: "{cm:LaunchProgram,Gravit}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\gravit.url"
