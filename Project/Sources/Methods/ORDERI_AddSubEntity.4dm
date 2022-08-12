//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDERI_AddSubEntity
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
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(OI_al_AttachmentTypes;0)
	//ARRAY LONGINT(ORDI_al_TabIncludes;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(<>DOC_at_RecordCode;0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_Tabincludes; 0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(OI_at_AttachmentTypes;0)
	//ARRAY TEXT(ORDI_at_TabNames;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_UseAll; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_FieldRow; $_l_LocationsFieldRow; $_l_RecordsIndex; $_l_TableColumn; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_DummyTab; $_t_oldMethodName; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText; ORDI_t_FalseTab)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDERI_AddSubEntity")

If (Count parameters:C259>=1)
	Case of 
		: ($1=2)
			//Stock items???
		: ($1=3)  //Page_3i
			
			If ([ORDER_ITEMS:25]Invoice_Number:17="")
				$_t_DummyTab:=ORDI_t_FalseTab  //Use has selected something from the add diary on the left....
				ORDI_t_FalseTab:=""
				
				Case of 
						
					: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
						If (True:C214) & (Not:C34(Is compiled mode:C492))
							ARRAY LONGINT:C221($_al_TabIncludes; 0)
							If ($_t_DummyTab="")
								$_l_FieldRow:=Find in array:C230(ORDI_at_TabNames; ORDI_at_ViewTabsLabels{ORDI_at_ViewTabsLabels})
							Else 
								$_l_CharacterPosition:=Position:C15("Enter "; $_t_DummyTab)
								If ($_l_CharacterPosition>0)
									$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
									
									$_l_FieldRow:=Find in array:C230(ORDI_at_TabNames; $_t_DummyTab)
								End if 
							End if 
							
							
							
							If ($_l_FieldRow>0)
								COPY ARRAY:C226(ORDI_al_TabIncludes{$_l_FieldRow}; $_al_TabIncludes)
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
								For ($_l_RecordsIndex; 1; Records in selection:C76([ACTIONS:13]))
									ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
									SD2_ActionAttributesToArrays
									$_bo_OK:=False:C215
									$_l_LocationsFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
									If ($_l_LocationsFieldRow>0)
										If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsFieldRow})>0)
											$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsFieldRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
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
												$_l_TableColumn:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; Table:C252(->[ORDERS:24]))
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
							SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_Tabincludes)
							
							
							ARRAY TEXT:C222($_at_Relations; 2)
							ARRAY LONGINT:C221($_al_RelationTables; 2)
							ARRAY LONGINT:C221($_al_RelationFields; 2)
							$_at_Relations{1}:=String:C10([ORDER_ITEMS:25]Item_Number:27)
							$_al_RelationTables{1}:=Table:C252(->[ORDER_ITEMS:25])
							$_al_RelationFields{1}:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
							$_at_Relations{2}:=String:C10([ORDER_ITEMS:25]Item_Number:27)
							$_al_RelationTables{2}:=Table:C252(->[ORDERS:24])
							$_al_RelationFields{2}:=Field:C253(->[ORDERS:24]Order_Code:3)
							If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
								QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							End if 
							If ([ORDERS:24]Company_Code:1#"")
								APPEND TO ARRAY:C911($_at_Relations; [ORDERS:24]Company_Code:1)
								APPEND TO ARRAY:C911($_al_RelationTables; Table:C252(->[COMPANIES:2]))
								APPEND TO ARRAY:C911($_al_RelationFields; Field:C253(->[COMPANIES:2]Company_Code:1))
								If ([ORDERS:24]Contact_Code:2#"")
									APPEND TO ARRAY:C911($_at_Relations; [ORDERS:24]Contact_Code:2)
									APPEND TO ARRAY:C911($_al_RelationTables; Table:C252(->[CONTACTS:1]))
									APPEND TO ARRAY:C911($_al_RelationFields; Field:C253(->[CONTACTS:1]Contact_Code:2))
								End if 
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
							
							//$FieldNumber{1}:=»[diary]date do from
							//$_at_FieldValues{1}:=String(Current Date(*))
							
							$_l_CurrentProcess:=Current process:C322
							$_l_DiaryType:=2
							SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; ""; ->$_at_Tabincludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
							
						Else 
							If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
								QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							End if 
							ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; "Diary_InNEW")
						End if 
						
					: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")  //Document
						ARRAY TEXT:C222(GEN_at_DropDownMenu; 3)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 3)
						GEN_at_DropDownMenu{1}:="Letter"
						GEN_al_DropDownMenuID{1}:=1
						GEN_at_DropDownMenu{2}:="Email"
						GEN_al_DropDownMenuID{2}:=2
						GEN_at_DropDownMenu{3}:="Attach External Document(s)"
						GEN_al_DropDownMenuID{3}:=3
						ARRAY LONGINT:C221(OI_al_AttachmentTypes; 0)
						ARRAY TEXT:C222(OI_at_AttachmentTypes; 0)
						AA_LoadListByName("Attachment Types"; ->OI_at_AttachmentTypes; ->OI_al_AttachmentTypes)
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
									While (Semaphore:C143("$usingArrays"))
										DelayTicks(2)
									End while 
									ARRAY LONGINT:C221(<>DOC_al_TableLink; 0)
									ARRAY LONGINT:C221(<>DOC_al_FIeldLink; 0)
									ARRAY LONGINT:C221(<>DOC_al_RecordID; 0)
									ARRAY TEXT:C222(<>DOC_at_RecordCode; 0)
									If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
										QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									End if 
									APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDER_ITEMS:25]))
									APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDER_ITEMS:25]x_ID:58)
									APPEND TO ARRAY:C911(<>DOC_at_RecordCode; String:C10([ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDERS:24]))
									APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
									APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDERS:24]x_ID:58)
									APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [ORDER_ITEMS:25]Order_Code:1)
									ZProc("Diary_InL"; DB_ProcessMemoryinit(6); "Enter Letters"; String:C10(Current process:C322); [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Order_Code:3; "OTHERRELS")
									
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
									If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
										QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									End if 
									APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDER_ITEMS:25]))
									APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDER_ITEMS:25]x_ID:58)
									APPEND TO ARRAY:C911(<>DOC_at_RecordCode; String:C10([ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(<>DOC_al_TableLink; Table:C252(->[ORDERS:24]))
									APPEND TO ARRAY:C911(<>DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
									APPEND TO ARRAY:C911(<>DOC_al_RecordID; [ORDERS:24]x_ID:58)
									APPEND TO ARRAY:C911(<>DOC_at_RecordCode; [ORDER_ITEMS:25]Order_Code:1)
									ZProc("Diary_InEmail"; DB_ProcessMemoryinit(4); "Enter eMail"; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Order_Code:3; String:C10(Current process:C322); "OTHERRELS")
									
									While (Size of array:C274(<>DOC_al_TableLink)>0)
										DelayTicks(2)
									End while 
									CLEAR SEMAPHORE:C144("$usingArrays")
									//we could have SMS as well here!
								: (GEN_at_DropDownMenu=3)  //attach external document
									If ([ORDER_ITEMS:25]x_ID:58=0)
										[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
									End if 
									ARRAY LONGINT:C221(DOC_al_TableLink; 0)
									ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
									ARRAY LONGINT:C221(DOC_al_RecordID; 0)
									ARRAY TEXT:C222(DOC_at_RecordCode; 0)
									APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[ORDER_ITEMS:25]))
									APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[ORDERS:24]))
									APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[COMPANIES:2]))
									APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[CONTACTS:1]))
									APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[ORDERS:24]Order_Code:3))
									APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[COMPANIES:2]Company_Code:1))
									APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[CONTACTS:1]Contact_Code:2))
									APPEND TO ARRAY:C911(DOC_al_RecordID; [ORDER_ITEMS:25]x_ID:58)
									APPEND TO ARRAY:C911(DOC_al_RecordID; [ORDERS:24]x_ID:58)
									APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
									APPEND TO ARRAY:C911(DOC_al_RecordID; 0)
									APPEND TO ARRAY:C911(DOC_at_RecordCode; String:C10([ORDER_ITEMS:25]Item_Number:27))
									APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDER_ITEMS:25]Order_Code:1)
									APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Company_Code:1)
									APPEND TO ARRAY:C911(DOC_at_RecordCode; [ORDERS:24]Contact_Code:2)
									DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
									SD2_GetRelatedDiaryItems(Table:C252(->[ORDER_ITEMS:25]); Field:C253(->[ORDER_ITEMS:25]Item_Number:27); String:C10([ORDER_ITEMS:25]Item_Number:27); True:C214)
									
									ORDI_LoadSubArea
							End case 
						End if 
						
					: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[INVOICES:39])) & ($_t_DummyTab="")  //Invoices
						Gen_Alert("Sorry, you may not add invoices from an Order items in this way you must use the "+"invoic"+"e function!")
					: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57])) & ($_t_DummyTab="")  //Purchase orders
						Gen_Alert("Sorry, you may not add Purchase orders  from an Order item  in this way you must "+"use th"+"e invoic"+"e function!")
					: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) & ($_t_DummyTab="")  //STOCK ITEMS
						Gen_Alert("Sorry, you may not add Stock Movements  from an Order item  in this way you must "+"use th"+"allocation function!")
				End case 
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("ORDERI_AddSubEntity"; $_t_oldMethodName)
