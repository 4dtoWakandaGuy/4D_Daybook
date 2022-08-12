//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_VarstoBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:44`Method: CAL4D_VarstoBlob
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_VarstoBlob")
SET BLOB SIZE:C606($1->; 0)

//========================    Method Actions    ==================================

For ($_l_Index; 2; Count parameters:C259)
	VARIABLE TO BLOB:C532(${$_l_Index}->; $1->; *)
End for 
ERR_MethodTrackerReturn("CAL4D_VarstoBlob"; $_t_oldMethodName)