If (False:C215)
	//object Name: [JOB_STAGES]dJobStages_Sel.Variable1
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
	C_TEXT:C284($_t_oldMethodName; vJobCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].dJobStages_Sel.Variable1"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vJobCode; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].dJobStages_Sel.Variable1"; $_t_oldMethodName)
