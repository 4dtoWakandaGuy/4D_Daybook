//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_GetVarsFromBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:42`Method: CAL4D_GetVarsFromBlob
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_Offset; $0; $1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_GetVarsFromBlob")

$_l_Offset:=$1

//========================    Method Actions    ==================================

For ($_l_Index; 3; Count parameters:C259)
	BLOB TO VARIABLE:C533($2->; ${$_l_Index}->; $_l_Offset)
	If (OK=0)
		ALERT:C41("An error has occured while reading the DFR file.")
		$_l_Index:=Count parameters:C259
	End if 
End for 

//========================    Clean up and Exit    =================================

$0:=$_l_Offset
ERR_MethodTrackerReturn("CAL4D_GetVarsFromBlob"; $_t_oldMethodName)