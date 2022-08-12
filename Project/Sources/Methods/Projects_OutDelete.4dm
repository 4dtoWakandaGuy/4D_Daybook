//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_OutDelete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_OutDelete")
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([PROJECTS:89]; "Master")
	USE SET:C118("Userset")
	If (Gen_DeleteCheckState(->[PROJECTS:89]State:9))
		Are_You_Sure
		If (OK=1)
			DELETE SELECTION:C66([PROJECTS:89])
		End if 
	End if 
	USE SET:C118("Master")
	Gen_OutNo(->[PROJECTS:89])
	
End if 
ERR_MethodTrackerReturn("Projects_OutDelete"; $_t_oldMethodName)