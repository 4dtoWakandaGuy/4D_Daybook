//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Silver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermGL; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Silver")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
CheckModBynumber(1; "Daybook Silver")
If (OK=1)
	If ((<>Bar#11) & (<>Bar#22)) | (MENU_bo_Overwrite)
		Menu_ModEnable
		If (<>TermGL)
			<>Bar:=22
		Else 
			<>Bar:=11
		End if 
		<>MENU_l_BarModule:=1
		<>BarPos:=1
		DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
		Menu_DisFile
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_Silver"; $_t_oldMethodName)
