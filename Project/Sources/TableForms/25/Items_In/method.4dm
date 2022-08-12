If (False:C215)
	//Table Form Method Name: Object Name:      [ORDER_ITEMS].Items_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2011 08:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORDI_al_ModeOrders;0)
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	//ARRAY TEXT(ORDI_at_ModeOrders;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(ORDI_l_LBLevel; $_l_event)
	C_PICTURE:C286(OrdIModePict)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm; $_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
		//WS_AutoscreenSize (2;384;553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		$_t_CurrentInputForm:=WIN_t_CurrentInputForm
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items_in")
		WS_AutoscreenSize(4; 590; 800; Table name:C256(->[ORDER_ITEMS:25])+"_"+"Items_in")
		WIN_t_CurrentInputForm:="Items_in"
		ARRAY TEXT:C222(OI_at_OrderItemTabs; 2)
		OBJECT SET FONT:C164(OI_at_OrderItemTabs; "arial")
		OBJECT SET FONT STYLE:C166(OI_at_OrderItemTabs; 1)
		OBJECT SET FONT SIZE:C165(OI_at_OrderItemTabs; 12)
		OI_at_OrderItemTabs{1}:="Pricing  "
		OI_at_OrderItemTabs{2}:="Delivery "
		OI_at_OrderItemTabs:=1
		ARRAY TEXT:C222(ORDI_at_ModeOrders; 0)
		ARRAY LONGINT:C221(ORDI_al_ModeOrders; 0)
		//ORD_at_ModeOrders{2}:="Editable"
		LBi_SetListBoxOptions(->ORDI_at_ModeOrders; ->ORDI_al_ModeOrders; ->OrdIModePict; True:C214)
		
		INT_SetInput(Table:C252(->[ORDER_ITEMS:25]); WIN_t_CurrentInputForm)
		
		WIN_t_CurrentInputForm:=$_t_CurrentInputForm
End case 

OrderI_InLP
ERR_MethodTrackerReturn("FM:[ORDER_ITEMS].Items_in"; $_t_oldMethodName)
