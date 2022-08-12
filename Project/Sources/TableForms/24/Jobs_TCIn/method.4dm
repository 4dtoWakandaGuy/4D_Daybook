If (False:C215)
	//Table Form Method Name: Object Name:      [ORDERS].Jobs_TCIn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_LB_Diary;0)
	//ARRAY BOOLEAN(ORD_LB_TimeItems;0)
	//ARRAY LONGINT(ORD_al_ModeDiary;0)
	//ARRAY LONGINT(ORD_al_ModeOrders;0)
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORD_at_ModeDiary;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(SD_at_TrState;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_PICTURE:C286(ORD_Pi_ModeDiary; ORD_pic_LBMode)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Jobs_TCIn"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
	: ($_l_event=On Resize:K2:27)
		INT_SetInput(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
		LBI_Scrollonresize(->ORD_LB_Diary)
		LBI_Scrollonresize(->ORD_LB_TimeItems)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(SD_at_TrState; 0)
		DB_LoadDisplay(Table:C252(->[JOBS:26]); ->SD_at_TrState)
		
		WS_AutoscreenSize(1; 384; 800; Table name:C256(->[ORDERS:24])+"_"+"Jobs_TCIn")
		
		ARRAY TEXT:C222(OI_at_OrderItemTabs; 2)
		OBJECT SET FONT:C164(OI_at_OrderItemTabs; "arial")
		OBJECT SET FONT STYLE:C166(OI_at_OrderItemTabs; 1)
		OBJECT SET FONT SIZE:C165(OI_at_OrderItemTabs; 12)
		OI_at_OrderItemTabs{1}:="   Time  "
		OI_at_OrderItemTabs{2}:="   Costs  "
		OI_at_OrderItemTabs:=1
		ARRAY POINTER:C280(ORD_aPtr_LbDISetup; 0)
		ARRAY POINTER:C280(ORD_aPtr_OrderItemsSetup; 0)
		ARRAY TEXT:C222(ORD_at_ModeDiary; 0)
		ARRAY LONGINT:C221(ORD_al_ModeDiary; 0)
		LBi_SetListBoxOptions(->ORD_at_ModeDiary; ->ORD_al_ModeDiary; ->ORD_Pi_ModeDiary)
		
		//ORD_S11_ModeDiary{2}:="Edit"
		//ORD_S11_ModeDiary{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//`ARRAY STRING(11;ORD_S11_ModeDiary;3)
		//ORD_S11_ModeDiary{3}:="Definitions"
		//End if
		ARRAY TEXT:C222(ORD_at_ModeOrders; 0)
		ARRAY LONGINT:C221(ORD_al_ModeOrders; 0)
		LBi_SetListBoxOptions(->ORD_at_ModeOrders; ->ORD_al_ModeOrders; ->ORD_pic_LBMode)
		
		//ORD_at_ModeOrders{2}:="Editable"
		//ORD_at_ModeOrders{1}:="Selectable"
		//If ((◊DMAdd) & (◊DefListLay))
		//ARRAY STRING(11;ORD_at_ModeOrders;3)
		//ORD_at_ModeOrders{3}:="Definitions"
		//ORD_at_ModeOrders{4}:="Diary Tab Settings"
		
		//End if
		
		
		INT_SetInput(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
End case 
Jobs_TCInLP
ERR_MethodTrackerReturn("FM [ORDERS].Jobs_TCIn"; $_t_oldMethodName)
