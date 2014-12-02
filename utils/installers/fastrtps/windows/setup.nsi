# Auto-generated by EclipseNSIS Script Wizard
# 30-nov-2012 15:13:07

Name "Fast RTPS"

### Necesario para tener permisos de borrar ciertos ficheros al desinstalar
RequestExecutionLevel admin

#!define VERSION "1.0.0"


# General Symbol Definitions
!define REGKEY "SOFTWARE\$(^Name)"
!define COMPANY eProsima
!define URL www.eprosima.com
#!define VERSION ${VERSION}

# MUI Symbol Definitions
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-colorful.ico"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-colorful.ico"
!define MUI_UNFINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_REGISTRY_KEY ${REGKEY}
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "eProsima\FastRTPS"
!define LIB_BOOST_PATH $%LIB_BOOST_PATH%

# Included files
!include Sections.nsh
!include MUI2.nsh
!include EnvVarUpdate.nsh
!include x64.nsh

# Installer sections Has to be defined at the beginning because they are used by EnvVarPage.nsh
SectionGroup "Libraries" SECGRP0000
     Section "x64 VS2010 libraries" SEC_LIB_x64VS2010
         SetOutPath $INSTDIR\lib\x64Win64VS2010
         SetOverwrite on
         File /r "..\..\..\..\lib\x64Win64VS2010\*"
		 File /r "..\..\..\..\thirdparty\fastcdr\lib\x64Win64VS2010\*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2010\boost_thread*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2010\boost_system*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2010\boost_date_time*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2010\boost_chrono*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2010\boost_regex*"
		 WriteRegStr HKLM "${REGKEY}\Components" "x64 VS2010 libraries" 1
		 # Copy visual studio redistributable for x64
         SetOutPath $TEMP
         #File "redistributables\vcredist_x64_VS2010.exe"
     SectionEnd

    Section "i86 VS2010 libraries" SEC_LIB_i86VS2010
        SetOutPath $INSTDIR\lib\i86Win32VS2010
        SetOverwrite on
        File /r "..\..\..\..\lib\i86Win32VS2010\*"
		File /r "..\..\..\..\thirdparty\fastcdr\lib\i86Win32VS2010\*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2010\boost_thread*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2010\boost_system*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2010\boost_date_time*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2010\boost_chrono*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2010\boost_regex*"
        WriteRegStr HKLM "${REGKEY}\Components" "i86 VS2010 libraries" 1
		# Copy visual studio redistributable for i86
        SetOutPath $TEMP
        #File "redistributables\vcredist_x86_VS2010.exe"
    SectionEnd
	
	Section "x64 VS2013libraries" SEC_LIB_x64VS2013
         SetOutPath $INSTDIR\lib\x64Win64VS2013
         SetOverwrite on
		 File /r "..\..\..\..\lib\x64Win64VS2013\*"
		 File /r "..\..\..\..\thirdparty\fastcdr\lib\x64Win64VS2013\*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2013\boost_thread*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2013\boost_system*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2013\boost_date_time*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2013\boost_chrono*"
		 File /r "${LIB_BOOST_PATH}\lib\x64Win64VS2013\boost_regex*"
		 WriteRegStr HKLM "${REGKEY}\Components" "x64 VS2013 libraries" 1
		 # Copy visual studio redistributable for x64
         SetOutPath $TEMP
        # File "redistributables\vcredist_x64_VS2013.exe"
     SectionEnd

    Section "i86 VS2013 libraries" SEC_LIB_i86VS2013
        SetOutPath $INSTDIR\lib\i86Win32VS2013
        SetOverwrite on
        File /r "..\..\..\..\lib\i86Win32VS2013\*"
		File /r "..\..\..\..\thirdparty\fastcdr\lib\i86Win32VS2013\*"
		File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2013\boost_thread*"
		 File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2013\boost_system*"
		 File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2013\boost_date_time*"
		 File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2013\boost_chrono*"
		 File /r "${LIB_BOOST_PATH}\lib\i86Win32VS2013\boost_regex*"
        WriteRegStr HKLM "${REGKEY}\Components" "i86 VS0213 libraries" 1
		# Copy visual studio redistributable for i86
        SetOutPath $TEMP
        #File "redistributables\vcredist_x86_VS2013.exe"
    SectionEnd
SectionGroupEnd

!include EnvVarPage.nsh
!include InstallRedistributables.nsh
#!include InstallRedistributablesVS2010.nsh
#!include InstallRedistributablesVS2013.nsh

# Variables
Var StartMenuGroup

# Reserved Files
ReserveFile "${NSISDIR}\Plugins\newadvsplash.dll"
# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE ..\..\..\..\doc\licenses\FASTRTPS_LIBRARY_LICENSE.txt 
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE ComponentsPageLeave
!insertmacro MUI_PAGE_COMPONENTS
Page custom VariablesEntornoPage
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
var /GLOBAL RICHI_FINISH_MESSAGE
!define MUI_FINISHPAGE_TEXT $RICHI_FINISH_MESSAGE
!define MUI_FINISHPAGE_SHOWREADME $INSTDIR\README.html  ##qué archivo?
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English

# Installer attributes
OutFile eProsima_RTPS_${VERSION}.exe
InstallDir "$PROGRAMFILES\eProsima\eRTPS"
CRCCheck on
XPStyle on
ShowInstDetails show
VIProductVersion ${VERSION}.0
VIAddVersionKey ProductName FastRTPS
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey CompanyName "${COMPANY}"
VIAddVersionKey CompanyWebsite "${URL}"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright ""
InstallDirRegKey HKLM "${REGKEY}" Path
ShowUninstDetails show

# Installer sections. 
Section -post SEC0006
    SetShellVarContext all
    
    # Copy documentation.
    #SetOutPath $INSTDIR\doc
    #SetOverwrite on
	#File "..\..\..\..\doc\index.html" 
	SetOutPath $INSTDIR\doc\pdf
    SetOverwrite on
    File /r "..\..\..\..\doc\pdf\*" 
	# Copy doxygen documentation
    SetOutPath $INSTDIR\doc\html
    SetOverwrite on
	#Copy latex documentation
    File /r "..\..\..\..\utils\doxygen\output\doxygen\html\*"
	#SetOutPath $INSTDIR\doc\doxygen\latex
    #SetOverwrite on
    #File /r "..\..\..\..\doc\doxygen\latex\*"
    
    # TODO All examples
    # Copy examples.
    SetOutPath $INSTDIR\examples\C++
    SetOverwrite on
	File /r "..\..\..\..\utils\useTests\*"
	
	SetOutPath $INSTDIR\examples\ShapesDemo
    SetOverwrite on
	File /r "..\..\..\..\utils\ShapesDemo\files\*"
	SetOutPath $INSTDIR\examples\ShapesDemo\bin
    SetOverwrite on
	File /r "..\..\..\..\utils\ShapesDemo\release\*.exe"
	
	
	SetOutPath $INSTDIR\rtpsgen
    SetOverwrite on
	File /r "..\..\..\..\rtpsgen\scripts\*"
	File /r "..\..\..\..\rtpsgen\lib\*"
	
	#Copy fastcdr include files
	SetOutPath $INSTDIR\include
    SetOverwrite on
    File /r ..\..\..\..\thirdparty\fastcdr\include\*
	
	#Copy eProsima_cpp include files
	SetOutPath $INSTDIR\include\eProsima_cpp
    SetOverwrite on
    File /r ..\..\..\..\thirdparty\eprosima-common-code\eProsima_cpp\*
	
	#Copy fastcdr libraries
    
    
    # # Copy fastrpcgen java classes.
    # SetOutPath $INSTDIR\classes
    # SetOverwrite on
    # File /r ..\..\..\..\classes\*
        
    # # Copy fastrpcgen script.
    # SetOutPath $INSTDIR\scripts
    # SetOverwrite on
    # File ..\..\..\..\scripts\fastrpcgen.bat
    
    # # Copy IDL.
    # SetOutPath $INSTDIR\idl
    # SetOverwrite on
    # File ..\..\..\..\idl\MessageHeader.idl
    
    # Copy header files.
    SetOutPath $INSTDIR\include
    SetOverwrite on
    File /r ..\..\..\..\include\*

    # # Copy eProsima header files.
    # SetOutPath $INSTDIR\include\fastrpc\eProsima_cpp
    # File "$%EPROSIMADIR%\code\eProsima_cpp\eProsima_auto_link.h"
    # File "$%EPROSIMADIR%\code\eProsima_cpp\eProsimaMacros.h"

    # # Copy fastcdr header files.
    # SetOutPath $INSTDIR\include
    # SetOverwrite on
    # File /r $%FASTCDR%\include\*
    # SetOutPath $INSTDIR\include\fastcdr\eProsima_cpp
    # File "$%EPROSIMADIR%\code\eProsima_cpp\eProsima_auto_link.h"
    # File "$%EPROSIMADIR%\code\eProsima_cpp\eProsimaMacros.h"
    
    # Copy licensies
    SetOutPath $INSTDIR
    SetOverwrite on
    File /r ..\..\..\..\doc\licenses\*
    File ..\..\..\..\README.html
	File ..\..\..\..\*.png
    
    WriteRegStr HKLM "${REGKEY}" Path $INSTDIR
    SetOutPath $INSTDIR
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $SMPROGRAMS\$StartMenuGroup
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\README.lnk" $INSTDIR\README.html
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk" $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayName "$(^Name)"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayVersion "${VERSION}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" Publisher "${COMPANY}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" URLInfoAbout "${URL}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoModify 1
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)" NoRepair 1
    
    ### Actualizamos las variables de entorno que se hayan marcado
    ${If} $CheckboxfastrtpsHOME_State == ${BST_CHECKED}
       ${EnvVarUpdate} $0 "FASTRTPSHOME" "P" "HKLM" "$INSTDIR"
       WriteRegStr HKLM "${REGKEY}\Components" "FASTRTPSHOME" 1
    ${EndIf}
    ${If} $CheckboxScripts_State == ${BST_CHECKED}
       ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\rtpsgen"
       WriteRegStr HKLM "${REGKEY}\Components" "Script location" 1
    ${EndIf}
    ${If} ${SectionIsSelected} ${SEC_LIB_x64VS2010}
        ${If} $CheckboxX64_VS2010_State == ${BST_CHECKED}
             ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\lib\x64Win64VS2010"
             WriteRegStr HKLM "${REGKEY}\Components" "x64 VS0210 libraries location" 1
        ${EndIf}
    ${EndIf}
    ${If} ${SectionIsSelected} ${SEC_LIB_i86VS2010}
        ${If} $CheckboxI86_VS2010_State == ${BST_CHECKED}
             ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\lib\i86Win32VS2010"
             WriteRegStr HKLM "${REGKEY}\Components" "i86 VS2010 libraries location" 1
        ${EndIf}
    ${EndIf}
	${If} ${SectionIsSelected} ${SEC_LIB_x64VS2013}
        ${If} $CheckboxX64_VS2013_State == ${BST_CHECKED}
             ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\lib\x64Win64VS2013"
             WriteRegStr HKLM "${REGKEY}\Components" "x64 VS2013 libraries location" 1
        ${EndIf}
    ${EndIf}
    ${If} ${SectionIsSelected} ${SEC_LIB_i86VS2013}
        ${If} $CheckboxI86_VS2013_State == ${BST_CHECKED}
             ${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR\lib\i86Win32VS2013"
             WriteRegStr HKLM "${REGKEY}\Components" "i86 VS2013 libraries location" 1
        ${EndIf}
    ${EndIf}
	
	# Comprobamos si tiene instalado los redistributables de Visual Studio
    Call InstallRedistributables
	#Call InstallRedistributablesVS2013
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKLM "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o "-un.i86 VS0210 libraries" UNSEC_LIB_i86VS2010
    RmDir /r /REBOOTOK $INSTDIR\lib\i86Win32VS2010
    DeleteRegValue HKLM "${REGKEY}\Components" "i86 VS2010 libraries"
SectionEnd

Section /o "-un.x64 VS2010 libraries" UNSEC_LIB_x64VS2010
    RmDir /r /REBOOTOK $INSTDIR\lib\x64Win64VS2010
    DeleteRegValue HKLM "${REGKEY}\Components" "x64 VS2010 libraries"
SectionEnd

Section /o "-un.i86 VS2013 libraries" UNSEC_LIB_i86VS2013
    RmDir /r /REBOOTOK $INSTDIR\lib\i86Win32VS2013
    DeleteRegValue HKLM "${REGKEY}\Components" "i86 VS2013 libraries"
SectionEnd

Section /o "-un.x64 VS0213 libraries" UNSEC_LIB_x64VS2013
    RmDir /r /REBOOTOK $INSTDIR\lib\x64Win64VS2013
    DeleteRegValue HKLM "${REGKEY}\Components" "x64 VS2013 libraries"
SectionEnd

Section -un.post UNSEC0006
    SetShellVarContext all
    
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$(^Name)"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Uninstall $(^Name).lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\README.lnk"
    Delete /REBOOTOK $INSTDIR\uninstall.exe
    DeleteRegValue HKLM "${REGKEY}" StartMenuGroup
    DeleteRegValue HKLM "${REGKEY}" Path
    DeleteRegKey /IfEmpty HKLM "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKLM "${REGKEY}"
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup
    RmDir /REBOOTOK $INSTDIR\lib
    RmDir /r /REBOOTOK $INSTDIR\include
    RmDir /r /REBOOTOK $INSTDIR\idl
    RmDir /r /REBOOTOK $INSTDIR\rtpsgen
    RmDir /r /REBOOTOK $INSTDIR\classes
    RmDir /r /REBOOTOK $INSTDIR\examples
    RmDir /r /REBOOTOK $INSTDIR\doc
    RmDir /r /REBOOTOK $INSTDIR
    
    ### Quitamos las variables de entorno
    DeleteRegValue HKLM "${REGKEY}\Components" "i86 VS2010 libraries location"
    DeleteRegValue HKLM "${REGKEY}\Components" "x64 VS2010 libraries location"
	DeleteRegValue HKLM "${REGKEY}\Components" "i86 VS2013 libraries location"
    DeleteRegValue HKLM "${REGKEY}\Components" "x64 VS2013 libraries location"
    DeleteRegValue HKLM "${REGKEY}\Components" "Script location"
    DeleteRegValue HKLM "${REGKEY}\Components" "fastrtpsHOME"
    
    ${un.EnvVarUpdate} $0 "fastrtpsHOME" "R" "HKLM" "$INSTDIR"
    ${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\rtpsgen"
    ${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\lib\x64Win64VS2010"
    ${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\lib\i86Win32VS2010"
	${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\lib\x64Win64VS2013"
    ${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR\lib\i86Win32VS2014"
SectionEnd

# Installer functions
Function .onInit
	# La variable PROGRAMFILES depende de si estamos en x64 o i86
    ${If} ${RunningX64}
       StrCpy '$INSTDIR' '$PROGRAMFILES64\eProsima\FastRTPS'
    ${else}
       StrCpy '$INSTDIR' '$PROGRAMFILES\eProsima\FastRTPS'
    ${EndIf}
    Strcpy $RICHI_FINISH_MESSAGE "Fast RTPS has been installed on your computer.$\n$\nClick Finish to close this wizard."
    InitPluginsDir
	Push $R1
    File /oname=$PLUGINSDIR\spltmp.jpg "$%EPROSIMADIR%\logo\eProsimaLogoAndNameFinal_wBorder_460.jpg"
    newadvsplash::show 1000 600 400 -1 "$PLUGINSDIR\spltmp.jpg"
    Pop $R1
    Pop $R1
    #StrCpy $1 ${SEC0004}
FunctionEnd

Function ComponentsPageLeave
  ${Unless} ${SectionIsSelected} ${SEC_LIB_x64VS2010}
  ${AndUnless} ${SectionIsSelected} ${SEC_LIB_i86VS2010}
  ${AndUnless} ${SectionIsSelected} ${SEC_LIB_x64VS2013}
  ${AndUnless} ${SectionIsSelected} ${SEC_LIB_i86VS2013}
    MessageBox MB_OK|MB_ICONINFORMATION `Please select at least one library component.`
    Abort
  ${EndUnless}
FunctionEnd

# Uninstaller functions
Function un.onInit

    ReadRegStr $INSTDIR HKLM "${REGKEY}" Path
    !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuGroup
    !insertmacro SELECT_UNSECTION "x64 VS2010 libraries" ${UNSEC_LIB_x64VS2010}
    !insertmacro SELECT_UNSECTION "i86 VS0210 libraries" ${UNSEC_LIB_i86VS2010}
	!insertmacro SELECT_UNSECTION "x64 VS2013 libraries" ${UNSEC_LIB_x64VS2013}
    !insertmacro SELECT_UNSECTION "i86 VS2013 libraries" ${UNSEC_LIB_i86VS2013}
FunctionEnd

# Section Descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SECGRP0000} "eProsima RTPS libraries."
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_LIB_x64VS2010} "Libraries for x64 VS2010 platforms."
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_LIB_i86VS2010} "Libraries for i86 VS2010 platforms."
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_LIB_x64VS2013} "Libraries for x64 VS2013 platforms."
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_LIB_i86VS2013} "Libraries for i86 VS2013 platforms."
!insertmacro MUI_FUNCTION_DESCRIPTION_END


