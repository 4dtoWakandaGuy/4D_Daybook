//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_OutDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_OutDe")
If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
	CANCEL:C270
Else 
	If (Records in set:C195("Userset")>0)
		Are_You_Sure
		If (OK=1)
			CREATE SET:C116([CONTRACTS:17]; "OrMaster")
			USE SET:C118("Userset")
			FIRST RECORD:C50([CONTRACTS:17])
			While (Not:C34(End selection:C36([CONTRACTS:17])))
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
				NEXT RECORD:C51([CONTRACTS:17])
			End while 
			DELETE SELECTION:C66([CONTRACTS:17])
			USE SET:C118("Master")
			Gen_OutNoF(->[CONTRACTS:17])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Contracts_OutDe"; $_t_oldMethodName)