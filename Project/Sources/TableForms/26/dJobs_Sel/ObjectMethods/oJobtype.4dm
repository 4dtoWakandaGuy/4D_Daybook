If (False:C215)
	//object Name: [JOBS]dJobs_Sel.oJobtype
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dJobs_Sel.oJobtype"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2; "Job Type"; "3")
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dJobs_Sel.oJobtype"; $_t_oldMethodName)
