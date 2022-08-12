//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_AddSubEntity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:05`Method: ORD_AddSubEntity
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(<>DOC_al_FIeldLink;0)
	//ARRAY LONGINT(<>DOC_al_RecordID;0)
	//ARRAY LONGINT(<>DOC_al_TableLink;0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(COM_Al_FormIDs;0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_TabIncludes;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_Tabincludes; 0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_at_TabNames;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_OK; $_bo_ReadOnly; $_bo_Set; $_bo_UseAll; GEN_Bo_ShowCreate; LBI_bo_RowDragged)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_AreaType; $_l_Column; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_EnterPosition; $_l_FormField; $_l_Index; $_l_NumberofRows; $_l_Row)
	C_LONGINT:C283($_l_SortFieldNumber; $_l_TableColumns; $_l_TableNumber; $_l_VirtualFieldPosition; PROD_l_SelectorPallette; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListBoxSetup)
	C_POINTER:C301($_Ptr_ThisColumnArray; $_ptr_ThisColumnFIeld)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_DummyTab; $_t_FormName; $_t_oldMethodName; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; ORD_t_FalseTab)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_AddSubEntity")

If (FORM Get current page:C276=1)
	
	
	$_t_DummyTab:=ORD_t_FalseTab  //Use has selected something from the add diary on the left....
	ORD_t_FalseTab:=""
	
	Case of 
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25])) & ($_t_DummyTab="")  //order items
			If (PROD_l_SelectorPallette>0)
				If (Process state:C330(PROD_l_SelectorPallette)<0) | (Process_Name(PROD_l_SelectorPallette)#"Product Selector")
					PROD_l_SelectorPallette:=0
				End if 
			End if 
			If (PROD_l_SelectorPallette=0)
				$_l_VirtualFieldPosition:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_VirtualFieldPosition>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_VirtualFieldPosition}
					
					If ([ORDER_ITEMS:25]Order_Code:1#"")
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End if 
					//COPY NAMED SELECTION([ORDER ITEMS];"$Temp")
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
					
					CREATE RECORD:C68([ORDER_ITEMS:25])
					OrderI_SubLPB
					DB_SaveRecord(->[ORDER_ITEMS:25])
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					UNION:C120("$Temp2"; "$Temp"; "$Temp2")
					USE SET:C118("$Temp2")
					
					
					
					$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
					$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
					$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
					$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
					$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
					$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
					//ALAreaSort
					//If (False)
					LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup)
					//GET LISTBOX CELL POSITION($_ptr_ListboxArea->;$_l_Column;$_l_Row)
					$_l_Row:=Records in selection:C76([ORDER_ITEMS:25])
					LISTBOX SELECT ROW:C912($_ptr_ListBoxSetup->; $_l_Row)
					
					//GET LISTBOX CELL POSITION($_ptr_ListboxArea->;$_l_Column;$_l_Row)
					$_l_Row:=Records in selection:C76([ORDER_ITEMS:25])
					If (Size of array:C274($_ptr_ListBoxSetup->)>=19)
						$_ptr_areaTypeVariable:=$_ptr_ListBoxSetup->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
						$_l_AreaType:=$_ptr_areaTypeVariable->
					Else 
						$_l_AreaType:=1
					End if 
					
					$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; $_l_Row; $_l_Column)
					//put the cursor in the correct place
					$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
					$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
					$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
					$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
					$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
					If ($_l_AreaType<3)
						$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
						If ($_l_AddedLineNumber>0)
							$_l_NumberofRows:=$_l_AddedLineNumber
						End if 
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_NumberofRows)
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
						End for 
					Else 
						GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_Row)
						$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
						$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
						For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
							If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
								$_ptr_ThisColumnFIeld:=$_ptr_ArrayFieldPointers->{$_l_Index}
								EDIT ITEM:C870($_ptr_ThisColumnFIeld->)
								$_bo_Set:=True:C214
								$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							End if 
							
						End for 
					End if 
					If (<>DB_bo_NewStockActive)
						STK_SOSetInfo($_ptr_ListBoxSetup)
					End if 
				End if 
				
			Else 
				While (Semaphore:C143("SelectorBusy"))
					DelayTicks(20)
				End while 
				POST OUTSIDE CALL:C329(PROD_l_SelectorPallette)
				CLEAR SEMAPHORE:C144("SelectorBusy")
			End if 
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
			If (True:C214)  //& (Not(Is compiled mode))
				//get the settings for the current tab
				SD2_loadFormNames
				ARRAY LONGINT:C221($_al_TabIncludes; 0)
				If ($_t_DummyTab="")
					$_l_VirtualFieldPosition:=Find in array:C230(ORD_at_TabNames; ORD_at_ViewTabsLabels{ORD_at_ViewTabsLabels})
				Else 
					$_l_EnterPosition:=Position:C15("Enter "; $_t_DummyTab)
					If ($_l_EnterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_EnterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
						
						$_l_VirtualFieldPosition:=Find in array:C230(ORD_at_TabNames; $_t_DummyTab)
					End if 
				End if 
				
				If ($_l_VirtualFieldPosition>0)
					If (COM_Al_FormIDs{$_l_VirtualFieldPosition}>0)
						$_l_FormField:=Find in array:C230(SD_al_FormReferenceID; COM_Al_FormIDs{$_l_VirtualFieldPosition})
						If ($_l_FormField>0)
							$_t_FormName:=SD2_at_FormNames{$_l_FormField}
						Else 
							$_t_FormName:=""
						End if 
					Else 
						$_t_FormName:=""
					End if 
					COPY ARRAY:C226(ORD_al_TabIncludes{$_l_VirtualFieldPosition}; $_al_TabIncludes)
					If (Size of array:C274($_al_TabIncludes)>0)
						QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_TabIncludes)
						$_bo_UseAll:=False:C215
					Else 
						$_bo_UseAll:=True:C214
					End if 
				Else 
					$_bo_UseAll:=True:C214
				End if 
				If ($_bo_UseAll)
					ARRAY LONGINT:C221($_al_TabIncludes; 0)
					ALL RECORDS:C47([ACTIONS:13])
					FIRST RECORD:C50([ACTIONS:13])
					ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
					ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
					CREATE EMPTY SET:C140([ACTIONS:13]; "Temp")
					For ($_l_Index; 1; Records in selection:C76([ACTIONS:13]))
						ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
						SD2_ActionAttributesToArrays
						$_bo_OK:=False:C215
						$_l_VirtualFieldPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
						If ($_l_VirtualFieldPosition>0)
							If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldPosition})>0)
								$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldPosition}; 8)<0)  //8  is for time functions-here we are ok if it NOT
							Else 
								$_bo_OK:=True:C214
							End if 
						Else 
							$_bo_OK:=True:C214  //nothing is setup so it must be ok
						End if 
						If ($_bo_OK)
							$_l_VirtualFieldPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
							If ($_l_VirtualFieldPosition>0)
								If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldPosition})>0)
									$_l_TableColumns:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldPosition}; Table:C252(->[ORDERS:24]))
									If ($_l_TableColumns>0)
										$_bo_OK:=True:C214
									End if 
								Else 
									$_bo_OK:=True:C214  //no table restrictions
								End if 
							Else 
								$_bo_OK:=True:C214  //restrictions not setup has to be ok
							End if 
						End if 
						If ($_bo_OK)
							ADD TO SET:C119([ACTIONS:13]; "Temp")
						End if 
						NEXT RECORD:C51([ACTIONS:13])
						
					End for 
					USE SET:C118("Temp")
					CLEAR SET:C117("Temp")
					//Find action codes that can be used with companies
				End if 
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_Tabincludes)
				
				
				ARRAY TEXT:C222($_at_Relations; 3)
				ARRAY LONGINT:C221($_al_RelationTables; 3)
				ARRAY LONGINT:C221($_al_RelationFields; 3)
				$_at_Relations{1}:=[ORDERS:24]Order_Code:3
				$_al_RelationTables{1}:=Table:C252(->[ORDERS:24])
				$_al_RelationFields{1}:=Field:C253(->[ORDERS:24]Order_Code:3)
				$_at_Relations{2}:=[ORDERS:24]Company_Code:1
				$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
				$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
				$_at_Relations{3}:=[ORDERS:24]Contact_Code:2
				$_al_RelationTables{3}:=Table:C252(->[CONTACTS:1])
				$_al_RelationFields{3}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
				//if you want to send  other values to the diary entry such as start time then do so in the following way
				ARRAY LONGINT:C221($_al_FieldNumbers; 0)  //an array of the DIARY FIELD NUMBERS to set
				ARRAY TEXT:C222($_at_FieldValues; 0)  // a TEXT array of the values to put in=so coerse the date you want into alpha(its text so you can pass descriptions
				//Fields that can be passed here are
				//Action Description(code is handles be passing one value in $7
				//Budget units
				//Charge Rate
				//units
				//Value
				//Date Do/Done from
				//Date Do/Done To
				//Document code
				//Person Code(if a specific person
				//priority
				//Result code
				//Result descrtiption
				//SourceDataField(TABLE NUMBER)
				//Subject
				//Thread ID
				//Time do/done from
				//Time do/done to
				//xIstrhead
				
				//$FieldNumber{1}:=»[diary]date do from
				//$_at_FieldValues{1}:=String(Current Date(*))
				
				$_l_CurrentProcess:=Current process:C322
				$_l_DiaryType:=2
				SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; $_t_FormName; ->$_at_Tabincludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
				
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; "Diary_InNEW")
			End if 
			
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Document
			ARRAY TEXT:C222(GEN_at_DropDownMenu; 3)
			ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 3)
			
			GEN_at_DropDownMenu{1}:="Letter"
			GEN_al_DropDownMenuID{1}:=1
			GEN_at_DropDownMenu{2}:="Email"
			GEN_al_DropDownMenuID{2}:=2
			GEN_at_DropDownMenu{3}:="Attach External Document(s)"
			GEN_al_DropDownMenuID{3}:=3
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
			
			GEN_Bo_ShowCreate:=False:C215
			DB_t_WindowTitle:="Select Document Type.."
			GEN_t_OKText:="Continue"  //New Values NG March 2004
			GEN_t_CancelText:="Stop"  //New Values NG March 2004
			DIALOG:C40([USER:15]; "Gen_PopUpChoice")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (GEN_at_DropDownMenu>0)
				
				
				Case of 
					: (GEN_at_DropDownMenu=1)
						//letter
						If ([ORDERS:24]x_ID:58=0)
							[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
						End if 
						While (Semaphore:C143("$usingArrays"))
							DelayTicks(2)
						End while 
						ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
						ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
						APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDERS:24]))
						APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
						APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDERS:24]x_ID:58)
						APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [ORDERS:24]Order_Code:3)
						
						ZProc("Diary_InL"; DB_ProcessMemoryinit(5); "Enter Letters"; String:C10(Current process:C322); [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; ""; "OTHERRELS")
						While (Size of array:C274(<>DOC_al_TableLink)>0)
							DelayTicks(2)
						End while 
						CLEAR SEMAPHORE:C144("$usingArrays")
					: (GEN_at_DropDownMenu=2)
						While (Semaphore:C143("$usingArrays"))
							DelayTicks(2)
						End while 
						//NG this appreared to be a re-purposing of $3 as sometwhere else it seems to be used to indicate an attachment
						ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
						ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
						APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDERS:24]))
						APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
						APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDERS:24]x_ID:58)
						APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [ORDERS:24]Order_Code:3)
						ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; ""; String:C10(Current process:C322); "OTHERRELS")
						While (Size of array:C274(<>DOC_al_TableLink)>0)
							DelayTicks(2)
						End while 
						CLEAR SEMAPHORE:C144("$usingArrays")
						
						//we could have SMS as well here!
					: (GEN_at_DropDownMenu=3)
						If ([ORDERS:24]x_ID:58=0)
							[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
						End if 
						ARRAY LONGINT:C221(DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(DOC_al_RecordID; 0)
						ARRAY TEXT:C222(DOC_at_RecordCode; 0)
						
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[ORDERS:24]))
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
						
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
						
						
						APPEND TO ARRAY:C911(DOC_al_RecordID; [ORDERS:24]x_ID:58)
						APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
						APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
						
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Order_Code:3)
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Company_Code:1)
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Contact_Code:2)
						
						
						DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
						//LBi_RemoveAll (->ORD_aPtr_OrderItemsSetup)
						
						LBI_bo_RowDragged:=False:C215
						
						//Orders_InLPß ("P1") `actually all we need to do now is update the seleciton
				End case 
			End if 
			
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //Invoices
			Gen_Alert("Sorry, you may not add invoices from an Order in this way you must use the invoic"+"e function!")
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //Purchase orders
			Gen_Alert("Sorry, you may not add Purchase orders  from an Order in this way you must use th"+"e invoic"+"e function!")
		: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))  //STOCK ITEMS
			Gen_Alert("Sorry, you may not add Stock Movements  from an Order in this way you must use th"+"allocation function!")
	End case 
End if 
ERR_MethodTrackerReturn("ORD_AddSubEntity"; $_t_oldMethodName)
