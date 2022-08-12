//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports FileI
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports FileI")
FORM SET INPUT:C55([DOCUMENTS:7]; "Reports_In13")
WIN_t_CurrentInputForm:="Reports_In13"
ERR_MethodTrackerReturn("Reports FileI"; $_t_oldMethodName)