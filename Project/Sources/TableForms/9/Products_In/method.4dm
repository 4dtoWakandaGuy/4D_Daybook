If (False:C215)
	//Table Form Method Name: [PRODUCTS]Products_In
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
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_PICTURE:C286(PROD_apic_ModePictProd)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Products_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		If (Current form window:C827=Frontmost window:C447)
			
			//LBI_Scrollonresize (->e_LB_SI)
			LBI_Scrollonresize(->PRD_lb_ProdFurths)
			LBI_Scrollonresize(->PRD_LB_ProdComponents)
			
			
		End if 
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PRODUCTS:9]); "Products_In")
		WS_AutoscreenSize(1; 384; 584; Table name:C256(->[PRODUCTS:9])+"_"+"Products_In")
		ARRAY TEXT:C222(PRD_at_ProductsTab; 3)
		OBJECT SET FONT:C164(PRD_at_ProductsTab; "arial")
		OBJECT SET FONT STYLE:C166(PRD_at_ProductsTab; 1)
		OBJECT SET FONT SIZE:C165(PRD_at_ProductsTab; 12)
		PRD_at_ProductsTab{1}:="Products"
		PRD_at_ProductsTab{2}:="Enclosures"
		PRD_at_ProductsTab{3}:="Components"
		PRD_at_ProductsTab:=1
		
		INT_SetInput(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
End case 
Products_InLP
ERR_MethodTrackerReturn("FM:Products_In"; $_t_oldMethodName)
