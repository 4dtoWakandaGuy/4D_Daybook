If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.oSubsItemsTab1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2011 09:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OI_lb_Subs;0)
	//ARRAY DATE(OI_ad_SubsActionDate;0)
	//ARRAY DATE(OI_ad_SubsActioned;0)
	//ARRAY LONGINT(OI_al_SubsID;0)
	//ARRAY TEXT(OI_at_OrderItemsSubTypes;0)
	//ARRAY TEXT(OI_at_SubsActionType;0)
	C_LONGINT:C283(OIS_l_BUT1; OIS_l_But2; OIS_l_BUT3; OIS_l_BUT4; OIS_l_BUT5; OIS_l_BUT6; OIS_l_BUT7; OIS_l_BUT8; OIS_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; OIS_t_COL1; OIS_t_COL2; OIS_t_COL3; OIS_t_COL4; OIS_t_COL5; OIS_t_COL6; OIS_t_COL7; OIS_t_COL8; OIS_t_COL9; OIS_t_HED1)
	C_TEXT:C284(OIS_t_HED2; OIS_t_HED3; OIS_t_HED4; OIS_t_HED5; OIS_t_HED6; OIS_t_HED7; OIS_t_HED8; OIS_t_HED9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_in.oSubsItemsTab1"; Form event code:C388)
//If (OI_at_OrderItemTabs#Current form page)
Case of 
	: (OI_at_OrderItemsSubTypes=2)  //Renewals
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="REN"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Subscription_Date:3; OI_ad_SubsActionDate; [SUBSCRIPTIONS:93]Type:7; OI_at_SubsActionType; [SUBSCRIPTIONS:93]Date_Done:9; OI_ad_SubsActioned; [SUBSCRIPTIONS:93]x_ID:11; OI_al_SubsID)
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		LB_SetupListbox(->OI_lb_Subs; "OIS_t"; "OIS_L"; 1; ->OI_ad_SubsActionDate; ->OI_at_SubsActionType; ->OI_ad_SubsActioned; ->OI_al_SubsID)
		LB_SetColumnHeaders(->OI_lb_Subs; "OIS_L"; 1; "Date"; "Type"; "Date Done"; "ID")
		LB_SetColumnWidths(->OI_lb_Subs; "OIS_t"; 1; 90; 40; 60; 0)
		LB_SetEnterable(->OI_lb_Subs; False:C215; 0)
		LB_SetScroll(->OI_lb_Subs; -3; -2)
		LB_StyleSettings(->OI_lb_Subs; "Black"; 9; "OIS_t"; ->[ORDER_ITEMS:25])
		
		
	: (OI_at_OrderItemsSubTypes=1)  //Issues
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Subscription_Date:3; OI_ad_SubsActionDate; [SUBSCRIPTIONS:93]Type:7; OI_at_SubsActionType; [SUBSCRIPTIONS:93]Date_Done:9; OI_ad_SubsActioned; [SUBSCRIPTIONS:93]x_ID:11; OI_al_SubsID)
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		LB_SetupListbox(->OI_lb_Subs; "OIS_t"; "OIS_L"; 1; ->OI_ad_SubsActionDate; ->OI_at_SubsActionType; ->OI_ad_SubsActioned; ->OI_al_SubsID)
		LB_SetColumnHeaders(->OI_lb_Subs; "OIS_L"; 1; "Date"; "Type"; "Date Done"; "ID")
		LB_SetColumnWidths(->OI_lb_Subs; "OIS_t"; 1; 90; 40; 60; 0)
		LB_SetEnterable(->OI_lb_Subs; False:C215; 0)
		LB_SetScroll(->OI_lb_Subs; -3; -2)
		LB_StyleSettings(->OI_lb_Subs; "Black"; 9; "OIS_t"; ->[ORDER_ITEMS:25])
		
		
	: (OI_at_OrderItemsSubTypes=3)  //billing
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="B@"; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
		QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Subscription_Date:3; OI_ad_SubsActionDate; [SUBSCRIPTIONS:93]Type:7; OI_at_SubsActionType; [SUBSCRIPTIONS:93]Date_Done:9; OI_ad_SubsActioned; [SUBSCRIPTIONS:93]x_ID:11; OI_al_SubsID)
		
		LB_SetupListbox(->OI_lb_Subs; "OIS_t"; "OIS_L"; 1; ->OI_ad_SubsActionDate; ->OI_at_SubsActionType; ->OI_ad_SubsActioned; ->OI_al_SubsID)
		LB_SetColumnHeaders(->OI_lb_Subs; "OIS_L"; 1; "Date"; "Type"; "Date Done"; "ID")
		LB_SetColumnWidths(->OI_lb_Subs; "OIS_t"; 1; 90; 40; 60; 0)
		LB_SetEnterable(->OI_lb_Subs; False:C215; 0)
		LB_SetScroll(->OI_lb_Subs; -3; -2)
		LB_StyleSettings(->OI_lb_Subs; "Black"; 9; "OIS_t"; ->[ORDER_ITEMS:25])
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_in.oSubsItemsTab1"; $_t_oldMethodName)
