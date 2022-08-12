//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPInvSrc
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
	C_TEXT:C284($_t_oldMethodName; vInvNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPInvSrc")
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Invoice_Number:10=vInvNo)

QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A"; *)
QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=vInvNo)
OrderI_Level0
If ((Records in selection:C76([ORDER_ITEMS:25])=0) & (vInvNo="N"))
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A"; *)
	QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17="")
	OrderI_Level0
End if 
ERR_MethodTrackerReturn("Jobs_PPInvSrc"; $_t_oldMethodName)