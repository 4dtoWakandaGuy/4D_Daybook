If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]STK_ConSolSelectRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_ab_Selected;0)
	//ARRAY BOOLEAN(STK_lb_SelectItems;0)
	//ARRAY INTEGER(STK_ad_DisplayDates;0)
	//ARRAY REAL(STK_ar_aisplayQuantities;0)
	//ARRAY REAL(STK_ar_OldQuantity;0)
	//ARRAY TEXT(STK_at_DisplayReferences;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; STK_l_BUT1; STK_l_But2; STK_l_BUT3; STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9; STK_l_ConsolidateUsage)
	C_TEXT:C284($_t_oldMethodName; STK_t_COL1; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1)
	C_TEXT:C284(STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8; STK_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].STK_ConSolSelectRecords"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		Case of 
			: (STK_l_ConsolidateUsage=1)  //changing a delivery reference
				ARRAY BOOLEAN:C223(STK_ab_Selected; 0)
				ARRAY BOOLEAN:C223(STK_ab_Selected; Size of array:C274(STK_ar_aisplayQuantities))
				ARRAY REAL:C219(STK_ar_OldQuantity; 0)
				COPY ARRAY:C226(STK_ar_aisplayQuantities; STK_ar_OldQuantity)
				
				LB_SetupListbox(->STK_lb_SelectItems; "STK_t"; "STK_L"; 1; ->STK_ab_Selected; ->STK_ar_aisplayQuantities; ->STK_at_DisplayReferences; ->STK_ad_DisplayDates; ->STK_ar_OldQuantity)
				
				
				LB_SetColumnHeaders(->STK_lb_SelectItems; "STK_L"; 1; "Apply"; "Quantity"; "Current Reference"; "Expected Date")
				
				LB_SetColumnWidths(->STK_lb_SelectItems; "STK_t"; 1; 42; 87; 200; 200)
				LB_SetEnterable(->STK_lb_SelectItems; False:C215; 0)
				LB_SetEnterable(->STK_lb_SelectItems; True:C214; 1)
				LB_SetEnterable(->STK_lb_SelectItems; False:C215; 2)
				LB_SetScroll(->STK_lb_SelectItems; -3; -2)
				LB_StyleSettings(->STK_lb_SelectItems; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
				
				
				
			: (STK_l_ConsolidateUsage=2)  //changing a delivery Date
				ARRAY BOOLEAN:C223(STK_ab_Selected; 0)
				ARRAY BOOLEAN:C223(STK_ab_Selected; Size of array:C274(STK_ar_aisplayQuantities))
				ARRAY REAL:C219(STK_ar_OldQuantity; 0)
				COPY ARRAY:C226(STK_ar_aisplayQuantities; STK_ar_OldQuantity)
				
				LB_SetupListbox(->STK_lb_SelectItems; "STK_t"; "STK_L"; 1; ->STK_ab_Selected; ->STK_ar_aisplayQuantities; ->STK_at_DisplayReferences; ->STK_ad_DisplayDates; ->STK_ar_OldQuantity)
				LB_SetColumnHeaders(->STK_lb_SelectItems; "STK_L"; 1; "Apply"; "Quantity"; "Current Reference"; "Expected Date")
				LB_SetColumnWidths(->STK_lb_SelectItems; "STK_t"; 1; 42; 87; 200; 200)
				LB_SetEnterable(->STK_lb_SelectItems; False:C215; 0)
				LB_SetEnterable(->STK_lb_SelectItems; True:C214; 1)
				LB_SetEnterable(->STK_lb_SelectItems; False:C215; 2)
				LB_SetScroll(->STK_lb_SelectItems; -3; -2)
				LB_StyleSettings(->STK_lb_SelectItems; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])
				
				
		End case 
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENTS].STK_ConSolSelectRecords"; $_t_oldMethodName)
