//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SIS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vSIS)
	C_LONGINT:C283(cSIS; vAny)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SIS")
//Sel_SIS
If ((cSIS=1) & (vSIS=False:C215))
	If (Count parameters:C259>=1)
		If (Records in set:C195("Master")=0)
			USE SET:C118("Before")
			CREATE SET:C116($1->; "Master")
		Else 
			INTERSECTION:C121("Before"; "Master"; "Master")
		End if 
	Else 
		Gen_Alert("Calls to the method Sel_SIS require a paramter, your call should be updated to include the table number")
		
	End if 
	
	vAny:=1
End if 
ERR_MethodTrackerReturn("Sel_SIS"; $_t_oldMethodName)
