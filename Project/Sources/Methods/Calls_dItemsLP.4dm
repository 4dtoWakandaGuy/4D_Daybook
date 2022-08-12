//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_dItemsLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ServShowCon)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_dItemsLP")
If ((Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])=0) & ([SERVICE_CALLS:20]Company_Code:1#"") & (vJobCode#[SERVICE_CALLS:20]Company_Code:1) & (<>ServShowCon))
	vCompCode:=[SERVICE_CALLS:20]Company_Code:1
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=vCompCode)
	Calls_dItems2
End if 
ERR_MethodTrackerReturn("Calls_dItemsLP"; $_t_oldMethodName)