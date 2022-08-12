//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_LoadCharges
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
	//ARRAY BOOLEAN(SC_LB_CHARGES;0)
	//ARRAY LONGINT(SC_al_ModeCharge;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY POINTER(SVS_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(SC_at_ModeCharge;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState; LBI_bo_RowDragged)
	C_PICTURE:C286(SC_pic_LBMode)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_LoadCharges")

QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=0)
If (Records in selection:C76([ORDER_ITEMS:25])=0)
	$_bo_ReadOnlyState:=Read only state:C362([ORDER_ITEMS:25])
	READ WRITE:C146([ORDER_ITEMS:25])
	DB_lockFile(->[ORDER_ITEMS:25])
	APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
	UNLOAD RECORD:C212([ORDER_ITEMS:25])
	If ($_bo_ReadOnlyState)
		READ ONLY:C145([ORDER_ITEMS:25])
	End if 
	
End if 
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
ARRAY POINTER:C280(SVS_aptr_ListboxSetup; 0)
ARRAY POINTER:C280(SVS_aPtr_OrderItemsSetup; 0)
LBI_bo_RowDragged:=False:C215

If (Size of array:C274(SVS_aPtr_OrderItemsSetup)=0)
	//see also Contacts_InLPß
	LBi_ArrDefFill(->SVS_aPtr_OrderItemsSetup; ->SC_LB_CHARGES; ->[ORDER_ITEMS:25]Item_Number:27; ->[SERVICE_CALLS:20]Call_Code:4; "411111126"; "Items_in"; 8; "Order Items"; "Order Item")
	
	
Else 
	OK:=1
	LBi_Prefs11(->SVS_aPtr_OrderItemsSetup)
End if 
LBi_LoadSetup(->SVS_aPtr_OrderItemsSetup; "B")
If (SC_at_ModeCharge=0)
	SC_at_ModeCharge:=1
	SC_al_ModeCharge:=1
End if 
LBi_EditListUpd(->SVS_aPtr_OrderItemsSetup; ->SC_at_ModeCharge; ->SC_pic_LBMode; ->SC_al_ModeCharge)
ERR_MethodTrackerReturn("SC_LoadCharges"; $_t_oldMethodName)