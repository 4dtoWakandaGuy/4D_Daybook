//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_CCNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CCNo")
//Check_CCNo
$0:=Check_CCNo2($1)
ERR_MethodTrackerReturn("Check_CCNo"; $_t_oldMethodName)