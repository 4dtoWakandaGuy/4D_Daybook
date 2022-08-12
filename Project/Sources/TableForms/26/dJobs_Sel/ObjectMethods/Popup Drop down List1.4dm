If (False:C215)
	//object Name: [JOBS]dJobs_Sel.Popup Drop down List1
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
	//ARRAY LONGINT(JOB_al_JobClasses;0)
	//ARRAY TEXT(JOB_at_JobClasses;0)
	C_LONGINT:C283(vClassID)
	C_TEXT:C284($_t_oldMethodName; vCLass)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dJobs_Sel.Popup Drop down List1"; Form event code:C388)

If (JOB_at_JobClasses>0)
	vCLass:=JOB_at_JobClasses{JOB_at_JobClasses}
	vClassID:=JOB_al_JobClasses
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dJobs_Sel.Popup Drop down List1"; $_t_oldMethodName)
