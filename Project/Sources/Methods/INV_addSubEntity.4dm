//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_addSubEntity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2010 10:04
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
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(INV_al_TabIncludes;0)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_TabIncludes; 0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(INV_at_EditMode;0)
	//ARRAY TEXT(INV_at_TabNames;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_ReadOnly; $_bo_Set; $_bo_UseAll; GEN_Bo_ShowCreate; INV_bo_Addingitem; LBI_bo_RowDragged)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_CharacterPosition; $_l_Column; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_Index; $_l_Row; $_l_SizeofArray; $_l_TablePosition; $_l_VirtualFieldPosition)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray)
	C_REAL:C285($1)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; INV_t_FalseTab; INV_t_RelatedContact)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_addSubEntity")


If (Count parameters:C259>=1)
	If ($1=1)
		$_t_DummyTab:=INV_t_FalseTab  //Use has selected something from the add diary on the left....
		INV_t_FalseTab:=""
		Case of 
			: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39])) & ($_t_DummyTab="")  //INVOICE ITEMS
				If ([INVOICES:39]State:10<1)
					If (INV_bo_Addingitem)
						DB_SaveRecord(->[INVOICES_ITEMS:161])
					End if 
					INV_bo_Addingitem:=True:C214
					
					CREATE RECORD:C68([INVOICES_ITEMS:161])
					[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
					
					If ([INVOICES:39]Invoice_Number:1="")
						Inv_No
					End if 
					[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
					[INVOICES_ITEMS:161]Company_Code:20:=[INVOICES:39]Company_Code:2
					InvItems_SubB
					$_ptr_ListboxSetup:=->INV_aptr_ListboxSetup
					$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
					LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
					$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->INV_at_EditMode; $_l_Row; $_l_Column)
					
					$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
					$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
					$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
					$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
					$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
					If ($_l_AddedLineNumber>0)
						$_l_SizeofArray:=$_l_AddedLineNumber
					End if 
					$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
					For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
						If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
							LB_GoToCell($_ptr_ListboxArea; $_l_Index; $_l_SizeofArray)
							$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
							$_bo_Set:=True:C214
						End if 
						
					End for 
					
				End if 
			: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25])) & ($_t_DummyTab="")  //ORDER items
				Gen_Alert("Sorry. You may not add Orders_In this way")
			: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
				If (True:C214) & (Not:C34(Is compiled mode:C492))
					//get the settings for the current tab
					ARRAY LONGINT:C221($_al_TabIncludes; 0)
					If ($_t_DummyTab="")
						$_l_VirtualFieldPosition:=Find in array:C230(INV_at_TabNames; INV_at_ViewTabsLabels{INV_at_ViewTabsLabels})
					Else 
						$_l_CharacterPosition:=Position:C15("Enter "; $_t_DummyTab)
						If ($_l_CharacterPosition>0)
							$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
							
							$_l_VirtualFieldPosition:=Find in array:C230(INV_at_TabNames; $_t_DummyTab)
						End if 
					End if 
					If ($_l_VirtualFieldPosition>0)
						COPY ARRAY:C226(INV_al_TabIncludes{$_l_VirtualFieldPosition}; $_al_TabIncludes)
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
										$_l_TablePosition:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldPosition}; Table:C252(->[INVOICES:39]))
										If ($_l_TablePosition>0)
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
					If ([INVOICES:39]Contact_Code:3#"")
						ARRAY TEXT:C222($_at_Relations; 3)
						ARRAY LONGINT:C221($_al_RelationTables; 3)
						ARRAY LONGINT:C221($_al_RelationFields; 3)
						$_at_Relations{1}:=[INVOICES:39]Invoice_Number:1
						$_al_RelationTables{1}:=Table:C252(->[INVOICES:39])
						$_al_RelationFields{1}:=Field:C253(->[INVOICES:39]Invoice_Number:1)
						$_at_Relations{2}:=[INVOICES:39]Company_Code:2
						$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
						$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
						$_at_Relations{3}:=[INVOICES:39]Contact_Code:3
						$_al_RelationTables{3}:=Table:C252(->[CONTACTS:1])
						$_al_RelationFields{3}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
					Else 
						ARRAY TEXT:C222($_at_Relations; 2)
						ARRAY LONGINT:C221($_al_RelationTables; 2)
						ARRAY LONGINT:C221($_al_RelationFields; 2)
						$_at_Relations{1}:=[INVOICES:39]Invoice_Number:1
						$_al_RelationTables{1}:=Table:C252(->[INVOICES:39])
						$_al_RelationFields{1}:=Field:C253(->[INVOICES:39]Invoice_Number:1)
						$_at_Relations{2}:=[INVOICES:39]Company_Code:2
						$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
						$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
						
					End if 
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
					
					//$_al_FieldNumbers{1}:=»[diary]date do from
					//$_at_FieldValues{1}:=String(Current Date(*))
					
					$_l_CurrentProcess:=Current process:C322
					$_l_DiaryType:=2
					SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; ""; ->$_at_TabIncludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
					
				Else 
					ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; "Diary_InNEW")
				End if 
			: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")
				//actually this is diary items but using `
				//a different table up there makes it easier
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
					If (INV_t_RelatedContact="")
						
					End if 
					
					Case of 
						: (GEN_at_DropDownMenu=1)
							//letter
							While (Semaphore:C143("$usingArrays"))
								DelayTicks(2)
							End while 
							ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
							ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
							ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
							ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
							APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[INVOICES:39]))
							APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[INVOICES:39]Invoice_Number:1))
							APPEND TO ARRAY:C911(<>DOC_al_RecordID; [INVOICES:39]X_ID:49)
							APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [INVOICES:39]Invoice_Number:1)
							ZProc("Diary_InL"; DB_ProcessMemoryinit(6); "Enter Letters"; String:C10(Current process:C322); [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; ""; "OTHERRELS")
							While (Size of array:C274(<>DOC_al_TableLink)>0)
								DelayTicks(2)
							End while 
							CLEAR SEMAPHORE:C144("$usingArrays")
							
						: (GEN_at_DropDownMenu=2)
							While (Semaphore:C143("$usingArrays"))
								DelayTicks(2)
							End while 
							ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
							ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
							ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
							ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
							APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[INVOICES:39]))
							APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[INVOICES:39]Invoice_Number:1))
							APPEND TO ARRAY:C911(<>DOC_al_RecordID; [INVOICES:39]X_ID:49)
							APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [INVOICES:39]Invoice_Number:1)
							ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; ""; String:C10(Current process:C322); "OTHERRELS")
							While (Size of array:C274(<>DOC_al_TableLink)>0)
								DelayTicks(2)
							End while 
							CLEAR SEMAPHORE:C144("$usingArrays")
							
							//we could have SMS as well here!
						: (GEN_at_DropDownMenu=3)  //attach external document
							
							If ([INVOICES:39]X_ID:49=0)
								[INVOICES:39]X_ID:49:=AA_GetNextID(->[INVOICES:39]X_ID:49)
							End if 
							ARRAY LONGINT:C221(DOC_al_TableLink; 0)
							ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
							ARRAY LONGINT:C221(DOC_al_RecordID; 0)
							ARRAY TEXT:C222(DOC_at_RecordCode; 0)
							APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[INVOICES:39]))
							APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[INVOICES:39]Invoice_Number:1))
							APPEND TO ARRAY:C911(DOC_al_RecordID; [INVOICES:39]X_ID:49)
							APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Invoice_Number:1)
							
							APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
							APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
							APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
							APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Company_Code:2)
							
							APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
							APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
							APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
							APPEND TO ARRAY:C911(DOC_at_RecordCode; [INVOICES:39]Contact_Code:3)
							
							DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
							LBi_RemoveAll(->INV_aptr_ListboxSetup)
							ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
							LBI_bo_RowDragged:=False:C215
							Invoices_InLPß("P")
							
					End case 
				End if 
				
				
				
		End case 
		
	Else 
		//receipt entry
		
	End if 
End if 
ERR_MethodTrackerReturn("INV_addSubEntity"; $_t_oldMethodName)