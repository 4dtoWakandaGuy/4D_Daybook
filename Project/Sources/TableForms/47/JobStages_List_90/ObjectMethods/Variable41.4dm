If (False:C215)
	//object Name: [JOB_STAGES]JobStages_List_90.Variable41
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vPPage)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStages_List_90.Variable41"; Form event code:C388)
vPPage:="Page "+String:C10(Printing page:C275)
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStages_List_90.Variable41"; $_t_oldMethodName)