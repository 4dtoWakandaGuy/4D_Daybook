//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_SetResultDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_ActionCode; $_t_oldMethodName; $0)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_SetResultDialog")

//This will get the available results for a given action and ask the user what the result is-just the result nothing else
If (Count parameters:C259>=1)
	$_t_ActionCode:=[DIARY:12]Action_Code:9
	
End if 
$0:=""
ERR_MethodTrackerReturn("SD2_SetResultDialog"; $_t_oldMethodName)
