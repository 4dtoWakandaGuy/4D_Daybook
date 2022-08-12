If (False:C215)
	//object Name: [JOBS]dAsk_WIPadj.Variable7
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
	C_LONGINT:C283(r0; r1)
	C_TEXT:C284($_t_oldMethodName; vSolution)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dAsk_WIPadj.Variable7"; Form event code:C388)
Check_MinorNC(->vSolution; ""; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2; "Job Stage")
If (vSolution#"")
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=vSolution)
	If (Records in selection:C76([JOB_STAGES:47])=0)
		Gen_Alert("That is not a Stage on this Job"; "Try again")
		GOTO OBJECT:C206(vSolution)
	End if 
End if 
If (vSolution="")
	r0:=0
	r1:=1
	//_O_DISABLE BUTTON(r0)
	OBJECT SET ENABLED:C1123(r0; False:C215)
Else 
	//_O_ENABLE BUTTON(r0)
	OBJECT SET ENABLED:C1123(r0; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dAsk_WIPadj.Variable7"; $_t_oldMethodName)
