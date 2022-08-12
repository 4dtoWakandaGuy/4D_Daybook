If (False:C215)
	//Table Form Method Name: Object Name:      [ORDERS].Orders_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/08/2012 22:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY BOOLEAN(ORD_LB_TimeItems;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY LONGINT(ORD_al_ModeOrders;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	C_BOOLEAN:C305(CAT_bo_CataloguesEnabled; DB_bo_NoLoad; ORD_bo_UseCatalogues; STK_bo_ReceivebyReference; STK_bo_UseDeliveryReference)
	C_LONGINT:C283($_l_event; $_l_FrontMostWindow; $_l_Index; $_l_MaxWidth; $_l_ProcessRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop; bprint)
	C_LONGINT:C283(ORD_but_StateupDown; ORD_l_StartingState; SD_l_DragSource; WIN_l_CurrentWinRef)
	C_PICTURE:C286(OrdModePict)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Orders_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		$_l_FrontMostWindow:=Frontmost window:C447
		If (FORM Get current page:C276=2)
			
			//Ord_SetCardBox
		End if 
		
		LBI_Scrollonresize(->ORD_lb_ArraySelection)
		LBI_Scrollonresize(->ORD_r_SubSelection)
		
	: ($_l_event=On Header:K2:17)  // | ($_l_event=on Resize )
		//WS_AutoscreenSize (2;384;553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ORD_but_StateupDown:=1
		ORD_l_StartingState:=1  //
		ARRAY BOOLEAN:C223(ORD_LB_TimeItems; 0)
		OpenHelp(Table:C252(->[ORDERS:24]); "Order_In")
		OBJECT SET VISIBLE:C603(bprint; False:C215)  //This button is for  printing listing box-testing it
		OBJECT SET ENABLED:C1123(bprint; False:C215)
		CAT_LoadPrefs
		ORD_bo_UseCatalogues:=CAT_bo_CataloguesEnabled
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_MaxWidth:=Screen width:C187-$_l_WindowLeft
		If ($_l_MaxWidth>700)
			
			$_l_MaxWidth:=700
		End if 
		
		WS_AutoscreenSize(1; 610; $_l_MaxWidth; Table name:C256(->[ORDERS:24])+"_"+"Order_In")
		
		ARRAY TEXT:C222(ORD_at_OrdersTab; 2)
		OBJECT SET FONT:C164(ORD_at_OrdersTab; "arial")
		OBJECT SET FONT STYLE:C166(ORD_at_OrdersTab; 1)
		OBJECT SET FONT SIZE:C165(ORD_at_OrdersTab; 12)
		ORD_at_OrdersTab{1}:="   1  "
		ORD_at_OrdersTab{2}:="   2  "
		ORD_at_OrdersTab:=1
		ARRAY TEXT:C222(ORD_at_ModeOrders; 0)
		ARRAY LONGINT:C221(ORD_al_ModeOrders; 0)
		//ORD_at_ModeOrders{2}:="Editable"
		LBi_SetListBoxOptions(->ORD_at_ModeOrders; ->ORD_al_ModeOrders; ->OrdModePict; True:C214)
		
		INT_SetInput(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
		
	: ($_l_event=On Activate:K2:9) | ($_l_event=On Resize:K2:27)  //Rollo 19/11/2004
		$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
		$_l_WindowReference:=0
		If ($_l_ProcessRow>0)
			//It should be
			If (<>PRC_al_ProcessCalledBy{$_l_ProcessRow}=Current process:C322)
				
				For ($_l_Index; $_l_ProcessRow+1; Size of array:C274(<>PRC_al_ProcessCalledBy))
					If (<>PRC_al_ProcessCalledBy{$_l_Index}#Current process:C322)
						$_l_ProcessRow:=$_l_Index
						$_l_Index:=Size of array:C274(<>PRC_al_ProcessCalledBy)
					End if 
				End for 
			End if 
			$_l_WindowReference:=<>PRC_al_WindowReference{$_l_ProcessRow}
		End if 
		$_l_FrontMostWindow:=Frontmost window:C447
		If ($_l_WindowReference=WIN_l_CurrentWinRef) | ($_l_WindowReference=0)
			
			OpenHelp(Table:C252(->[ORDERS:24]); "Order_In")
			
			INT_SetInput(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
		End if 
End case 
Orders_InLP
ERR_MethodTrackerReturn("FM:Orders_In"; $_t_oldMethodName)
