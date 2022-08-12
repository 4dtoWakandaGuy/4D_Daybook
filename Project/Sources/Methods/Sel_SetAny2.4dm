//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SetAny2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 21:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vSIS)
	C_LONGINT:C283(vAny; vButt)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SetAny2")
//Sel_SetAny2
If (vAny=0)
	If (Count parameters:C259>=4)
		ALL RECORDS:C47($4->)
	Else 
		Gen_Alert("This method(Sel_SetAny) has been modified and requires 4 parameters")
		
	End if 
	
Else 
	USE SET:C118("Master")
End if 
If (Count parameters:C259>=4)
	CREATE SET:C116($4->; $1)
	CREATE EMPTY SET:C140($4->; $2)
Else 
	Gen_Alert("This method(Sel_SetAny) has been modified and requires 2 parameters")
	
End if 

UNION:C120("Big One"; $2; $2)
$3->:=vButt
vAny:=1
vSIS:=True:C214
vSelPrev:=""
ERR_MethodTrackerReturn("Sel_SetAny2"; $_t_oldMethodName)
