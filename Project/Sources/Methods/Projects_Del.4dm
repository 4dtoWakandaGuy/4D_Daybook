//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_Del
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_Del")
//Projects_Del
If (Gen_DeleteCheckStateSingle(->[PROJECTS:89]State:9))
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116([PROJECTS:89]; "Master")
		DELETE RECORD:C58([PROJECTS:89])
		CANCEL:C270
		USE SET:C118("Master")
		Gen_InNoF(->[PROJECTS:89])
	End if 
End if 
ERR_MethodTrackerReturn("Projects_Del"; $_t_oldMethodName)