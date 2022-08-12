//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_InDel")
If ([ORDER_ITEMS:25]Item_Locked:16)
	Gen_Alert("You cannot delete this item"; "Cancel")
Else 
	Are_You_Sure
	If (OK=1)
		If (([ORDER_ITEMS:25]Item_Number:27>0) & ([ORDER_ITEMS:25]Allocated:28>0))
			OrderI_Unalloc
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
			If ([ORDER_ITEMS:25]Item_Number:27>0)
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
				DELETE SELECTION:C66([SUBSCRIPTIONS:93])
			End if 
		End if 
		CustomFields_Delete(->[ORDER_ITEMS:25])
		CREATE SET:C116([ORDER_ITEMS:25]; "Master")
		$_l_OK:=DB_DeletionControl(->[ORDER_ITEMS:25])
		If ($_l_OK=1)
			DELETE RECORD:C58([ORDER_ITEMS:25])
		End if 
		Case of 
			: (DB_t_CurrentFormUsage="Purch")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
				[PURCHASE_ORDERS:57]Total_Cost:4:=Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
			: (DB_t_CurrentFormUsage="Job")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
				LAST RECORD:C200([ORDER_ITEMS:25])
				[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
			Else 
				USE SET:C118("Master")
		End case 
		CANCEL:C270
	End if 
End if 
vTot:=1
ERR_MethodTrackerReturn("OrderI_InDel"; $_t_oldMethodName)
