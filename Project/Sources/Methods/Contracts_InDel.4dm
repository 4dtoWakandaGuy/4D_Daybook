//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_InDel")
If (Modified record:C314([CONTRACTS:17]))
	DB_SaveRecord(->[CONTRACTS:17])
End if 
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
If (Modified record:C314([CONTRACT_RECORD_ANALYSIS:88]))
	DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
End if 
CREATE SET:C116([CONTRACTS:17]; "OrMaster")
Are_You_Sure
If (OK=1)
	If ([CONTRACTS:17]Contract_Code:3#"")
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=""; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Allocated:28=0)
		If (Records in selection:C76([ORDER_ITEMS:25])#Records in table:C83([ORDER_ITEMS:25]))
			DELETE SELECTION:C66([ORDER_ITEMS:25])
		End if 
		QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1=[CONTRACTS:17]Contract_Code:3)
		DELETE SELECTION:C66([CONTRACT_RECORD_ANALYSIS:88])
		CustomFields_Delete(->[CONTRACTS:17])
	End if 
	DB_DeletionControl(->[CONTRACTS:17])
	
	DELETE RECORD:C58([CONTRACTS:17])
	CANCEL:C270
Else 
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
End if 
USE SET:C118("Master")
Gen_InNoF(->[CONTRACTS:17])
ERR_MethodTrackerReturn("Contracts_InDel"; $_t_oldMethodName)