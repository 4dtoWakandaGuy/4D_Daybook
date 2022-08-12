//%attributes = {}
If (False:C215)
	//Project Method Name:      PROJ_LoadJobs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(PROJ_lb_Jobs;0)
	//ARRAY POINTER(PTR_aptr_LbSetup;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROJ_LoadJobs")

//NG MAy 2004 this method will load Jobs_Into an area list area

//these lines were lifted from Projects_InLPB
If ([PROJECTS:89]Project_Code:1#"")
	QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=[PROJECTS:89]Project_Code:1)
	ORDER BY:C49([PURCHASE_INVOICES:37]; [JOBS:26]Job_Code:1; >)
Else 
	//QUERY([JOBS];[JOBS]Job Code="zzz999")
	//NG May 2004 change to this here
	REDUCE SELECTION:C351([JOBS:26]; 0)
End if 
ARRAY POINTER:C280(PTR_aptr_LbSetup; 0)
LBi_ArrDefFill(->PTR_aptr_LbSetup; ->PROJ_lb_Jobs; ->[JOBS:26]Job_Code:1; ->[PROJECTS:89]Project_Code:1; "211111126"; "Job_In"; 3; "Jobs"; "Job")

LBi_LoadSetup(->PTR_aptr_LbSetup; "B")
ERR_MethodTrackerReturn("PROJ_LoadJobs"; $_t_oldMethodName)