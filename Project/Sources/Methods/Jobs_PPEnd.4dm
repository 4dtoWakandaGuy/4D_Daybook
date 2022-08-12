//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPEnd
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
	C_LONGINT:C283(vAB)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPEnd")
DB_t_CurrentFormUsage:="Job"
DB_t_CurrentFormUsage2:=""
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
Jobs_InLPOI(vAB)
FORM SET OUTPUT:C54([JOBS:26]; "Jobs_Out")
[JOBS:26]Comments:15:=[JOBS:26]Comments:15
ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2; >)
ERR_MethodTrackerReturn("Jobs_PPEnd"; $_t_oldMethodName)