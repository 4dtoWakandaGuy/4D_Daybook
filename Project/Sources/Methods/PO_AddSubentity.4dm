//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_AddSubentity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
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
	ARRAY LONGINT:C221($_al_DiaryFieldNumber; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(PO_al_TabIncludes;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	ARRAY TEXT:C222($_at_DiaryFieldValue; 0)
	ARRAY TEXT:C222($_at_RelationCodes; 0)
	ARRAY TEXT:C222($_at_TabIncludes; 0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(PO_at_ModePO;0)
	//ARRAY TEXT(PO_at_TabNames;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305(<>SalesItemDP; $_bo_OK; $_bo_ReadOnly; $_bo_Set; $_bo_UseAll; GEN_Bo_ShowCreate; LBI_bo_RowDragged; PO_bo_AddItem)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_CharacterPosition; $_l_Column; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_FieldRow; $_l_Index; $_l_NumberofRows; $_l_Retries; $_l_Row)
	C_LONGINT:C283($_l_TableColumn; $_l_TabRow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; PO_t_FalseTab)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_AddSubentity")

$_t_DummyTab:=PO_t_FalseTab  //Use has selected something from the add diary on the left....
PO_t_FalseTab:=""

If ([PURCHASE_ORDERS:57]State:14=-1)  //unconfirmed PO...
	Case of 
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57])) & ($_t_DummyTab="")
			If (PO_bo_AddItem)
				DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
			End if 
			PO_bo_AddItem:=True:C214
			CREATE RECORD:C68([PURCHASE_ORDERS_ITEMS:169])
			[PURCHASE_ORDERS_ITEMS:169]POitemID:16:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]POitemID:16)
			[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
			
			[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
			If (([PURCHASE_ORDERS_ITEMS:169]Product_Name:2="") & ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#""))
				RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
				[PURCHASE_ORDERS_ITEMS:169]Product_Name:2:=[PRODUCTS:9]Product_Name:2
			End if 
			If ([PURCHASE_ORDERS_ITEMS:169]Quantity:3=0)
				[PURCHASE_ORDERS_ITEMS:169]Quantity:3:=1
			End if 
			If ([PURCHASE_ORDERS_ITEMS:169]Price_Per:12=0)
				[PURCHASE_ORDERS_ITEMS:169]Price_Per:12:=1
			End if 
			If ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7="")
				PurchOrd_Tax
			End if 
			[PURCHASE_ORDERS_ITEMS:169]Print_Description:14:=<>SalesItemDP
			$_ptr_ListboxSetup:=POI_aptr_LBSetup{1}
			LISTBOX GET CELL POSITION:C971($_ptr_ListboxSetup->; $_l_Column; $_l_Row)
			$_l_AddedLineNumber:=LBi_xPlus(->POI_aptr_LBSetup; ->PO_at_ModePO; $_l_Row; $_l_Column)
			//put the cursor in the correct place
			$_ptr_ArrayofArrayPointers:=POI_aptr_LBSetup{3}
			$_ptr_ArrayReferences:=POI_aptr_LBSetup{9}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
			$_ptr_EnterabilityArray:=POI_aptr_LBSetup{14}
			$_ptr_LBTable:=POI_aptr_LBSetup{10}
			$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
			If ($_l_AddedLineNumber>0)
				$_l_NumberofRows:=$_l_AddedLineNumber
			End if 
			$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
			//TRACE
			
			
			For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
				If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
					
					LB_GoToCell($_ptr_ListboxSetup; $_l_Index; $_l_NumberofRows)
					$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
					$_bo_Set:=True:C214
				End if 
			End for 
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")
			If (True:C214) & (Not:C34(Is compiled mode:C492))
				//get the settings for the current tab
				ARRAY LONGINT:C221($_al_TabIncludes; 0)
				If ($_t_DummyTab="")
					$_l_TabRow:=Find in array:C230(PO_at_TabNames; PO_at_ViewTabsLabels{PO_at_ViewTabsLabels})
				Else 
					$_l_CharacterPosition:=Position:C15("Enter "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
						
						$_l_TabRow:=Find in array:C230(PO_at_TabNames; $_t_DummyTab)
					End if 
				End if 
				
				If ($_l_TabRow>0)
					COPY ARRAY:C226(PO_al_TabIncludes{$_l_TabRow}; $_al_TabIncludes)
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
						$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
						If ($_l_FieldRow>0)
							If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})>0)
								$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
							Else 
								$_bo_OK:=True:C214
							End if 
						Else 
							$_bo_OK:=True:C214  //nothing is setup so it must be ok
						End if 
						If ($_bo_OK)
							$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
							If ($_l_FieldRow>0)
								If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})>0)
									$_l_TableColumn:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; Table:C252(->[COMPANIES:2]))
									If ($_l_TableColumn>0)
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
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_TabIncludes)
				If ([PURCHASE_ORDERS:57]Contact_Code:5#"")
					ARRAY TEXT:C222($_at_RelationCodes; 3)
					ARRAY LONGINT:C221($_al_RelationTables; 3)
					ARRAY LONGINT:C221($_al_RelationFields; 3)
					$_at_RelationCodes{1}:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
					$_al_RelationTables{1}:=Table:C252(->[PURCHASE_ORDERS:57])
					$_al_RelationFields{1}:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					$_at_RelationCodes{2}:=[PURCHASE_ORDERS:57]Company_Code:1
					$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
					$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
					$_at_RelationCodes{3}:=[PURCHASE_ORDERS:57]Contact_Code:5
					$_al_RelationTables{3}:=Table:C252(->[CONTACTS:1])
					$_al_RelationFields{3}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
				Else 
					ARRAY TEXT:C222($_at_RelationCodes; 2)
					ARRAY LONGINT:C221($_al_RelationTables; 2)
					ARRAY LONGINT:C221($_al_RelationFields; 2)
					$_at_RelationCodes{1}:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
					$_al_RelationTables{1}:=Table:C252(->[PURCHASE_ORDERS:57])
					$_al_RelationFields{1}:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					$_at_RelationCodes{2}:=[PURCHASE_INVOICES:37]Company_Code:2
					$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
					$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
					
				End if 
				//if you want to send  other values to the diary entry such as start time then do so in the following way
				ARRAY LONGINT:C221($_al_DiaryFieldNumber; 0)  //an array of the DIARY FIELD NUMBERS to set
				ARRAY TEXT:C222($_at_DiaryFieldValue; 0)  // a TEXT array of the values to put in=so coerse the date you want into alpha(its text so you can pass descriptions
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
				//$_at_DiaryFieldValue{1}:=String(Current Date(*))
				
				$_l_CurrentProcess:=Current process:C322
				$_l_DiaryType:=2
				SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; ""; ->$_at_TabIncludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_RelationCodes)
				
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [PURCHASE_ORDERS:57]Company_Code:1; [PURCHASE_ORDERS:57]Contact_Code:5; "Diary_InNEW")
			End if 
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37])) & ($_t_DummyTab="")
			Gen_Alert("Sorry you cannot use this to add a Purchase invoice")
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) & ($_t_DummyTab="")
			Gen_Alert("Sorry you cannot use this to enter a Stock Movement")
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25])) & ($_t_DummyTab="")
			Gen_Alert("Sorry you cannot use this to enter Orders or Order items")
		: (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")
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
						If ([PURCHASE_ORDERS:57]x_ID:21=0)
							[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
						End if 
						//letter
						$_l_Retries:=0
						While (Semaphore:C143("$usingArrays"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
						ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
						APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[PURCHASE_ORDERS:57]))
						APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
						APPEND TO ARRAY:C911(<>DOC_al_RecordID; [PURCHASE_ORDERS:57]x_ID:21)
						APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						
						ZProc("Diary_InL"; DB_ProcessMemoryinit(5); "Enter Letters"; String:C10(Current process:C322); [PURCHASE_ORDERS:57]Company_Code:1; [PURCHASE_ORDERS:57]Contact_Code:5; ""; "OTHERRELS")
						$_l_Retries:=0
						While (Size of array:C274(<>DOC_al_TableLink)>0)
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						CLEAR SEMAPHORE:C144("$usingArrays")
					: (GEN_at_DropDownMenu=2)
						If ([PURCHASE_ORDERS:57]x_ID:21=0)
							[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
						End if 
						$_l_Retries:=0
						While (Semaphore:C143("$usingArrays"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
						ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
						APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[PURCHASE_ORDERS:57]))
						APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
						APPEND TO ARRAY:C911(<>DOC_al_RecordID; [PURCHASE_ORDERS:57]x_ID:21)
						APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; [PURCHASE_ORDERS:57]Company_Code:1; [PURCHASE_ORDERS:57]Contact_Code:5; ""; String:C10(Current process:C322); "OTHERRELS")
						$_l_Retries:=0
						While (Size of array:C274(<>DOC_al_TableLink)>0)
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						CLEAR SEMAPHORE:C144("$usingArrays")
						//we could have SMS as well here!
					: (GEN_at_DropDownMenu=3)  //attach external document
						If ([PURCHASE_ORDERS:57]x_ID:21=0)
							[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
						End if 
						ARRAY LONGINT:C221(DOC_al_TableLink; 0)
						ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
						ARRAY LONGINT:C221(DOC_al_RecordID; 0)
						ARRAY TEXT:C222(DOC_at_RecordCode; 0)
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[PURCHASE_ORDERS:57]))
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
						APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
						APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
						APPEND TO ARRAY:C911(DOC_al_RecordID; [PURCHASE_ORDERS:57]x_ID:21)
						APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
						APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Company_Code:1)
						APPEND TO ARRAY:C911(DOC_at_RecordCode; [PURCHASE_ORDERS:57]Contact_Code:5)
						DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
						//AND RELOAD
						LBi_RemoveAll(->POI_aptr_LBSetup)
						ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
						LBI_bo_RowDragged:=False:C215
						
						PurchOrd_InLPß("P1")
						
				End case 
			End if 
			
		Else 
			Gen_Alert("Type unkown")
	End case 
Else 
	Gen_Alert("You may not modify a confirmed PO"; "Continue")
End if 
ERR_MethodTrackerReturn("PO_AddSubentity"; $_t_oldMethodName)
