//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Set_enterable
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
	C_BOOLEAN:C305($_bo_Enterable; $1)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Set_enterable")
//this method will set a series of variables to enterable or non-enterable
If (Count parameters:C259>=2)
	$_bo_Enterable:=$1
	For ($_l_Index; 2; Count parameters:C259)
		OBJECT SET ENTERABLE:C238(${$_l_Index}->; $_bo_Enterable)
	End for 
	
End if 
ERR_MethodTrackerReturn("Gen_Set_enterable"; $_t_oldMethodName)