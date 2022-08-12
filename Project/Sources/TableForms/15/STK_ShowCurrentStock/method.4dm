If (False:C215)
	//Table Form Method Name: [USER]STK_ShowCurrentStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/01/2012 00:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_CurrentStock;0)
	ARRAY LONGINT:C221($_al_ALDraggedRows; 0)
	//ARRAY LONGINT(STK_al_ProductIDS;0)
	//ARRAY PICTURE(STK_apic_SalesHistory;0)
	ARRAY REAL:C219($_ar_CopyQuantities; 0)
	//ARRAY REAL(STK_ar_AllocationsQuantities;0)
	//ARRAY REAL(STK_ar_CopiedProductQuantites;0)
	//ARRAY REAL(STK_ar_FreeStockQuantites;0)
	//ARRAY REAL(STK_ar_NoAllocStockQuantites;0)
	//ARRAY REAL(STK_ar_QuantitiesOnOrder;0)
	ARRAY TEXT:C222($_at_CopyProductCodes; 0)
	//ARRAY TEXT(STK_at_ALOCSoItemNumbers;0)
	//ARRAY TEXT(STK_at_CopiedProductCodes;0)
	//ARRAY TEXT(STK_at_FREEMovementCodes;0)
	//ARRAY TEXT(STK_at_NoAllocOrderCodes;0)
	//ARRAY TEXT(STK_at_PoNumbers;0)
	//ARRAY TEXT(STK_at_ProductCodes;0)
	//ARRAY TEXT(STK_at_ProductNames;0)
	C_BOOLEAN:C305(<>STK_bo_UseNew; DB_bo_NoLoad; STK_bo_LineSelected)
	C_LONGINT:C283($_l_DraggedRow; $_l_event; $_l_Index; $_l_ProductIndex; $_l_Width1; $_l_Width2; $_l_Width3; $_l_Width4; $_l_Width5; $_l_Width6; $_l_Width7)
	C_LONGINT:C283($_l_Width8; IP_l_Message; STK_l_BUT1; STK_l_BUT10; STK_l_BUT11; STK_l_BUT12; STK_l_BUT13; STK_l_BUT14; STK_l_BUT15; STK_l_But2; STK_l_BUT3)
	C_LONGINT:C283(STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9)
	C_PICTURE:C286($_pic_Picture)
	C_REAL:C285(STK_l_CallBackProcessID)
	C_TEXT:C284(<>ButtPress; <>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; <>SYS_t_PlatformSetting; $_t_oldMethodName; STK_t_COL1; STK_t_COL10; STK_t_COL11; STK_t_COL12; STK_t_COL13; STK_t_COL14)
	C_TEXT:C284(STK_t_COL15; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1; STK_t_HED10)
	C_TEXT:C284(STK_t_HED11; STK_t_HED12; STK_t_HED13; STK_t_HED14; STK_t_HED15; STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7)
	C_TEXT:C284(STK_t_HED8; STK_t_HED9; STK_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].STK_ShowCurrentStock"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		STK_bo_LineSelected:=False:C215
		
		SET WINDOW TITLE:C213(STK_t_WindowTitle)
		WS_AutoscreenSize(3; 450; 620; Table name:C256(->[USER:15])+"_STK_ShowCurrentStock")
		
		
		
		//Load an array of Product codes to display in this window before you open the window
		ARRAY PICTURE:C279(STK_apic_SalesHistory; 0)
		ARRAY PICTURE:C279(STK_apic_SalesHistory; Size of array:C274(STK_at_ProductCodes))
		//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
		$_pic_Picture:=Get_Picture(418)
		
		For ($_l_Index; 1; Size of array:C274(STK_apic_SalesHistory))
			
			STK_apic_SalesHistory{$_l_Index}:=$_pic_Picture
		End for 
		LB_SetupListbox(->STK_lb_CurrentStock; "STK_t"; "STK_L"; 1; ->STK_at_ProductCodes; ->STK_at_ProductNames; ->STK_ar_QuantitiesOnOrder; ->STK_at_PoNumbers; ->STK_ar_AllocationsQuantities; ->STK_at_ALOCSoItemNumbers; ->STK_ar_NoAllocStockQuantites; ->STK_at_NoAllocOrderCodes; ->STK_ar_FreeStockQuantites; ->STK_at_FREEMovementCodes; ->STK_al_ProductIDS)
		LB_SetColumnHeaders(->STK_lb_CurrentStock; "STK_L"; 1; "Product "; "Name"; "Qty on Order"; "Purchase Order No(s)"; "Qty Currently Allocated"; "Allocation Order item"; "Quantity Awaiting"; "Awaiting Allocation"; "Order Item No(s)"; "Qty in Stock"; "Stock Movement(s)"; "IDS")
		$_l_Width1:=0
		$_l_Width2:=0
		For ($_l_Index; 1; Size of array:C274(STK_ar_QuantitiesOnOrder))
			If (STK_ar_QuantitiesOnOrder{$_l_Index}#0)
				$_l_Width1:=100
				$_l_Width2:=150
				$_l_Index:=Size of array:C274(STK_ar_QuantitiesOnOrder)
			End if 
		End for 
		$_l_Width3:=0
		$_l_Width4:=0
		For ($_l_Index; 1; Size of array:C274(STK_ar_AllocationsQuantities))
			If (STK_ar_AllocationsQuantities{$_l_Index}#0)
				$_l_Width3:=100
				$_l_Width4:=150
				$_l_Index:=Size of array:C274(STK_ar_AllocationsQuantities)
			End if 
		End for 
		$_l_Width5:=0
		$_l_Width6:=0
		For ($_l_Index; 1; Size of array:C274(STK_ar_NoAllocStockQuantites))
			If (STK_ar_NoAllocStockQuantites{$_l_Index}#0)
				$_l_Width5:=100
				$_l_Width6:=150
				$_l_Index:=Size of array:C274(STK_ar_NoAllocStockQuantites)
			End if 
		End for 
		$_l_Width7:=0
		$_l_Width8:=0
		For ($_l_Index; 1; Size of array:C274(STK_ar_FreeStockQuantites))
			If (STK_ar_FreeStockQuantites{$_l_Index}#0)
				$_l_Width7:=100
				$_l_Width8:=150
				$_l_Index:=Size of array:C274(STK_ar_FreeStockQuantites)
			End if 
		End for 
		LB_SetColumnWidths(->STK_lb_CurrentStock; "STK_t"; 1; 150; 200; $_l_Width1; $_l_Width2; $_l_Width3; $_l_Width4; $_l_Width5; $_l_Width6; $_l_Width7; $_l_Width8; 0)
		
		LB_SetScroll(->STK_lb_CurrentStock; -2; -2)
		LB_SETENTRYOPTIONS
		If (<>SYS_t_PlatformSetting="W")  //If the Font Size of the first col = 9
			
			LB_SETFONT(->STK_lb_CurrentStock; "STK_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; 9)
			LB_SETFONT(->STK_lb_CurrentStock; "STK_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; 9)
			
		Else 
			LB_SETFONT(->STK_lb_CurrentStock; "STK_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; 10)
			LB_SETFONT(->STK_lb_CurrentStock; "STK_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; 10)
			
		End if 
		LB_Setdividers(->STK_lb_CurrentStock; 0; 0)  //Both on
		LB_SetColours(->STK_lb_CurrentStock; Black:K11:16; White:K11:1; White:K11:1)
		
		
		LBi_InclSetupJustStyle(->STK_lb_CurrentStock)
		LB_SetEnterable(->STK_lb_CurrentStock; False:C215; 0)
		LB_StyleSettings(->STK_lb_CurrentStock; ""; 12; "STK_t"; ->[PURCHASE_INVOICES:37])  // set colours, fonts etc. 29/06/06 pb
		
		
		INT_SetDialog
	: ($_l_event=On Outside Call:K2:11)
		
		
		
		Case of 
			: (<>ButtPress="Plus") | (<>ButtPress="Minus") | (<>ButtPress="Open")
				
			: (((<>ButtPress#"")) | (iOK=1) | (iCancel=1))
			Else 
				If (IP_l_Message>0)
					Case of 
						: (IP_l_Message=1)
							CANCEL:C270
						: (IP_l_Message=701)
							ARRAY LONGINT:C221($_al_ALDraggedRows; 0)
							ARRAY TEXT:C222($_at_CopyProductCodes; 0)
							ARRAY REAL:C219($_ar_CopyQuantities; 0)
							LB_GetSelect(->STK_lb_CurrentStock; ->$_al_ALDraggedRows)
							If (Size of array:C274($_al_ALDraggedRows)>0)
								For ($_l_ProductIndex; 1; Size of array:C274(STK_at_ProductCodes))
									$_l_DraggedRow:=Find in array:C230($_al_ALDraggedRows; $_l_ProductIndex)
									If ($_l_DraggedRow>0)
										APPEND TO ARRAY:C911($_at_CopyProductCodes; STK_at_ProductCodes{$_l_ProductIndex})
										APPEND TO ARRAY:C911($_ar_CopyQuantities; 0)  // so we  can put quantities
										
										
									End if 
									
								End for 
								If (Size of array:C274($_at_CopyProductCodes)>0)
									VARIABLE TO VARIABLE:C635(STK_l_CallBackProcessID; STK_at_CopiedProductCodes; $_at_CopyProductCodes; STK_ar_CopiedProductQuantites; $_ar_CopyQuantities)
									SET PROCESS VARIABLE:C370(STK_l_CallBackProcessID; IP_l_Message; 700)
									POST OUTSIDE CALL:C329(STK_l_CallBackProcessID)
									
								End if 
							End if 
							ARRAY LONGINT:C221($_al_ALDraggedRows; 0)
							LB_SetSelect(->STK_lb_CurrentStock; ->$_al_ALDraggedRows)
							
					End case 
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].STK_ShowCurrentStock"; $_t_oldMethodName)
