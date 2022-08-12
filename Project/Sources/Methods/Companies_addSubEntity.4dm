//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Companies_addSubEntity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_DiaryFieldNumbers; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(COM_Al_FormIDs;0)
	//ARRAY LONGINT(COM_al_TabIncludes;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ActionTabIncludes; 0)
	ARRAY TEXT:C222($_at_DiaryFieldValus; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_editMode;0)
	//ARRAY TEXT(COM_at_TabNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_OK; $_bo_UseAll; Co_bo_addingSubentity; COM_bo_AddingFurther; CON_bo_AddFurthers; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_ArraySize; $_l_Column; $_l_CurrentProcess; $_l_DiaryType; $_l_EnterPostion; $_l_FormRow; $_l_Index; $_l_Row; $_l_VirtualDataColumn; $_l_VirtualFieldRow)
	C_LONGINT:C283($_l_CurrentWinRefOLD; DOC_l_FIeldLink; DOC_l_RecordID; DOC_l_TableLink; WIN_l_CurrentWinRef)
	C_PICTURE:C286(COM_Pi_EditMode)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_EnterabilityArray; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_DummyTab; $_t_EntryFormName; $_t_oldMethodName; CO_t_RelatedContact; COM_t_FalseTab; DB_t_WindowTitle; DOC_t_RecordCode; GEN_t_CancelText; GEN_t_OKText)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Companies_addSubEntity")

//NG Feb 2004
//This method is to replace the code on the Companies_In screen
//it simply takes the code from the button xreport on each page where it appears and encompases the code

Case of 
	: (FORM Get current page:C276=1)
		//Script from x report on Page_1
		$_t_DummyTab:=COM_t_FalseTab  //Use has selected something from the add diary on the left....
		COM_t_FalseTab:=""
		Case of 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1])) & ($_t_DummyTab="")  //Contacts
				DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				CREATE RECORD:C68([CONTACTS:1])
				Co_bo_addingSubentity:=True:C214
				Contacts_SubLPB
				If (OK=1)
					$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
					$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
					LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
					$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup; ->COM_at_editMode; $_l_Row; $_l_Column; ->COM_Pi_EditMode)
				End if 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
				If (True:C214)  //& (Not(Is compiled mode))
					//get the settings for the current tab
					SD2_loadFormNames
					ARRAY LONGINT:C221($_al_TabIncludes; 0)
					If ($_t_DummyTab="")
						$_l_VirtualFieldRow:=Find in array:C230(COM_at_TabNames; CO_at_ViewTabsLabels{CO_at_ViewTabsLabels})
					Else 
						$_l_EnterPostion:=Position:C15("Enter "; $_t_DummyTab)
						If ($_l_EnterPostion>0)
							$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_EnterPostion+Length:C16("Enter "); Length:C16($_t_DummyTab))
							
							$_l_VirtualFieldRow:=Find in array:C230(COM_at_TabNames; $_t_DummyTab)
						End if 
					End if 
					If ($_l_VirtualFieldRow>0)
						If (COM_Al_FormIDs{$_l_VirtualFieldRow}>0)
							$_l_FormRow:=Find in array:C230(SD_al_FormReferenceID; COM_Al_FormIDs{$_l_VirtualFieldRow})
							If ($_l_FormRow>0)
								$_t_EntryFormName:=SD2_at_FormNames{$_l_FormRow}
							Else 
								$_t_EntryFormName:=""
							End if 
						Else 
							$_t_EntryFormName:=""
						End if 
						COPY ARRAY:C226(COM_al_TabIncludes{$_l_VirtualFieldRow}; $_al_TabIncludes)
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
							$_l_VirtualFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
							If ($_l_VirtualFieldRow>0)
								If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldRow})>0)
									$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
								Else 
									$_bo_OK:=True:C214
								End if 
							Else 
								$_bo_OK:=True:C214  //nothing is setup so it must be ok
							End if 
							If ($_bo_OK)
								$_l_VirtualFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
								If ($_l_VirtualFieldRow>0)
									If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldRow})>0)
										$_l_VirtualDataColumn:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldRow}; Table:C252(->[COMPANIES:2]))
										If ($_l_VirtualDataColumn>0)
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
					SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionTabIncludes)
					If (CO_t_RelatedContact#"")
						ARRAY TEXT:C222($_at_Relations; 2)
						ARRAY LONGINT:C221($_al_RelationTables; 2)
						ARRAY LONGINT:C221($_al_RelationFields; 2)
						$_at_Relations{1}:=[COMPANIES:2]Company_Code:1
						$_al_RelationTables{1}:=Table:C252(->[COMPANIES:2])
						$_al_RelationFields{1}:=Field:C253(->[COMPANIES:2]Company_Code:1)
						$_at_Relations{2}:=CO_t_RelatedContact
						$_al_RelationTables{2}:=Table:C252(->[CONTACTS:1])
						$_al_RelationFields{2}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
					Else 
						ARRAY TEXT:C222($_at_Relations; 1)
						ARRAY LONGINT:C221($_al_RelationTables; 1)
						ARRAY LONGINT:C221($_al_RelationFields; 1)
						$_at_Relations{1}:=[COMPANIES:2]Company_Code:1
						$_al_RelationTables{1}:=Table:C252(->[COMPANIES:2])
						$_al_RelationFields{1}:=Field:C253(->[COMPANIES:2]Company_Code:1)
					End if 
					//if you want to send  other values to the diary entry such as start time then do so in the following way
					ARRAY LONGINT:C221($_al_DiaryFieldNumbers; 0)  //an array of the DIARY FIELD NUMBERS to set
					
					ARRAY TEXT:C222($_at_DiaryFieldValus; 0)  // a TEXT array of the values to put in=so coerse the date you want into alpha(its text so you can pass descriptions
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
					
					//$_al_DiaryFieldNumbers{1}:=»[diary]date do from
					//$_at_DiaryFieldValus{1}:=String(Current Date(*))
					
					$_l_CurrentProcess:=Current process:C322
					$_l_DiaryType:=2
					SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; $_t_EntryFormName; ->$_at_ActionTabIncludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
					
				Else 
					
					ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [COMPANIES:2]Company_Code:1; CO_t_RelatedContact; "Diary_InNEW")
				End if 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")
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
					If (CO_t_RelatedContact="")
						
					End if 
					
					Case of 
						: (GEN_at_DropDownMenu=1)
							//letter
							DB_MenuNewRecord("DiaryLetter"; ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
							
							//ZProc ("Diary_InL";◊K5*2;"Enter Letters";String(Current process);[COMPANIES]Company Code;CO_t_RelatedContact)
							
						: (GEN_at_DropDownMenu=2)
							DB_MenuNewRecord("DiaryEmail"; ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
							//note the different order of vars below..needs a test
							//ZProc ("Diary_InEmail";◊K4;"Enter eMail";[COMPANIES]Company Code;CO_t_RelatedContact;"";String(Current process))
							//we could have SMS as well here!
						: (GEN_at_DropDownMenu=3)  //attach external document
							If ([COMPANIES:2]x_ID:63=0)
								[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
							End if 
							
							DOC_l_TableLink:=Table:C252(->[COMPANIES:2])
							DOC_l_FIeldLink:=Field:C253(->[COMPANIES:2]Company_Code:1)
							DOC_t_RecordCode:=[COMPANIES:2]Company_Code:1
							DOC_l_RecordID:=[COMPANIES:2]x_ID:63
							DOC_AddExternalDocument(->DOC_l_TableLink; ->DOC_l_FIeldLink; ->DOC_t_RecordCode; ->DOC_l_RecordID)
							QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
							QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15#""; *)
							QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
							Companies_InLPß("P1")
					End case 
				End if 
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[ORDERS:24])) & ($_t_DummyTab="")
				If (Not:C34(<>StatesLoaded))
					States_Load
				End if 
				Case of 
					: (CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}="Enquiries")
						// enter enquiries
						If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
							DB_MenuNewRecord("OrdersEnquiries"; ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
							
							
						Else 
							DB_MenuNewRecord("OrdersEnquiries"; ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
							
							
						End if 
						
					: (CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}="Orders")
						DB_MenuNewRecord((Table name:C256(Table:C252(->[ORDERS:24]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
						
				End case 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57])) & ($_t_DummyTab="")
				DB_MenuNewRecord((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
				
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[INVOICES:39])) & ($_t_DummyTab="")
				DB_MenuNewRecord((Table name:C256(Table:C252(->[INVOICES:39]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
				
				//ZProc ("Invoice_In";◊K3;"Enter Adhoc Invoices";String(Current process);[COMPANIES]Company Code;CO_t_RelatedContact)
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37])) & ($_t_DummyTab="")
				//no contact codes on purchases
				DB_MenuNewRecord((Table name:C256(Table:C252(->[PURCHASE_INVOICES:37]))); ->[COMPANIES:2]Company_Code:1)
				
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTRACTS:17])) & ($_t_DummyTab="")
				//this does not put company in by default
				DB_MenuNewRecord((Table name:C256(Table:C252(->[CONTRACTS:17]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
				
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[SERVICE_CALLS:20])) & ($_t_DummyTab="")
				
				DB_MenuNewRecord((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
				
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9])) & ($_t_DummyTab="")
				//need some special handling added here to add the supplier to the products
				DB_MenuNewRecord((Table name:C256(Table:C252(->[PRODUCTS:9]))); ->[COMPANIES:2]Company_Code:1; ->CO_t_RelatedContact)
				
		End case 
		
		
		
		
		
	: (FORM Get current page:C276=2)
		//SAVE RECORD([COMPANIES])
		If (COM_bo_AddingFurther)
			SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
		End if 
		CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
		[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
		If ([COMPANIES_RECORD_ANALYSIS:146]ID:2=0)
			[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
		End if 
		COM_bo_AddingFurther:=True:C214
		$_ptr_ListboxSetup:=->COM_aPtr_CoFurthers
		$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup)
		$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
		$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
		If ($_l_AddedLineNumber>0)
			$_l_ArraySize:=$_l_AddedLineNumber
		End if 
		LB_GoToCell($_ptr_ListboxSetup; 1; $_l_ArraySize)
		//Page_3 is not applicable
	: (FORM Get current page:C276=4)
		//actually this page is not used
	: (FORM Get current page:C276=5)
		//Contacts
		If (CON_bo_AddFurthers)
			DB_SaveRecord(->[CONTACTS_RECORD_ANALYSIS:144])
		End if 
		CON_bo_AddFurthers:=True:C214
		CREATE RECORD:C68([CONTACTS_RECORD_ANALYSIS:144])
		[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[CONTACTS:1]Contact_Code:2
		[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
		$_ptr_ListboxSetup:=->CON_aPtr_LBAnalSetup
		$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListboxSetup)
		$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
		$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
		If ($_l_AddedLineNumber>0)
			$_l_ArraySize:=$_l_AddedLineNumber
		End if 
		LB_GoToCell($_ptr_ListboxSetup; 1; $_l_ArraySize)
		
End case 
ERR_MethodTrackerReturn("Companies_addSubEntity"; $_t_oldMethodName)