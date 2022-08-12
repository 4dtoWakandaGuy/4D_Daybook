//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InOrder
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
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; <>StatesLoaded; <>TechOrder)
	C_LONGINT:C283($_l_Index; $_l_NextOrderItemRef)
	C_TEXT:C284(<>OrderCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InOrder")
//Calls_InOrder
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
Menu_Record("Calls_InOrder"; "Transfer to Order")
If ([SERVICE_CALLS:20]Call_Code:4="")
	Calls_Code
End if 
DB_SaveRecord(->[SERVICE_CALLS:20])
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[SERVICE_CALLS:20]Call_Code:4)
If (Records in selection:C76([ORDERS:24])=0)
	Gen_Confirm("Transfer Call details to an Order?"; "Yes"; "No")
	If (OK=1)
		If ([SERVICE_CALLS:20]Charge:8="N")
			Gen_Confirm("This Call is non-chargeable. Are you sure?"; "Yes"; "No")
		End if 
		If (OK=1)
			CREATE RECORD:C68([ORDERS:24])
			[ORDERS:24]Order_Code:3:=[SERVICE_CALLS:20]Call_Code:4
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{3}
			End if 
			[ORDERS:24]Company_Code:1:=[SERVICE_CALLS:20]Company_Code:1
			[ORDERS:24]Contact_Code:2:=[SERVICE_CALLS:20]Contact_Code:2
			[ORDERS:24]Order_Date:4:=[SERVICE_CALLS:20]Call_Date:5
			Orders_InLPPer
			[ORDERS:24]Person:5:=[SERVICE_CALLS:20]Person:11
			[ORDERS:24]Required_Date:9:=[SERVICE_CALLS:20]Call_Date:5
			If ([SERVICE_CALLS:20]Your_Order_Number:25#"")
				[ORDERS:24]Your_Order_Number:10:=[SERVICE_CALLS:20]Your_Order_Number:25
			Else 
				If ([SERVICE_CALLS:20]Charge:8="Y")
					[ORDERS:24]Your_Order_Number:10:="CHARGE"
				Else 
					[ORDERS:24]Your_Order_Number:10:="CONTRACT"
				End if 
			End if 
			[ORDERS:24]Total_Amount:6:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
			OrderI_SubCostT
			[ORDERS:24]Total_TAX:7:=Sum:C1([ORDER_ITEMS:25]TAX_Amount:8)
			[ORDERS:24]Total_Total:8:=Sum:C1([ORDER_ITEMS:25]Total_Amount:9)
			[ORDERS:24]Sort_Number:27:=Records in selection:C76([ORDER_ITEMS:25])
			Orders_InLPBDef
			DB_SaveRecord(->[ORDERS:24])
			AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			$_l_Index:=1
			$_l_NextOrderItemRef:=1
			While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
				//$_l_NextOrderItemRef:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderItemRef)
				$_l_NextOrderItemRef:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderItemRef; Records in selection:C76([ORDER_ITEMS:25]))
				
				[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderItemRef
				//[ORDER ITEMS]Sort Order:=$_l_Index
				$_l_Index:=$_l_Index+1
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
			If (<>TechOrder=True:C214)
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				<>OrderCode:=[ORDERS:24]Order_Code:3
				<>DB_bo_AutoOut:=False:C215
				<>AutoFind:=True:C214
				ZOrders_Mod
			Else 
				Gen_Alert("A new Order has been created"; "")
			End if 
		End if 
	End if 
Else 
	If (<>TechOrder=True:C214)
		UNLOAD RECORD:C212([ORDER_ITEMS:25])
		<>OrderCode:=[ORDERS:24]Order_Code:3
		<>DB_bo_AutoOut:=False:C215
		<>AutoFind:=True:C214
		ZOrders_Mod
	Else 
		Gen_Alert("You cannot process the Order"; "Cancel")
	End if 
End if 
UNLOAD RECORD:C212([ORDERS:24])
ERR_MethodTrackerReturn("Calls_InOrder"; $_t_oldMethodName)