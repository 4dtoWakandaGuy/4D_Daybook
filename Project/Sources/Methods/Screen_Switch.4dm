//%attributes = {}
If (False:C215)
	//Project Method Name:      Screen_Switch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284(<>SYS_t_AccessType; <>SYS_t_FormSizeName; $_t_FileMenuName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Screen_Switch")
$_t_FileMenuName:=Get localized string:C991("Menu_File")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
Menu_Record("Screen_Switch"; "13'' Screens")
If (<>SYS_t_AccessType="Q")
	<>SYS_t_FormSizeName:="13"
	//DB_MenuAction ($_t_FileMenuName;"Quick Access";4;"18";◊menuProc;False)
	
Else 
	//DB_MenuAction ($_t_FileMenuName;"Quick Access";4;"18";◊menuProc;False)
	
End if 
ERR_MethodTrackerReturn("Screen_Switch"; $_t_oldMethodName)
