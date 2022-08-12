//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
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

$_t_oldMethodName:=ERR_MethodTracker("Orders_OutDel")
If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
	CANCEL:C270
Else 
	If (Records in set:C195("Userset")>0)
		CREATE SET:C116([ORDERS:24]; "OrMaster")
		USE SET:C118("Userset")
		If (Gen_DeleteCheckState(->[ORDERS:24]State:15))
			Are_You_Sure
			If (OK=1)
				FIRST RECORD:C50([ORDERS:24])
				While (Not:C34(End selection:C36([ORDERS:24])))
					If ([ORDERS:24]Order_Code:3#"")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
						If (Records in selection:C76([ORDER_ITEMS:25])#Records in table:C83([ORDER_ITEMS:25]))
							If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
								Orders_InDelSubscription
							End if 
							DELETE SELECTION:C66([ORDER_ITEMS:25])
						Else 
							//      ALERT("This is how it happens: Orders_Out xDelete"+Char(13)+"TELL ROLLO")
						End if 
						CustomFields_Delete(->[ORDERS:24])
					End if 
					NEXT RECORD:C51([ORDERS:24])
				End while 
				Minor_DelRecords(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Orders")
				DELETE SELECTION:C66([ORDERS:24])
			End if 
		End if 
		USE SET:C118("OrMaster")
		Gen_OutNoF(->[ORDERS:24])
	End if 
End if 
ERR_MethodTrackerReturn("Orders_OutDel"; $_t_oldMethodName)
