//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PurchOrd_InLPß
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_LB_PurchaseOrderItems;0)
	ARRAY LONGINT:C221($_al_ItemIDS; 0)
	ARRAY LONGINT:C221($_al_ItemNumbers; 0)
	//ARRAY LONGINT(PO_al_Levels;0)
	//ARRAY LONGINT(PO_al_Mode;0)
	//ARRAY LONGINT(PO_al_TabIncludes;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY LONGINT(PO_al_ViewTabsSettings;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	ARRAY TEXT:C222($_at_PINumbers; 0)
	//ARRAY TEXT(PO_at_ModePO;0)
	//ARRAY TEXT(PO_at_TabNames;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_Editable; $_bo_Messages; $_bo_NewLevel; $2)
	C_LONGINT:C283($_l_CurrentFormPage; $_l_OK; $_l_PIIndex; $_l_ReuseLevel; $_l_TabRow; PO_l_SelectedTabsLabelsOLD; vALLevels)
	C_PICTURE:C286(PO_pic_EditMode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_REAL:C285(PO_al_EditMode)
	C_TEXT:C284($_t_FlagReference; $_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; $1; vButtDisInv)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_InLPß")
//PurchOrd_InLPß
If (Count parameters:C259>=1)
	$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Else 
	$_t_HandlerCharacter1:="B"
End if 
$_bo_Messages:=False:C215

If (Count parameters:C259>=2)
	$_bo_Messages:=$2
End if 

Case of 
	: ($_t_HandlerCharacter1="N")  //(($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  `use this bit if don't use Before2 method
		
		PurchOrd_InLPB
	: ($_t_HandlerCharacter1="A")  //| ($_t_HandlerCharacter1="F"))  `not F cos accepts the record
		
		PurchOrd_InLPA
	: ($_t_HandlerCharacter1="C")
		
	: ($_t_HandlerCharacter1="D")
		Minor_DelSin(->[PURCHASE_ORDERS:57])
End case 

If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			$_l_CurrentFormPage:=1
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			If (Count parameters:C259>=1)
				$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
				
			Else 
				$_l_CurrentFormPage:=FORM Get current page:C276
			End if 
	End case 
	ARRAY LONGINT:C221(PO_al_Levels; 1)
	$_l_ReuseLevel:=0
	If (Size of array:C274(POI_aptr_LBSetup)=0) & (vALLevels>0)
		If (PO_al_Levels{1}=0)
			$_bo_NewLevel:=True:C214
			
		Else 
			$_bo_NewLevel:=False:C215
			$_l_ReuseLevel:=PO_al_Levels{1}
		End if 
	Else 
		$_bo_NewLevel:=False:C215
	End if 
	
	Case of 
		: ($_l_CurrentFormPage=1)
			$_bo_Editable:=(PO_al_ViewTabsSettings{PO_at_ViewTabsLabels}=0)
			If ($_bo_Editable)
				$_t_FlagReference:="411111000"
			Else 
				$_t_FlagReference:="311111000"
			End if 
			Case of 
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))  //Purchase Order items
					If ($_bo_Messages)
						ALERT:C41("Loading further Fields")
					End if 
					
					
					USE SET:C118("PO_FFSelection")
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#"")
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						Else 
							REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 0)
						End if 
						LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[PURCHASE_ORDERS_ITEMS:169]ID:17; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Items_in"; 3; "Purchase Items"; "Purchase Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->POI_aptr_LBSetup)
								// :  ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
					End if 
					FUR_FillListBoxArea(->PO_LB_PurchaseOrderItems; ->[PURCHASE_ORDERS:57])
					
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57])) | (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))  //Purchase Order items
					If ($_bo_Messages)
						ALERT:C41("Loading Purchase order items")
					End if 
					
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#"")
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						Else 
							REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 0)
						End if 
						LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[PURCHASE_ORDERS_ITEMS:169]ID:17; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Items_in"; 3; "Purchase Items"; "Purchase Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->POI_aptr_LBSetup)
								// :  ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
					End if 
					LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //Sales order items
					If ($_bo_Messages)
						ALERT:C41("Loading  order items")
					End if 
					
					
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Items_in"; 24; "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
						
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->POI_aptr_LBSetup)
								// :  ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
					End if 
					LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					
					
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //Purchase invoices
					If ($_bo_Messages)
						ALERT:C41("Loading Purchase invoice items")
					End if 
					
					ARRAY TEXT:C222($_at_PINumbers; 0)
					// Can t use this with a subtableDISTINCT VALUES([PURCHASE ORDERS]ITEMS'Purch Inv_No;$_at_PINumbers)
					QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
					For ($_l_PIIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
						If ([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8#"")
							APPEND TO ARRAY:C911($_at_PINumbers; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
						End if 
						NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
					End for 
					
					
					QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; $_at_PINumbers)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4#"")
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						
						If (Size of array:C274(POI_aptr_LBSetup)=0)
							
							//ALArrDefFill (->POI_aptr_LBSetup;->eALPuOII;->[PURCHASE ORDERS];->[PURCHASE ORDERS]ITEMS;"Red";"ALModPuOI";"211111000";"Items_in";"05703";◊User;"[PURCHASE ORDERS]ITEMS";"Purchase Order Items";"Purchase Order Item";->[PURCHASE ORDERS];->[PURCHASE ORDERS]Purch Ord No)  `NG April 2004 Removed ◊Screen
							LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Purchases_in"; 4; "Purchases"; "Purchase invoice"; ""; $_bo_NewLevel; $_l_ReuseLevel)
							//;"";False)
							
							
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									LBi_Prefs11(->POI_aptr_LBSetup)
									// :  ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
						End if 
					End if 
					LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //Stock movement items
					If ($_bo_Messages)
						ALERT:C41("Loading stock movement  items")
					End if 
					
					ARRAY LONGINT:C221($_al_ItemNumbers; 0)
					ARRAY LONGINT:C221($_al_ItemIDS; 0)
					// Cant use this with a subtable DISTINCT VALUES([PURCHASE ORDERS]ITEMS'Item Number;$_al_ItemNumbers)
					QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
					For ($_l_PIIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
						If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6#0)
							APPEND TO ARRAY:C911($_al_ItemNumbers; [PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
						End if 
						If ([PURCHASE_ORDERS_ITEMS:169]POitemID:16#0)
							APPEND TO ARRAY:C911($_al_ItemIDS; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
						End if 
						NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
					End for 
					QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; $_al_ItemNumbers)
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						
						//QUERY([STOCK MOVEMENTS];[STOCK MOVEMENTS]MovementSourceReference=[PURCHASE ORDERS]Purch Ord No;*)
						//QUERY([STOCK MOVEMENTS]; & ;[STOCK MOVEMENTS]MovementSourceTable=Table([PURCHASE ORDERS]))
						
						If (Size of array:C274(POI_aptr_LBSetup)=0)
							
							//ALArrDefFill (->POI_aptr_LBSetup;->eALPuOII;->[PURCHASE ORDERS];->[PURCHASE ORDERS]ITEMS;"Red";"ALModPuOI";"211111000";"Items_in";"05703";◊User;"[PURCHASE ORDERS]ITEMS";"Purchase Order Items";"Purchase Order Item";->[PURCHASE ORDERS];->[PURCHASE ORDERS]Purch Ord No)  `NG April 2004 Removed ◊Screen
							If (<>DB_bo_NewStockActive)
								LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Stock_in"; 1; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
								
							Else 
								LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Stock_in"; 1; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel)
								
							End if 
							
							
							
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									LBi_Prefs11(->POI_aptr_LBSetup)
									// :  ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
						End if 
					End if 
					LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					
					
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
					If ($_bo_Messages)
						ALERT:C41("Loading diary items")
					End if 
					
					If (Size of array:C274(PO_at_TabNames)=0)
						SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_ORDERS:57]); Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						
						If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
							PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
							
							// [DIARY];"Diary_InNEW"
							LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11(->POI_aptr_LBSetup)
									
							End case 
						End if 
						LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					Else 
						$_l_TabRow:=Find in array:C230(PO_at_TabNames; PO_at_ViewTabsLabels{PO_at_ViewTabsLabels})
						If ($_l_TabRow>0)  //it should be
							
							If (Size of array:C274(PO_al_TabIncludes{$_l_TabRow})>0)
								PO_SelectDiaryRecords($_l_TabRow)
							Else 
								SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_ORDERS:57]); Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
							End if 
							If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
								PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
								If (Size of array:C274(PO_al_TabIncludes{$_l_TabRow})>0)
									PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
									
									LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
								Else 
									PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
									LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
									
								End if 
								
							Else 
								OK:=1
								Case of 
									: ($_t_HandlerCharacter1="B")
										
										LBi_Prefs11(->POI_aptr_LBSetup)
										
								End case 
								
								
							End if 
							LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
						End if 
						
					End if 
				: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
					If ($_bo_Messages)
						ALERT:C41("Loading documents")
					End if 
					
					SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_ORDERS:57]); Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); [PURCHASE_ORDERS:57]Purchase_Order_Number:2; True:C214)
					
					If (Size of array:C274(POI_aptr_LBSetup)=0) | (PO_l_SelectedTabsLabelsOLD#PO_at_ViewTabsLabels)
						
						PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
						
						//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
						//see _inProcess(it may be one of several forms
						
						LBi_ArrDefFill(->POI_aptr_LBSetup; ->PO_LB_PurchaseOrderItems; ->[DIARY:12]Diary_Code:3; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								
								LBi_Prefs11(->POI_aptr_LBSetup)
								
						End case 
					End if 
					LBi_LoadSetup(->POI_aptr_LBSetup; $_t_HandlerCharacter1; PO_al_ViewTabsSettings{PO_at_ViewTabsLabels})
					
			End case 
			If ($_bo_Messages)
				ALERT:C41("Loaded")
			End if 
			If (PO_al_Levels{1}=0)
				PO_al_Levels{1}:=vALLevels
			End if 
			If (Size of array:C274(POI_aptr_LBSetup)>=9)
				
				$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
				If (Size of array:C274($_ptr_ArrayReferences->)>=10)
					$_t_SubItemName:=$_ptr_ArrayReferences->{10}
					If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //if and when we make other  items removable then we can enable other items
						
						In_ButtChkDis(->vButtDisInv; "Purchase Order"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisInv; "Purchase Order")
					End if 
					
				End if 
			End if 
			PO_at_ModePO:=1
			PO_al_EditMode:=1
			
			
			Case of 
				: (PO_al_ViewTabsSettings{PO_at_ViewTabsLabels}=0)
					PO_al_Mode{1}:=2
					PO_at_ModePO{1}:="No Edit"
				: (PO_al_ViewTabsSettings{PO_at_ViewTabsLabels}=3)
					PO_al_Mode{1}:=-1
					PO_at_ModePO{1}:="Edit"
					
			End case 
			LBi_EditListLay(->POI_aptr_LBSetup; ->PO_at_ModePO; ->PO_pic_EditMode; ->PO_al_Mode)
		: ($_l_CurrentFormPage=2)
			//If ($_t_HandlerCharacter1="P")
			//  ALSetScroll0 (»POI_aptr_LBSetup)`enable this once set up allocations
			//  End if
			//Allocations
			
	End case 
	
	If (Size of array:C274(POI_aptr_LBSetup)>=9)
		
		$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)  //this is only here as a precaution
			
			$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))  //if and when we make other  items removable then we can enable other items
				
				In_ButtChkDis(->vButtDisInv; "Purchase Order"; $_t_SubItemName)
			Else 
				In_ButtChkDis(->vButtDisInv; "Purchase Order")
			End if 
			
		End if 
	Else 
		
		In_ButtChkDis(->vButtDisInv)
		
	End if 
	
	
Else 
	If ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))
		LBi_pRefs4upd(->POI_aptr_LBSetup)
	End if 
	$_l_OK:=OK
	LBi_EditListLay(->POI_aptr_LBSetup; ->PO_at_ModePO; ->PO_pic_EditMode; ->PO_al_Mode)
	OK:=$_l_OK
	//no ALpRefs4Sort
	
	
End if 
ERR_MethodTrackerReturn("PurchOrd_InLPß"; $_t_oldMethodName)
