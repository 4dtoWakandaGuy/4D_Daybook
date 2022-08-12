If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oDiaryTaskEnd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oDiaryTaskEnd"; Form event code:C388)

//Here we have to use the sequencing.
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oDiaryTaskEnd"; $_t_oldMethodName)