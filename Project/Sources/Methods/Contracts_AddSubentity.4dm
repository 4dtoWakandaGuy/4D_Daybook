//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_AddSubentity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(<>DOC_al_FIeldLink;0)
	//ARRAY LONGINT(<>DOC_al_RecordID;0)
	//ARRAY LONGINT(<>DOC_al_TableLink;0)
	ARRAY LONGINT:C221($_al_DiaryRecordIDS; 0)
	ARRAY LONGINT:C221($_al_FIeldNumber; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(CONT_al_TabIncludes;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_TabIncludes; 0)
	//ARRAY TEXT(CON_at_EditMode;0)
	//ARRAY TEXT(CONT_at_TabNames;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_ReadOnly; $_bo_UseAll; GEN_Bo_ShowCreate)
	C_DATE:C307(vPDateF)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_ArraySize; $_l_AssignItemsProcess; $_l_Column; $_l_Columns; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_EnterPosition; $_l_FIeldNumber; $_l_FieldOneColumn)
	C_LONGINT:C283($_l_index; $_l_Retries; $_l_Row; $_l_Rows; $_l_TabNumber; $_l_VirtualFieldOffset; $_l_VirtualFieldPosition; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_Field; $_Ptr_FirstColumnArray; $_ptr_LBParentTable; $_ptr_LBTable)
	C_POINTER:C301($_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_TotalsColumnFIeld)
	C_REAL:C285($_r_Total; $1)
	C_TEXT:C284($_t_DragString; $_t_DummyTab; $_t_oldMethodName; CONT_t_FalseTab; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; vStage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_AddSubentity")

If (Count parameters:C259>=1)
	$_ptr_ListboxSetup:=->SVS_lb_ItemsSetup
	Case of 
		: ($1=1)
			If ([CONTRACTS:17]Contract_Code:3#"")
				If ([CONTRACTS:17]Company_Code:1#"")
					$_t_DummyTab:=CONT_t_FalseTab  //Use has selected something from the add diary on the left....
					CONT_t_FalseTab:=""
					
					If ([CONTRACTS:17]End_Date:6>Current date:C33(*)) | ([CONTRACTS:17]xOpenEndedStatus:16=1)
						Case of 
							: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25])) & ($_t_DummyTab="")  //Contract items
								
								If ([ORDER_ITEMS:25]Contract_Code:29#"")
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								End if 
								Gen_Confirm("Associate Items from an existing order or create new ones?"; "Existing"; "New")
								If (OK=1)
									$_t_DragString:="OrdItems"
									//AL_SetDrgDst (SC_PowerviewCHAR;1;$_t_DragString) `NG TODO
									LBI_SetDRGPair(1; ->SVS_lb_ItemsSetup; $_t_DragString)
									$_l_AssignItemsProcess:=New process:C317("Orders_Mod"; DB_ProcessMemoryinit(4); "Assign Order items"+String:C10(Current process:C322); String:C10(Current process:C322); ""; ""; ""; ""; "-1"; *)
									SHOW PROCESS:C325($_l_AssignItemsProcess)
									BRING TO FRONT:C326($_l_AssignItemsProcess)
								Else 
									//add a line
									If ([ORDER_ITEMS:25]Order_Code:1#"")
										DB_SaveRecord(->[ORDER_ITEMS:25])
										AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									End if 
									CREATE RECORD:C68([ORDER_ITEMS:25])
									OrderI_SubLPB
									[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
									[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
									[ORDER_ITEMS:25]Quantity:3:=1
									RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
									[ORDER_ITEMS:25]Tax_Code:12:=Gen_LPTax
									[ORDER_ITEMS:25]Delivery_Date:11:=vPDateF  //From the contract
									[ORDER_ITEMS:25]Job_Stage:35:=vStage
									[ORDER_ITEMS:25]Delivery_Date:11:=Current date:C33(*)
									
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
									$_l_AddedLineNumber:=LBi_xPlus(->$_ptr_ListboxSetup; ->CON_at_EditMode; $_l_Row; $_l_Column)
									//`````
									$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
									$_ptr_Field:=->[ORDER_ITEMS:25]Contract_Cost:30
									$_l_FieldOneColumn:=0
									//Find those fields in the arrays
									$_l_Columns:=Size of array:C274($_ptr_ArrayFieldPointers->)
									For ($_l_Index; 1; $_l_Columns)
										$_l_FIeldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})
										If ($_l_FieldOneColumn=0)
											If ($_l_FIeldNumber=Field:C253($_ptr_Field))
												$_l_FieldOneColumn:=$_l_Index
											End if 
										End if 
										If ($_l_FieldOneColumn>0)
											$_l_Index:=$_l_Columns
										End if 
										
									End for 
									If ($_l_FieldOneColumn>0)
										//Now extract the 'SUM' from those fields
										$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
										If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
											$_Ptr_FirstColumnArray:=$_ptr_ArrayofArrayPointers->{1}
											$_l_Rows:=Size of array:C274($_Ptr_FirstColumnArray->)
											$_r_Total:=0
											
											$_Ptr_TotalsColumnFIeld:=$_ptr_ArrayofArrayPointers->{$_l_FieldOneColumn}
											
											For ($_l_Row; 1; $_l_Rows)
												$_r_Total:=$_r_Total+($_Ptr_TotalsColumnFIeld->{$_l_Row})
												
											End for 
											[CONTRACTS:17]Contract_Cost:7:=$_r_Total
											
										End if 
									End if 
									
									//``````
									
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
									$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
									$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
									$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
									$_ptr_LBParentTable:=$_ptr_ListboxSetup->{10}
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
									$_l_ArraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									For ($_l_index; 1; Size of array:C274($_ptr_EnterabilityArray->))
										If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_index}))
											LB_GoToCell($_ptr_ListboxArea; $_l_index; $_l_ArraySize)
											$_l_index:=Size of array:C274($_ptr_EnterabilityArray->)
										End if 
									End for 
									
									
									
								End if 
							: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDERS:24])) & ($_t_DummyTab="")  //Contacts    Gen
								Gen_Alert("Sorry you cannot create an order in this way")
							: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
								If (True:C214) & (Not:C34(Is compiled mode:C492))
									//get the settings for the current tab
									ARRAY LONGINT:C221($_al_TabIncludes; 0)
									If ($_t_DummyTab="")
										$_l_TabNumber:=Find in array:C230(CONT_at_TabNames; CONT_at_ViewTabsLabels{CONT_at_ViewTabsLabels})
									Else 
										$_l_EnterPosition:=Position:C15("Enter "; $_t_DummyTab)
										If ($_l_EnterPosition>0)
											$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_EnterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
											
											$_l_TabNumber:=Find in array:C230(CONT_at_TabNames; $_t_DummyTab)
										End if 
									End if 
									If ($_l_TabNumber>0)
										COPY ARRAY:C226(CONT_al_TabIncludes{$_l_TabNumber}; $_al_TabIncludes)
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
										For ($_l_index; 1; Records in selection:C76([ACTIONS:13]))
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
												$_l_TabNumber:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
												If ($_l_TabNumber>0)
													If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_TabNumber})>0)
														$_l_VirtualFieldOffset:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_TabNumber}; Table:C252(->[CONTRACTS:17]))
														If ($_l_VirtualFieldOffset>0)
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
									If ([CONTRACTS:17]Contact_Code:2#"")
										ARRAY TEXT:C222($_at_Relations; 3)
										ARRAY LONGINT:C221($_al_RelationTables; 3)
										ARRAY LONGINT:C221($_al_RelationFields; 3)
										$_at_Relations{1}:=[CONTRACTS:17]Contract_Code:3
										$_al_RelationTables{1}:=Table:C252(->[CONTRACTS:17])
										$_al_RelationFields{1}:=Field:C253(->[CONTRACTS:17]Contract_Code:3)
										$_at_Relations{2}:=[CONTRACTS:17]Company_Code:1
										$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
										$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
										$_at_Relations{3}:=[CONTRACTS:17]Contact_Code:2
										$_al_RelationTables{3}:=Table:C252(->[CONTACTS:1])
										$_al_RelationFields{3}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
										
									Else 
										ARRAY TEXT:C222($_at_Relations; 2)
										ARRAY LONGINT:C221($_al_RelationTables; 2)
										ARRAY LONGINT:C221($_al_RelationFields; 2)
										$_at_Relations{1}:=[CONTRACTS:17]Contract_Code:3
										$_al_RelationTables{1}:=Table:C252(->[CONTRACTS:17])
										$_al_RelationFields{1}:=Field:C253(->[CONTRACTS:17]Contract_Code:3)
										$_at_Relations{2}:=[CONTRACTS:17]Company_Code:1
										$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2])
										$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
									End if 
									//if you want to send  other values to the diary entry such as start time then do so in the following way
									ARRAY LONGINT:C221($_al_FIeldNumber; 0)  //an array of the DIARY FIELD NUMBERS to set
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
									//$_l_FIeldNumber{1}:=»[diary]date do from
									//$_at_FieldValues{1}:=String(Current Date(*))
									
									$_l_CurrentProcess:=Current process:C322
									$_l_DiaryType:=2
									SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; ""; ->$_at_TabIncludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
									
								Else 
									ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [CONTRACTS:17]Company_Code:1; [CONTRACTS:17]Contract_Code:3; "Diary_InNEW")
								End if 
							: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")
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
									
									
									Case of 
										: (GEN_at_DropDownMenu=1)
											//letter
											$_l_Retries:=0
											While (Semaphore:C143("$usingArrays"))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*(1+$_l_Retries))
											End while 
											ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
											ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
											ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
											ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
											APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[CONTRACTS:17]))
											APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[CONTRACTS:17]Contract_Code:3))
											APPEND TO ARRAY:C911(<>DOC_al_RecordID; [CONTRACTS:17]x_ID:12)
											APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [CONTRACTS:17]Contract_Code:3)
											ZProc("Diary_InL"; DB_ProcessMemoryinit(6); "Enter Letters"; String:C10(Current process:C322); [CONTRACTS:17]Company_Code:1; [CONTRACTS:17]Contact_Code:2; ""; "OTHERRELS")
											$_l_Retries:=0
											While (Size of array:C274(<>DOC_al_TableLink)>0)
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*(1+$_l_Retries))
											End while 
											CLEAR SEMAPHORE:C144("$usingArrays")
											
											
										: (GEN_at_DropDownMenu=2)
											$_l_Retries:=0
											While (Semaphore:C143("$usingArrays"))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*(1+$_l_Retries))
											End while 
											ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
											ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
											ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
											ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
											APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[CONTRACTS:17]))
											APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[CONTRACTS:17]Contract_Code:3))
											APPEND TO ARRAY:C911(<>DOC_al_RecordID; [CONTRACTS:17]x_ID:12)
											APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [CONTRACTS:17]Contract_Code:3)
											
											ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; [CONTRACTS:17]Company_Code:1; [CONTRACTS:17]Contact_Code:2; ""; String:C10(Current process:C322); "OTHERRELS")
											//we could have SMS as well here!
											$_l_Retries:=0
											While (Size of array:C274(<>DOC_al_TableLink)>0)
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*(1+$_l_Retries))
											End while 
											CLEAR SEMAPHORE:C144("$usingArrays")
										: (GEN_at_DropDownMenu=3)  //attach external document
											If ([CONTRACTS:17]x_ID:12=0)
												[CONTRACTS:17]x_ID:12:=AA_GetNextID(->[CONTRACTS:17]x_ID:12)
											End if 
											ARRAY LONGINT:C221(DOC_al_TableLink; 0)
											ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
											ARRAY LONGINT:C221(DOC_al_RecordID; 0)
											ARRAY TEXT:C222(DOC_at_RecordCode; 0)
											APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTRACTS:17]))
											APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
											APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
											APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTRACTS:17]Contract_Code:3))
											APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
											APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
											APPEND TO ARRAY:C911(DOC_al_RecordID; [CONTRACTS:17]x_ID:12)
											APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
											APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
											APPEND TO ARRAY:C911(DOC_at_RecordCode; [CONTRACTS:17]Contract_Code:3)
											APPEND TO ARRAY:C911(DOC_at_RecordCode; [CONTRACTS:17]Company_Code:1)
											APPEND TO ARRAY:C911(DOC_at_RecordCode; [CONTRACTS:17]Contact_Code:2)
											
											
											
											DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
											ARRAY LONGINT:C221($_al_DiaryRecordIDS; 0)
											QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[CONTRACTS:17]); *)
											QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[CONTRACTS:17]Contract_Code:3)
											SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryRecordIDS)
											QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryRecordIDS)
											QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#""; *)
											QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
											Contracts_inLPß
									End case 
								End if 
								
								
								
						End case 
					Else 
						Gen_Alert("This contract is now closed, items cannot be added")
					End if 
					
				Else 
					Gen_Alert("Items cannot be added to a contract till a company is entered!")
				End if 
			Else 
				Gen_Alert("You must enter a contract code first")
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Contracts_AddSubentity"; $_t_oldMethodName)