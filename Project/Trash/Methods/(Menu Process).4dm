//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu Process")
DB_SetMenuBar(""; 1)
Open window:C153(57; 40; 517; 339; 8; "Menus")
//DIALOG([COMPANIES];"dMenus")
CLOSE WINDOW:C154
<>MenuProc:=1
ERR_MethodTrackerReturn("Menu Process"; $_t_oldMethodName)