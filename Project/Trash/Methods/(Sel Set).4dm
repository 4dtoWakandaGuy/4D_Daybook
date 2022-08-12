//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_Set
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAny)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Set")
//Sel_Set
If (vAny=0)
	
	If (Count parameters:C259>=1)
		ALL RECORDS:C47($1->)
		
	Else 
		Gen_Alert("This method has been modified and requires a parameter")
	End if 
	
Else 
	
	USE SET:C118("Master")
End if 
If (Count parameters:C259>=1)
	CREATE SET:C116($1->; "Master2")
End if 
vAny:=1
ERR_MethodTrackerReturn("Sel_Set"; $_t_oldMethodName)
