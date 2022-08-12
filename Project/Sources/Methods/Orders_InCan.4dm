//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InCan
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
	//C_UNKNOWN(vAdd)
	C_BOOLEAN:C305(ORD_bo_IsRevision; ORD_bo_ItemsModified; ORD_bo_OrderModified; $_bo_Delete; ORD_bo_IsRevision; ORD_bo_ItemsModified; ORD_bo_OrderModified)
	C_LONGINT:C283(vAdd; $_l_OK)
	C_TEXT:C284($_t_CalledFrom; $_t_oldMethodName; $1; <>OrderCode; $_t_CalledFrom; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InCan")
If (Count parameters:C259>=1)
	$_t_CalledFrom:=$1
Else 
	$_t_CalledFrom:=""
End if 
If (ORD_bo_IsRevision)
	//no point in any code running then
	
	ORD_bo_OrderModified:=False:C215
	ORD_bo_ItemsModified:=False:C215
	<>OrderCode:=""
	CANCEL:C270
Else 
	If (vAdd=1)
		If (Modified record:C314([ORDER_ITEMS:25]))
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
		If (Modified record:C314([ORDERS:24]))
			DB_SaveRecord(->[ORDERS:24])
			AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
		End if 
		If ([ORDERS:24]Order_Code:3="")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1="XZXZ356")
		Else 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28#0)
		End if 
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Gen_Alert("Please unallocate items first"; "Try again")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		Else 
			If ([ORDERS:24]Order_Code:3#"")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			End if 
			If (Records in selection:C76([ORDER_ITEMS:25])>0)
				Gen_Confirm("Are you sure you want to Cancel?"; "Keep it"; "Cancel")
				$_bo_Delete:=(OK=0)
			Else 
				OK:=1  //NG changed this June 13th 2006
				$_bo_Delete:=True:C214
			End if 
			If ($_bo_Delete)
				If ([ORDERS:24]Order_Code:3#"")
					If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
						Orders_InDelSubscription
					End if 
					DELETE SELECTION:C66([ORDER_ITEMS:25])
				End if 
				$_l_OK:=DB_DeletionControl(->[ORDERS:24]; "Orders_InCan "+$_t_CalledFrom)
				If ($_l_OK=1)
					DELETE RECORD:C58([ORDERS:24])
				End if 
				CANCEL:C270
				<>OrderCode:=""
			End if 
		End if 
	Else 
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		CANCEL:C270
		<>OrderCode:=""
	End if 
End if 
ERR_MethodTrackerReturn("Orders_InCan"; $_t_oldMethodName)
