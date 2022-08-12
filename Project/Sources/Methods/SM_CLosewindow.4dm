//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_CLosewindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SM_isHidden)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName; $_t_VolumesMenuName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_CLosewindow")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_DatListsPal"); 4; ""; <>MenuProc; False:C215)
DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_MacrosPalette"); 4; ""; <>menuProc; False:C215)

HIDE PROCESS:C324(Current process:C322)
SM_UPDATEDATA


<>SM_isHidden:=True:C214
ERR_MethodTrackerReturn("SM_CLosewindow"; $_t_oldMethodName)
