//%attributes = {}
If (False:C215)
	//Project Method Name:      Master2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:11
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

$_t_oldMethodName:=ERR_MethodTracker("Master2")
//Master2
If (Count parameters:C259>=1)
	If (vAny=0)
		CREATE SET:C116($1->; "Master")
	Else 
		CREATE SET:C116($1->; "Extra")
		INTERSECTION:C121("Master"; "Extra"; "Master")
	End if 
Else 
	Gen_Alert("This method (Master2) has been modifiied and requires a parameter")
End if 

vAny:=1
ERR_MethodTrackerReturn("Master2"; $_t_oldMethodName)
