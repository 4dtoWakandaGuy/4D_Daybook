If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Items InV13
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
	//ARRAY TEXT(OI_at_OrderItemTabs;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items InV13"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 312; 553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items InV13")
		WS_AutoscreenSize(2; 312; 553)
		ARRAY TEXT:C222(OI_at_OrderItemTabs; 2)
		OBJECT SET FONT:C164(OI_at_OrderItemTabs; "arial")
		OBJECT SET FONT STYLE:C166(OI_at_OrderItemTabs; 1)
		OBJECT SET FONT SIZE:C165(OI_at_OrderItemTabs; 12)
		OI_at_OrderItemTabs{1}:="   1  "
		OI_at_OrderItemTabs{2}:="   2  "
		OI_at_OrderItemTabs:=1
End case 
OrderI_InLP
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Items InV13"; $_t_oldMethodName)
