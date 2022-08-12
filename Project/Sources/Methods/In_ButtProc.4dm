//%attributes = {}
If (False:C215)
	//Project Method Name:      In_ButtProc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/09/2010 18:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_ButtProc")
Menu_Record("In_ButtProc"; "Buttons Palette")
//◊Option:=False
//$_l_Functionality:=0
//$_l_Functionality:=$_l_Functionality ?+ 3
ERR_MethodTrackerReturn("In_ButtProc"; $_t_oldMethodName)