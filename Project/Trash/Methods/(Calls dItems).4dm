//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls dItems
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
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls dItems")
//Calls dItems
Menu_Record("Calls dItems"; "Items by Company")
If ([SERVICE_CALLS:20]Company_Code:1#"")
	vCompCode:=[SERVICE_CALLS:20]Company_Code:1
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=vCompCode)
	If (Records in selection:C76([CONTRACTS:17])>0)
		Calls_dItems2
	Else 
		Gen_Alert("No Contracts found for this Company"; "")
	End if 
Else 
	Gen_Alert("Please specify a Company before using this Function"; "")
End if 
ERR_MethodTrackerReturn("Calls dItems"; $_t_oldMethodName)