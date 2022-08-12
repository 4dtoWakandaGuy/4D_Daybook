//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs New")

Jobs_In
ERR_MethodTrackerReturn("Jobs New"; $_t_oldMethodName)