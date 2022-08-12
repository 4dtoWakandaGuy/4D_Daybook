//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDI_LoadSubArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:57`Method: ORDI_LoadSubArea
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORDI_LB_RelatedData;0)
	//ARRAY LONGINT(ORDI_al_Levels;0)
	//ARRAY LONGINT(ORDI_al_ModeOrders;0)
	//ARRAY LONGINT(ORDI_al_TabIncludes;0)
	//ARRAY LONGINT(ORDI_al_ViewsTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTabsSettings;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	//ARRAY TEXT(ORDI_at_ModeOrders;0)
	//ARRAY TEXT(ORDI_at_TabNames;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_NewLevel)
	C_LONGINT:C283($_l_ReuseLevel; $_l_TableRow; LBI_l_FillLevel; ORDI_at_ViewTabsLabelsOLD; ORDI_l_LBLEvel; vALLevels)
	C_PICTURE:C286(OrdIModePict)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_Reference; $_t_SubItemName; vButtDisOI)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_LoadSubArea")

//This method loads the sub area info for an order item
If (Count parameters:C259>=1)
	LBI_l_FillLevel:=$1
Else 
	LBI_l_FillLevel:=0
End if 
ARRAY LONGINT:C221(ORDI_al_Levels; 1)
$_l_ReuseLevel:=0
If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) & (vALLevels>0)
	If (ORDI_al_Levels{1}=0)
		$_bo_NewLevel:=True:C214
	Else 
		$_bo_NewLevel:=False:C215
		$_l_ReuseLevel:=ORDI_al_Levels{1}
	End if 
Else 
	$_bo_NewLevel:=False:C215
End if 
Case of 
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
		USE SET:C118("ORDI_FFSelection")
		//Because this does not use the definitions a definition set must be loaded-we will load the contacts
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
			ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
			QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Order_Code:11=[ORDER_ITEMS:25]Order_Code:1)
			SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
			QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
			LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[INVOICES:39]Invoice_Number:1; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Invoice_In"; 6; "Invoices"; "Invoice"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			ORDI_l_LBLEvel:=LBI_l_FillLevel
		End if 
		FUR_FillListBoxArea(->ORDI_LB_RelatedData; ->[ORDERS:24])
		
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //Invoices
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Order_Code:11=[ORDER_ITEMS:25]Order_Code:1)
		SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
		QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
		
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
			ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
			
			LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[INVOICES:39]Invoice_Number:1; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Invoice_In"; 6; "Invoices"; "Invoice"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			ORDI_l_LBLEvel:=LBI_l_FillLevel
		Else 
			
			
			LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
		End if 
		LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[ORDER_ITEMS:25]Purchase_Order_Number:18)
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
			ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
			
			LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "PurchaseOrder_In"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			ORDI_l_LBLEvel:=LBI_l_FillLevel
		Else 
			LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
		End if 
		LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //DIary
		
		If (Size of array:C274(ORDI_at_TabNames)=0)
			SD2_GetRelatedDiaryItems(Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); String:C10([ORDER_ITEMS:25]Item_Number:27))
			If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
				ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
				
				LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
				ORDI_l_LBLEvel:=LBI_l_FillLevel
			Else 
				LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
			End if 
			LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
		Else 
			$_l_TableRow:=Find in array:C230(ORDI_at_TabNames; ORDI_at_ViewTabsLabels{ORDI_at_ViewTabsLabels})
			If ($_l_TableRow>0)  //it should be
				ORDI_SelectDiaryRecords($_l_TableRow)
				If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
					If (Size of array:C274(ORDI_al_TabIncludes{$_l_TableRow})>0)
						
						
						ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
						
						LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						ORDI_l_LBLEvel:=LBI_l_FillLevel
						
					Else 
						ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
						SD2_GetRelatedDiaryItems(Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); String:C10([ORDER_ITEMS:25]Item_Number:27))
						LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						ORDI_l_LBLEvel:=LBI_l_FillLevel
					End if 
					
				Else 
					
					LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
					
				End if 
				LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
			End if 
			
		End if 
		
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
		SD2_GetRelatedDiaryItems(Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); String:C10([ORDER_ITEMS:25]Item_Number:27); True:C214)
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
			ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
			
			LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
			ORDI_l_LBLEvel:=LBI_l_FillLevel
		Else 
			
			LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
		End if 
		LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
	: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //Documents
		If ([ORDER_ITEMS:25]Item_Number:27#0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=[ORDER_ITEMS:25]Item_Number:27; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=[ORDER_ITEMS:25]Item_Number:27)
		Else 
			REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		End if 
		If (Size of array:C274(ORDI_aptr_ListBoxPointers)=0) | (ORDI_at_ViewTabsLabelsOLD#ORDI_at_ViewTabsLabels)
			ORDI_at_ViewTabsLabelsOLD:=ORDI_at_ViewTabsLabels
			LBi_ArrDefFill(->ORDI_aptr_ListBoxPointers; ->ORDI_LB_RelatedData; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[ORDER_ITEMS:25]Item_Number:27; $_t_Reference; "Stock_in"; 1; "items"; "item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			ORDI_l_LBLEvel:=LBI_l_FillLevel
		Else 
			
			LBi_Prefs11(->ORDI_aptr_ListBoxPointers)
		End if 
		LBi_LoadSetup(->ORDI_aptr_ListBoxPointers; "P"; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels})
End case 
If (ORDI_al_Levels{1}=0)
	ORDI_al_Levels{1}:=vALLevels
End if 
If (Size of array:C274(ORDI_aptr_ListBoxPointers)>=9)
	//NG at the moment you cannot delete any of these from the remove button
	$_ptr_ArrayReferences:=ORDI_aptr_ListBoxPointers{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		If (FORM Get current page:C276>2)
			If (False:C215)  //if and when we make items removable then we can enable this
				In_ButtChkDis(->vButtDisOI; "Order Item"; $_t_SubItemName)
			Else 
				In_ButtChkDis(->vButtDisOI; "Order Item")
			End if 
		Else 
			In_ButtChkDis(->vButtDisOI; "Order Item")
		End if 
	End if 
Else 
	In_ButtChkDis(->vButtDisOI; "Order Item")
End if 
If (ORDI_at_ModeOrders=0)
	ORDI_at_ModeOrders:=1
	ORDI_al_ModeOrders:=1
End if 
Case of 
	: (ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels}=0)
		If ([ORDER_ITEMS:25]Invoice_Number:17#"")
			ORDI_al_ModeOrders{1}:=2
			ORDI_at_ModeOrders{1}:="No Edit"
		Else 
			ORDI_al_ModeOrders{1}:=-1
			ORDI_at_ModeOrders{1}:="No Edit"  //By doing this it cannot be changed
		End if 
	: (ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels}=3)
		ORDI_al_ModeOrders{1}:=-1
		ORDI_at_ModeOrders{1}:="Edit"
End case 
LBI_l_FillLevel:=0
LBi_EditListLay(->ORDI_aptr_ListBoxPointers; ->ORDI_at_ModeOrders; ->OrdIModePict; ->ORDI_al_ModeOrders)
ERR_MethodTrackerReturn("ORDI_LoadSubArea"; $_t_oldMethodName)
