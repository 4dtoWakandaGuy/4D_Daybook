//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_Beginning3
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
	C_LONGINT:C283(vAny)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Beginning3")
If (Count parameters:C259>=1)
	CREATE EMPTY SET:C140($1->; "Master")
Else 
	
	CREATE EMPTY SET:C140("Master")
End if 

vAny:=0
ERR_MethodTrackerReturn("Sel_Beginning3"; $_t_oldMethodName)
