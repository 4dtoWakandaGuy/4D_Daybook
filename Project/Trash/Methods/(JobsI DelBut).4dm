//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobsI DelBut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobsI DelBut")
If (Count parameters:C259=0)
	DB_t_CurrentFormUsage:="Job"
	OrderI_DelBut
Else 
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOBS:26]Job_Code:1; *)
	QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
	OK:=1
	If (Records in selection:C76([JOB_STAGES:47])>0)
		Are_You_Sure
	End if 
	If (OK=1)
		DB_DeletionControl(->[JOBS:26])
		
		DELETE RECORD:C58([JOB_STAGES:47])
		DELETE SELECTION:C66([JOB PERSONNEL:48])
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
		ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2; >)
	End if 
End if 
ERR_MethodTrackerReturn("JobsI DelBut"; $_t_oldMethodName)