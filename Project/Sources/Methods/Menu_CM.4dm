//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_CM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_CM")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
CheckModBynumber(14; "Campaign Manager")
If (OK=1)
	If (<>Bar#19) | (MENU_bo_Overwrite)
		Menu_ModEnable
		<>Bar:=19
		<>MENU_l_BarModule:=14
		<>BarPos:=2  //this is wrong
		DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
		Menu_DisFile
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
	DB_MenuAction("Campaigns"; ""; 3; ""; $_l_MenuProc; False:C215)
	//  DISABLE MENU ITEM(4;0;◊MenuProc)
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_CM"; $_t_oldMethodName)
