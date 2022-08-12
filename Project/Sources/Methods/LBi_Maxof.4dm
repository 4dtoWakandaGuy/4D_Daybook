//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_Maxof
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_index)
	C_REAL:C285($0; $1; $2; $3; $4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_Maxof")

//NG 19/7/2006 this method is a direct replacement for ALmaxof
//ALMaxOf

$0:=$1
For ($_l_index; 2; Count parameters:C259)
	If (${$_l_index}>$0)
		$0:=${$_l_index}
	End if 
End for 
ERR_MethodTrackerReturn("LBi_Maxof"; $_t_oldMethodName)