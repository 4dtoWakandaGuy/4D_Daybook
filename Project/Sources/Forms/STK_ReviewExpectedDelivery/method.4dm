If (False:C215)
	//Project Form Method Name:      STK_ReviewExpectedDelivery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 18:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_ExpectedQuantities;0)
	//ARRAY LONGINT(STK_al_ItemIDS;0)
	//ARRAY REAL(STK_ar_QuantityBefore;0)
	//ARRAY REAL(STK_ar_QuantityExpected;0)
	//ARRAY TEXT(STK_at_DeviveryProductCode;0)
	//ARRAY TEXT(STK_at_DeviveryProductName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; STK_l_BUT1; STK_l_BUT10; STK_l_BUT11; STK_l_BUT12; STK_l_BUT13; STK_l_BUT14; STK_l_BUT15; STK_l_But2; STK_l_BUT3; STK_l_BUT4)
	C_LONGINT:C283(STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; <>SYS_t_PlatformSetting; $_t_oldMethodName; STK_t_COL1; STK_t_COL10; STK_t_COL11; STK_t_COL12; STK_t_COL13; STK_t_COL14; STK_t_COL15)
	C_TEXT:C284(STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1; STK_t_HED10; STK_t_HED11)
	C_TEXT:C284(STK_t_HED12; STK_t_HED13; STK_t_HED14; STK_t_HED15; STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8)
	C_TEXT:C284(STK_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM STK_ReviewExpectedDelivery"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//SELECTION TO ARRAY([STOCK ITEMS]Product Code;STK_at_DeviveryProductCode;[STOCK ITEMS]Moved_Quantity;STK_ar_QuantityExpected;[STOCK ITEMS]x_ID;STK_al_ItemIDS)
		//QUERY WITH ARRAY([PRODUCTS]Product Code;STK_at_DeviveryProductCode)
		//SELECTION TO ARRAY([PRODUCTS]Product Code;$_at_DeviveryProductCode;[PRODUCTS]Product Name;$_at_DeviveryProductName)
		//ARRAY TEXT(STK_at_DeviveryProductName;0)
		//ARRAY TEXT(STK_at_DeviveryProductName;Size of array(STK_at_DeviveryProductCode))
		
		LB_SetupListbox(->STK_lb_ExpectedQuantities; "STK_t"; "STK_L"; 1; ->STK_at_DeviveryProductCode; ->STK_at_DeviveryProductName; ->STK_ar_QuantityExpected; ->STK_al_ItemIDS; ->STK_ar_QuantityBefore)
		LB_SetColumnHeaders(->STK_lb_ExpectedQuantities; "STK_L"; 1; "Product "; "Name"; "Qty Expected"; "Stock ItemID"; "Before")
		LB_SetColumnWidths(->STK_lb_ExpectedQuantities; "STK_t"; 1; 150; 200; 100; 0; 0)
		
		
		LB_SetScroll(->STK_lb_ExpectedQuantities; -3; -2)
		LB_SETENTRYOPTIONS
		If (<>SYS_t_PlatformSetting="W")  //If the Font Size of the first col = 9
			
			LB_SETFONT(->STK_lb_ExpectedQuantities; "STK_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; 9)
			LB_SETFONT(->STK_lb_ExpectedQuantities; "STK_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; 9)
			
		Else 
			LB_SETFONT(->STK_lb_ExpectedQuantities; "STK_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; 10)
			LB_SETFONT(->STK_lb_ExpectedQuantities; "STK_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; 10)
			
		End if 
		LB_Setdividers(->STK_lb_ExpectedQuantities; 0; 0)  //Both on
		LB_SetColours(->STK_lb_ExpectedQuantities; Black:K11:16; White:K11:1; White:K11:1)
		
		
		LBi_InclSetupJustStyle(->STK_lb_ExpectedQuantities)
		LB_SetEnterable(->STK_lb_ExpectedQuantities; False:C215; 0)
		LB_SetEnterable(->STK_lb_ExpectedQuantities; True:C214; 3)
		LB_StyleSettings(->STK_lb_ExpectedQuantities; ""; 12; "STK_t"; ->[STOCK_MOVEMENT_ITEMS:27])  // set colours, fonts etc. 29/06/06 pb
		
		
End case 
ERR_MethodTrackerReturn("FM STK_ReviewExpectedDelivery"; $_t_oldMethodName)
