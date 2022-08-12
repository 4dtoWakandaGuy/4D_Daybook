//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetMenuChecks
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BUTTPROC; <>MenuProc; <>ProcProc)
	C_TEXT:C284($_t_oldMethodName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetMenuChecks")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")

If (<>ProcProc>0)
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WindowsPalette"); 4; "18"; <>menuProc; False:C215)
Else 
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_WindowsPalette"); 4; ""; <>menuProc; False:C215)
End if 
If (Get_ProcessNumber("Modules_Palette")>0)
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_VolumesPalette"); 4; "18"; <>menuProc; False:C215)
Else 
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_VolumesPalette"); 4; ""; <>menuProc; False:C215)
End if 
If (<>ButtProc>0)
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_FunctionsPalette"); 4; "18"; <>menuProc; False:C215)
Else 
	DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_FunctionsPalette"); 4; ""; <>menuProc; False:C215)
End if 
ERR_MethodTrackerReturn("DB_SetMenuChecks"; $_t_oldMethodName)
