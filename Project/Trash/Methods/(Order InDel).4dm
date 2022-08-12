//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Order InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284(<>ContCode; <>OrderCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order InDel")

If (Gen_DeleteCheckStateSingle(->[ORDERS:24]State:15))
	If (Modified record:C314([ORDERS:24]))
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
	End if 
	If (Modified record:C314([ORDER_ITEMS:25]))
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	End if 
	CREATE SET:C116([ORDERS:24]; "OrMaster")
	If ([ORDERS:24]Order_Code:3="")
		REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
	Else 
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28#0)
	End if 
	
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		Gen_Alert("Please unallocate items first"; "Try again")
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		$_bo_Continue:=False:C215
	Else 
		$_bo_Continue:=True:C214
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Gen_Confirm("Are you sure you wish to delete this order, it has order lines which will also be deleted"; "No"; "Yes")
			$_bo_Continue:=(OK=0)
		Else 
			Are_You_Sure
			$_bo_Continue:=(OK=1)
		End if 
		If ($_bo_Continue)
			If ([ORDERS:24]Order_Code:3#"")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				If (Records in selection:C76([ORDER_ITEMS:25])#Records in table:C83([ORDER_ITEMS:25]))
					
					If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
						Orders_InDelSubscription
					End if 
					DELETE SELECTION:C66([ORDER_ITEMS:25])
					
				End if 
				CustomFields_Delete(->[ORDERS:24])
			End if 
			Minor_DeleteSingleRecord(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Orders")
			$_l_OK:=DB_DeletionControl(->[ORDERS:24]; "Order inDel")
			
			If ($_l_OK=1)
				DELETE RECORD:C58([ORDERS:24])
			End if 
			CANCEL:C270
			OK:=1
		Else 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		End if 
	End if 
	USE SET:C118("OrMaster")
	Gen_InNoF(->[ORDERS:24])
	<>OrderCode:=""
	<>ContCode:=""
End if 
ERR_MethodTrackerReturn("Order InDel"; $_t_oldMethodName)
