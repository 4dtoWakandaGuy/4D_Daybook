If (False:C215)
	//object Name: [ORDERS]Jobs_TCIn.oModeOrdersTC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ModeOrders;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	C_LONGINT:C283($_l_OrdersMode)
	C_PICTURE:C286(ORD_pic_LBMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Jobs_TCIn.oModeOrdersTC"; Form event code:C388)
If ([ORDER_ITEMS:25]Order_Code:1#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 
If ([DIARY:12]Diary_Code:3#"")
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	
End if 
$_l_OrdersMode:=ORD_al_ModeOrders{ORD_at_ModeOrders}
LBi_EditListLay(->ORD_aPtr_OrderItemsSetup; ->ORD_at_ModeOrders; ->ORD_pic_LBMode; ->ORD_al_ModeOrders; True:C214)
If ($_l_OrdersMode=3)
	If (OK=1)
		Orders_InLPOI  //re-find all of the Items
		//remember to issue a save before a search if not this proc
		LBi_EditListLay(->ORD_aPtr_OrderItemsSetup; ->ORD_at_ModeOrders; ->ORD_pic_LBMode; ->ORD_al_ModeOrders)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Jobs_TCIn.oModeOrdersTC"; $_t_oldMethodName)
