//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_InDel
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages_InDel")
Are_You_Sure
If (OK=1)
	CREATE SET:C116([JOB_STAGES:47]; "Master")
	DB_SaveRecord(->[JOB PERSONNEL:48])
	DELETE SELECTION:C66([JOB PERSONNEL:48])
	DB_DeletionControl(->[JOB_STAGES:47])
	
	DELETE RECORD:C58([JOB_STAGES:47])
	CANCEL:C270
	USE SET:C118("Master")
	Gen_InNoF(->[JOB_STAGES:47])
End if 
ERR_MethodTrackerReturn("JobStages_InDel"; $_t_oldMethodName)