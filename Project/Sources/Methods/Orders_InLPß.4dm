//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:27`Method: Orders_InLPß
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>l_FS_FieldSortChangedAlert)
	//C_UNKNOWN($1)
	//C_UNKNOWN(vALLevels)
	//C_UNKNOWN(vButtDisOrd)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(ORD_al_DocIncludes;0)
	//ARRAY LONGINT(ORD_al_EditMode;0)
	//ARRAY LONGINT(ORD_Al_FormIDs;0)
	//ARRAY LONGINT(ORD_al_Levels;0)
	//ARRAY LONGINT(ORD_al_modeOrders;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_TabIncludes;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORD_al_ViewTabsSettings;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY POINTER(ORD_aptr_DiaryPointers;0)
	//ARRAY POINTER(ORD_aptr_DocumentDiaryPointers;0)
	//ARRAY POINTER(ORD_aptr_FFPointers;0)
	//ARRAY POINTER(ORD_aptr_InvoicePointers;0)
	//ARRAY POINTER(ORD_aptr_OrdItemPointers;0)
	//ARRAY POINTER(ORD_aptr_POPointers;0)
	//ARRAY POINTER(ORD_aptr_StockItemPointers;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	//ARRAY TEXT(ORD_at_SubAreaContext;0)
	//ARRAY TEXT(ORD_at_SubAreaContextUsage;0)
	//ARRAY TEXT(ORD_at_TabNames;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_BOOLEAN:C305($_bo_Editable; $_bo_LoadSetup; $_bo_NewLevel; ORD_bo_IsRevision; $_bo_Editable; $_bo_LoadSetup; $_bo_NewLevel; ORD_bo_IsRevision)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_ActionGroupIndex; $_l_ActionGroupRow; $_l_ActionID; $_l_ActionTabRow; $_l_CurrentFormPage; $_l_FormRow; $_l_Nul; $_l_ReuseLevel; $_l_SordDirection; $_l_SortChangeAlert)
	C_LONGINT:C283($_l_SortFieldNumber; $_l_TabIndex; ORD_l_AdHocAddressMode; ORD_l_BDragAll; ORD_l_BDragOrd; ORD_l_SelectedViewTabOLD; vALLevels; $_l_ActionGroupIndex; $_l_ActionGroupRow; $_l_ActionID; $_l_ActionTabRow)
	C_LONGINT:C283($_l_CurrentFormPage; $_l_FormRow; $_l_Nul; $_l_ReuseLevel; $_l_SordDirection; $_l_SortChangeAlert; $_l_SortFieldNumber; $_l_TabIndex; DF_l_ContactCentric; ORD_l_AdHocAddressMode; ORD_l_BDragAll)
	C_LONGINT:C283(ORD_l_BDragOrd; ORD_l_SelectedViewTabOLD)
	C_PICTURE:C286(OrdModePict)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayFieldPointers2; $_ptr_ArrayReferences; $_ptr_ArrayReferences2; $_ptr_ListBoxSetup; $_ptr_ListboxSetup2; $_ptr_ArrayFieldPointers; $_ptr_ArrayFieldPointers2; $_ptr_ArrayReferences; $_ptr_ArrayReferences2; $_ptr_ListBoxSetup)
	C_POINTER:C301($_ptr_ListboxSetup2)
	C_REAL:C285(ORD_al_EditMode; ORD_r_SubSelection; ORD_r_SubSelection)
	C_TEXT:C284($_t_DataEditFormName; $_t_DragString; $_t_HandlerCharacter1; $_t_LBAreaOptions; $_t_oldMethodName; $_t_SubItemName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
	C_TEXT:C284(vButtDisOrd; $_t_CurrentDefinitionsName; $_t_DataEditFormName; $_t_DragString; $_t_HandlerCharacter1; $_t_LBAreaOptions; $_t_oldMethodName; $_t_SubItemName; DB_t_CurrentFormUsage; SYS_t_AccessType)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPß")
//Orders_InLPß - the pretend before phase NOTE: NOT Orders_InLPB
//see InButt_LPß for description of param
//TRACE
ORD_l_AdHocAddressMode:=0
$_l_CurrentFormPage:=FORM Get current page:C276
If (Count parameters:C259>=1)
	$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Else 
	$_t_HandlerCharacter1:="B"
End if 
Case of 
	: ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="B")  //| ($_t_HandlerCharacter1="N"))  `
		
		Orders_InLPB
	: ($_t_HandlerCharacter1="A")
		Orders_InLPA
	: ($_t_HandlerCharacter1="F")  //not F if LPA Accepts the record
		
		Orders_InLPA(False:C215)
	: ($_t_HandlerCharacter1="C")
		Orders_InCan("Orders_InLPß")
	: ($_t_HandlerCharacter1="D")
		Order_InDel
End case 

If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P") | ($_t_HandlerCharacter1="X"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			$_l_CurrentFormPage:=1
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			If (Count parameters:C259>=1)
				$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
				
			Else 
				$_l_CurrentFormPage:=1
			End if 
	End case 
	If (ORD_bo_IsRevision)
		ORD_at_ViewTabsLabels:=1
		OBJECT SET VISIBLE:C603(ORD_at_ViewTabsLabels; False:C215)
	End if 
	If (ORD_at_ViewTabsLabels>Size of array:C274(ORD_at_ViewTabsLabels))
		ORD_at_ViewTabsLabels:=1
	End if 
	
	Case of 
		: (($_l_CurrentFormPage=1) & (Not:C34($_t_HandlerCharacter1="P"))) | (($_l_CurrentFormPage=1) & (FORM Get current page:C276=1))  //&(Current form page
			
			
			$_bo_Editable:=(ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels}=0)
			
			
			If ($_bo_Editable)
				$_t_LBAreaOptions:="411111126"
			Else 
				$_t_LBAreaOptions:="311111000"
			End if 
			
			If (FORM Get current page:C276#1) & (Not:C34(ORD_bo_IsRevision))
				If (DB_t_CurrentFormUsage#"AS")  //only because the Items are always brought in anyway in the during
					
					Orders_InLPOI
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				End if 
			End if 
			ARRAY LONGINT:C221(ORD_al_Levels; 1)
			$_l_ReuseLevel:=0
			$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
			If ($_l_ActionTabRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
				
				If (Size of array:C274($_ptr_ListBoxSetup->)=0) & (vALLevels>0)
					If (ORD_al_Levels{1}=0)
						$_bo_NewLevel:=True:C214
						
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=ORD_al_Levels{1}
					End if 
				Else 
					$_bo_NewLevel:=False:C215
				End if 
			End if 
			$_l_Nul:=0
			$_ptr_ListBoxSetup:=->$_l_Nul
			
			Case of 
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_FFPointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_FFPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[CUSTOM_FIELDS:98]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					USE SET:C118("ORD_FFSelection")
					$_bo_LoadSetup:=True:C214
					//Because this does not use the definitions a definition set must be loaded-we will load the contacts
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)  //| ($_t_HandlerCharacter1="B")
						
						
						
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						
						//see also Contacts_InLPß
						//NG April 2004 Removed ◊Screen
						If ($_bo_NewLevel)
							LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Items_in"; (3+Num:C11(SYS_t_AccessType="Q")+(2*(Num:C11((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@"))))); "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						End if 
						//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
						//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
						If (LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Sort_Order:26; $_ptr_ListBoxSetup)<0)
							LBI_InsertArr($_ptr_ListBoxSetup; ->ORD_r_SubSelection; 0; ->[ORDER_ITEMS:25]Sort_Order:26; 100; "Sort Order")
							
						End if 
						$_ptr_ListboxSetup2:=->ORD_aptr_FFPointers
						$_ptr_ArrayReferences2:=$_ptr_ListboxSetup2->{9}
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences2->{6}
						$_ptr_ArrayFieldPointers2:=$_ptr_ListboxSetup2->{2}
						$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
						<>l_FS_FieldSortChangedAlert:=1
						FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SordDirection; Field:C253(->[ORDER_ITEMS:25]Sort_Order:26); Table:C252(->[ORDER_ITEMS:25]); ""; "")
						<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
					End if 
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; False:C215)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; True:C214)
					
					FUR_FillListBoxArea(->ORD_lb_ArraySelection; ->[ORDERS:24])
					
					
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //Order items
					//TRACE
					
					
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_OrdItemPointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_OrdItemPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					If (Read only state:C362([ORDERS:24])=False:C215)
						READ WRITE:C146([ORDER_ITEMS:25])
						
					Else 
						READ ONLY:C145([ORDER_ITEMS:25])
					End if 
					If (DB_t_CurrentFormUsage#"AS")  //only because the Items are always brought in anyway in the during
						
						Orders_InLPOI
					Else 
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					End if 
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						//see also Contacts_InLPß
						//NG April 2004 Removed ◊Screen
						//TRACE
						
						If ($_bo_NewLevel)
							LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Items_in"; 3; "Order Line Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						End if 
						//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
						//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
						If (LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Sort_Order:26; $_ptr_ListBoxSetup)<0)
							LBI_InsertArr($_ptr_ListBoxSetup; ->ORD_r_SubSelection; 0; ->[ORDER_ITEMS:25]Sort_Order:26; 100; "Sort Order")
							
						End if 
						$_ptr_ArrayReferences:=ORD_aptr_OrdItemPointers{9}
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
						$_ptr_ArrayFieldPointers2:=ORD_aptr_OrdItemPointers{2}
						$_l_ActionTabRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
						$_l_SordDirection:=0
						If ($_l_ActionTabRow>0)
							$_l_SordDirection:=<>FS_al_FormSortDirection{$_l_ActionTabRow}
						Else 
							$_l_SordDirection:=1
						End if 
						$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
						<>l_FS_FieldSortChangedAlert:=1
						FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SordDirection; Field:C253(->[ORDER_ITEMS:25]Sort_Order:26); Table:C252(->[ORDER_ITEMS:25]); ""; "")
						<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
						
					Else 
						
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								$_l_SortFieldNumber:=0
								LBi_Prefs11(->ORD_aptr_OrdItemPointers)
								$_ptr_ListboxSetup:=->ORD_aptr_OrdItemPointers
								$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
								$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
								$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
								$_l_ActionTabRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
								$_l_SordDirection:=0
								If ($_l_ActionTabRow>0)
									$_l_SordDirection:=<>FS_al_FormSortDirection{$_l_ActionTabRow}
									If ($_l_SortFieldNumber=<>FS_al_FormSortFieldNum{$_l_ActionTabRow})  //` | ((-Abs($_l_ColumnNumber))=◊FS_al_FormSortFieldNum{$_l_ActionTabRow})
										$_l_SordDirection:=-1  //kmw 29/08/06 - above line altered to this so that we toggle between 1 and -1 instead of 1 and 0 (rest of code seems to expect the former).
										
										
										
									Else 
										$_l_SordDirection:=1
									End if 
								Else 
									$_l_SordDirection:=1
								End if 
								
								$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
								<>l_FS_FieldSortChangedAlert:=1
								FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SordDirection; Field:C253(->[ORDER_ITEMS:25]Sort_Order:26); Table:C252(->[ORDER_ITEMS:25]); ""; "")
								<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
								
						End case 
					End if 
					LBi_LoadSetup(->ORD_aptr_OrdItemPointers; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
					
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_DiaryPointers; 0)  //Note multiple pointers for diary
						
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_DiaryPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[DIARY:12]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					$_t_DataEditFormName:=""
					$_l_ActionTabRow:=Find in array:C230(ORD_at_TabNames; ORD_at_ViewTabsLabels{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow>0)
						If (ORD_Al_FormIDs{$_l_ActionTabRow}>0)
							SD2_loadFormNames
							$_l_FormRow:=Find in array:C230(SD_al_FormReferenceID; ORD_Al_FormIDs{$_l_ActionTabRow})
							If ($_l_FormRow>0)
								$_t_DataEditFormName:=SD2_at_FormNames{$_l_FormRow}
							Else 
								$_t_DataEditFormName:=""
							End if 
						Else 
							$_t_DataEditFormName:=""
						End if 
					End if 
					If (Size of array:C274(ORD_at_TabNames)=0)
						
						
						SD2_GetRelatedDiaryItems(Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3)
						
						If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
							ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
							LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									
									LBi_Prefs11($_ptr_ListBoxSetup)
									//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
									//   : ($_t_HandlerCharacter1="P")
									//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
							End case 
						End if 
						LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
						$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
						If ($_t_DataEditFormName#"")
							$_ptr_ArrayReferences->{5}:=$_t_DataEditFormName
						Else 
							$_ptr_ArrayReferences->{5}:="Diary_InNEW"
						End if 
					Else 
						$_l_ActionTabRow:=Find in array:C230(ORD_at_TabNames; ORD_at_ViewTabsLabels{ORD_at_ViewTabsLabels})
						If ($_l_ActionTabRow>0)  //it should be
							
							CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
							For ($_l_TabIndex; 1; Size of array:C274(ORD_al_TabIncludes{$_l_ActionTabRow}))
								If (ORD_al_TabIncludes{$_l_ActionTabRow}{$_l_TabIndex}>0)
									QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=ORD_al_TabIncludes{$_l_ActionTabRow}{$_l_TabIndex})
									If (Records in selection:C76([ACTIONS:13])>0)
										QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
										If (ORD_al_DocIncludes{$_l_ActionTabRow}=0)  //don't include diary items with documents.
											
											QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
										End if 
										QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
										// [DIARY];"Diary_InNEW"
										CREATE SET:C116([DIARY:12]; "Action")
										SD2_GetRelatedDiaryItems(Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3; (ORD_al_DocIncludes{$_l_ActionTabRow}=1))
										CREATE SET:C116([DIARY:12]; "OrderMatch")
										INTERSECTION:C121("Action"; "OrderMatch"; "Action2")
										UNION:C120("Action2"; "ToDisplay"; "ToDisplay")
										SD2_GetRelatedDiaryItems(Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3; (ORD_al_DocIncludes{$_l_ActionTabRow}=1))
										CREATE SET:C116([DIARY:12]; "OrderMatch")
										INTERSECTION:C121("Action"; "OrderMatch"; "Action")
										UNION:C120("Action"; "ToDisplay"; "ToDisplay")
										UNLOAD RECORD:C212([ACTIONS:13])
										UNLOAD RECORD:C212([ACTIONS:13])
									End if 
								Else 
									//action is a group of actions
									$_l_ActionGroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99(ORD_al_TabIncludes{$_l_ActionTabRow}{$_l_TabIndex}))
									If ($_l_ActionGroupRow>0)
										For ($_l_ActionGroupIndex; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionGroupRow}))
											$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_ActionGroupRow}{$_l_ActionGroupIndex}
											If ($_l_ActionID>0)
												QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
												If (Records in selection:C76([ACTIONS:13])>0)
													QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
													
													If (ORD_al_DocIncludes{$_l_ActionTabRow}=0)  //don't include diary items with documents.
														
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
													End if 
													
													QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
													CREATE SET:C116([DIARY:12]; "Action")
													SD2_GetRelatedDiaryItems(Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3; (ORD_al_DocIncludes{$_l_ActionTabRow}=1))
													CREATE SET:C116([DIARY:12]; "OrderMatch")
													INTERSECTION:C121("Action"; "OrderMatch"; "Action")
													
													UNION:C120("Action"; "ToDisplay"; "ToDisplay")
													UNLOAD RECORD:C212([ACTIONS:13])
												End if 
												
											End if 
											
										End for 
										
									End if 
									
								End if 
								
							End for 
							
							USE SET:C118("ToDisplay")
							If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
								If (Size of array:C274(ORD_al_TabIncludes{$_l_ActionTabRow})>0)
									ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
								Else 
									ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
									SD2_GetRelatedDiaryItems(Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3)
									LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
									
								End if 
								
							Else 
								OK:=1
								Case of 
									: ($_t_HandlerCharacter1="B")
										
										LBi_Prefs11($_ptr_ListBoxSetup)
										//ALpRefs11 (->ORD_aPtr_OrderItemsSetup)
										//   : ($_t_HandlerCharacter1="P")
										//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
								End case 
								
								
							End if 
							LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
							$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
							If ($_t_DataEditFormName#"")
								$_ptr_ArrayReferences->{5}:=$_t_DataEditFormName
							Else 
								$_ptr_ArrayReferences->{5}:="Diary_InNEW"
							End if 
						End if 
						
					End if 
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
					
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_DocumentDiaryPointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_DocumentDiaryPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[DIARY:12]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					
					SD2_GetRelatedDiaryItems(Table:C252(->[ORDERS:24]); Field:C253(->[ORDERS:24]Order_Code:3); [ORDERS:24]Order_Code:3; True:C214)
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						
						//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
						//see _inProcess(it may be one of several forms
						
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								
								LBi_Prefs11($_ptr_ListBoxSetup)
								
						End case 
					End if 
					LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_InvoicePointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_InvoicePointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[INVOICES:39]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Order_Code:11=[ORDERS:24]Order_Code:3)
					SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
					QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
					
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[INVOICES:39]Invoice_Number:1; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Invoice_In"; 6; "Invoices"; "Invoice"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								
								LBi_Prefs11($_ptr_ListBoxSetup)
								
						End case 
					End if 
					LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_POPointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_POPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[PURCHASE_ORDERS:57]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					
					ARRAY TEXT:C222($_at_PONumbers; 0)
					DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)
					QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
					
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "PurchaseOrder_In"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								
								LBi_Prefs11($_ptr_ListBoxSetup)
								
						End case 
					End if 
					LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					LISTBOX SET TABLE SOURCE:C1013(ORD_r_SubSelection; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					If ($_l_ActionTabRow<0)
						ARRAY POINTER:C280(ORD_aptr_StockItemPointers; 0)
						APPEND TO ARRAY:C911(ORD_aptr_SubAreaPointers; ->ORD_aptr_StockItemPointers)
						APPEND TO ARRAY:C911(ORD_al_SubAreaTables; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						APPEND TO ARRAY:C911(ORD_at_SubAreaContext; "")
						APPEND TO ARRAY:C911(ORD_at_SubAreaContextUsage; "")
						$_l_ActionTabRow:=Size of array:C274(ORD_aptr_SubAreaPointers)
						$_bo_NewLevel:=True:C214
						$_l_ReuseLevel:=0
					Else 
						$_bo_NewLevel:=False:C215
						$_l_ReuseLevel:=0
					End if 
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
					$_bo_LoadSetup:=True:C214
					
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3=[ORDERS:24]Order_Code:3; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3#"")
					
					If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ORD_l_SelectedViewTabOLD#ORD_at_ViewTabsLabels)
						ORD_l_SelectedViewTabOLD:=ORD_at_ViewTabsLabels
						LBi_ArrDefFill($_ptr_ListBoxSetup; ->ORD_r_SubSelection; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16; ->[ORDERS:24]Order_Code:3; $_t_LBAreaOptions; "Stock_in"; 1; "Items"; "Item"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ORD_SelectedRelated")
						
						
						
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								
								LBi_Prefs11($_ptr_ListBoxSetup)
								
						End case 
						
					End if 
					LBi_LoadSetup($_ptr_ListBoxSetup; $_t_HandlerCharacter1; ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels})
					
					
				Else 
					OBJECT SET VISIBLE:C603(ORD_r_SubSelection; True:C214)
					OBJECT SET VISIBLE:C603(ORD_lb_ArraySelection; False:C215)
					
					
					
			End case 
			If (ORD_al_Levels{1}=0)
				ORD_al_Levels{1}:=vALLevels
			End if 
			If ($_ptr_ListBoxSetup->#0)
				If (Old:C35([ORDERS:24]Order_Code:3)="")
					//◊ALMODE:=2
					ORD_at_ModeOrders:=1  //NG April 2007 see in LBI Editlist lay for what happens here
					
					
					LBi_EditListLay($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; ->OrdModePict; ->ORD_al_modeOrders)
				Else 
					//◊ALMODE:=1
					ORD_at_ModeOrders:=1
					LBi_EditListLay($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; ->OrdModePict; ->ORD_al_modeOrders)
				End if 
				
				ORD_at_ModeOrders:=1
				ORD_al_EditMode:=1
				
				
				Case of 
					: (ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels}=0)
						ORD_al_modeOrders{1}:=2
						ORD_at_ModeOrders{1}:="No Edit"
					: (ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels}=3)
						ORD_al_modeOrders{1}:=-1
						ORD_at_ModeOrders{1}:="Edit"
						
				End case 
				LBi_EditListLay($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; ->OrdModePict; ->ORD_al_modeOrders)
			End if 
		: ($_l_CurrentFormPage=2)
			
	End case 
	$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
	If ($_l_ActionTabRow>0)
		$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
		
		If (Size of array:C274($_ptr_ListBoxSetup->)>=9)
			
			$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: ($_l_CurrentFormPage=1)
						If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25])) | (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //if and when we make other  items removable then we can enable other items
							
							In_ButtChkDis(->vButtDisOrd; "Order"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisOrd; "Order")
						End if 
					: ($_l_CurrentFormPage=2)
						In_ButtChkDis(->vButtDisOrd; "Order")
				End case 
			End if 
		End if 
	End if 
Else 
	$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
	If ($_l_ActionTabRow>0)
		$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
		
		If ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))
			LBi_pRefs4upd($_ptr_ListBoxSetup)
		End if 
		If (((($_t_HandlerCharacter1="A") | ($_t_HandlerCharacter1="F")) & (OK=1)) | ($_t_HandlerCharacter1="T"))
			If (DB_t_CurrentFormUsage#"") & (False:C215)
				//the sort order is set in a different way now so this is not required on orders.
				
				LBi_Prefs4Sort($_ptr_ListBoxSetup)  //only for those with dragging & sort order flds
				
			End if 
		End if 
	End if 
End if 


OBJECT SET VISIBLE:C603(ORD_l_BDragAll; False:C215)
OBJECT SET VISIBLE:C603(ORD_l_BDragOrd; False:C215)
If (ORD_bo_IsRevision)
	$_l_ActionTabRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
	If ($_l_ActionTabRow>0)
		$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_ActionTabRow}
		LB_SetEnterable(->ORD_r_SubSelection; False:C215; 0)
		//AL_SetEnterable (eALOrdII;0;0)
		ORD_at_ModeOrders:=1
		LBi_EditListLay($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; ->OrdModePict; ->ORD_al_modeOrders)
		OBJECT SET VISIBLE:C603(<>LB_at_EditModes; False:C215)
		OBJECT SET VISIBLE:C603(ORD_l_BDragAll; True:C214)
		OBJECT SET VISIBLE:C603(ORD_l_BDragOrd; True:C214)
		OBJECT SET VISIBLE:C603(ORD_at_OrdersTab; False:C215)
		
		$_t_DragString:="OrdItems"
		LBI_SetDRGPair(2; ->ORD_r_SubSelection; $_t_DragString)
		
	End if 
End if 
ERR_MethodTrackerReturn("Orders_InLPß"; $_t_oldMethodName)
