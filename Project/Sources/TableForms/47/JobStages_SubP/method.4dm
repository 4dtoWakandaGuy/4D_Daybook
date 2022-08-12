If (False:C215)
	//Table Form Method Name: [JOB_STAGES]JobStages_SubP
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
	C_TEXT:C284($_t_oldMethodName; vT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].JobStages_SubP"; Form event code:C388)
If ([JOB_STAGES:47]Print_Description:49)
	vT:=[JOB_STAGES:47]Description:48
Else 
	vT:=""
End if 
ERR_MethodTrackerReturn("FM [JOB_STAGES].JobStages_SubP"; $_t_oldMethodName)
