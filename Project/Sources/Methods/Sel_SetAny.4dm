//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SetAny
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 21:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAny)
	C_POINTER:C301($_ptr_MasterSetTable; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SetAny")
//Sel_SetAny
$_t_SetName:=$1
$_ptr_MasterSetTable:=$2
If (vAny=0)
	If (Count parameters:C259=2)
		ALL RECORDS:C47($_ptr_MasterSetTable->)
	Else 
		Gen_Alert("This method(Sel_SetAny) has been modified and requires 2 parameters")
	End if 
	
Else 
	USE SET:C118("Master")
End if 
If (Count parameters:C259=2)
	CREATE SET:C116($_ptr_MasterSetTable->; $_t_SetName)
Else 
	Gen_Alert("This method(Sel_SetAny) has been modified and requires 2 parameters")
	
End if 

vAny:=1
ERR_MethodTrackerReturn("Sel_SetAny"; $_t_oldMethodName)
