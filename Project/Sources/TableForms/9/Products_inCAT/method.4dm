If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_inCAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY BOOLEAN(Prod_lb_PriceBox;0)
	//ARRAY BOOLEAN(Prod_LB_Stock;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_inCAT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->Prod_lb_PriceBox)
		LBI_Scrollonresize(->Prod_LB_Stock)
		LBI_Scrollonresize(->PRD_lb_RelatedData)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_inCAT")
		
		WS_AutoscreenSize(1; 384; 650; Table name:C256(->[PRODUCTS:9])+"_"+"Products_inCAT")
		
		ARRAY TEXT:C222(PRD_at_ProductsTab; 5)
		OBJECT SET FONT:C164(PRD_at_ProductsTab; "arial")
		OBJECT SET FONT STYLE:C166(PRD_at_ProductsTab; 1)
		OBJECT SET FONT SIZE:C165(PRD_at_ProductsTab; 12)
		PRD_at_ProductsTab{1}:="Pricing"
		PRD_at_ProductsTab{2}:="Stock"
		PRD_at_ProductsTab{3}:="Suppliers"
		PRD_at_ProductsTab{4}:="Enclosures"
		PRD_at_ProductsTab{5}:="Components"
		PRD_at_ProductsTab:=1
		
		INT_SetInput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
End case 
Products_InLP_NEW
ERR_MethodTrackerReturn("FM [PRODUCTS].Products_inCAT"; $_t_oldMethodName)
