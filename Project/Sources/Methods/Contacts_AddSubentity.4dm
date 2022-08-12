//%attributes = {}

If (False:C215)
	//Project Method Name:      Contacts_AddSubentity
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
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(CON_al_TabIncludes;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_Tabincludes; 0)
	ARRAY TEXT:C222($FieldValue; 0)
	//ARRAY TEXT(CON_at_TabNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_UseAll; GEN_Bo_ShowCreate; <>StatesLoaded; $_bo_OK; $_bo_UseAll; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_ProcessState; $_l_TabRow; $_l_VirtualFieldRow; $_l_VirtualFieldRow2; CON_l_IPcall; CON_l_SubInfoProcess; DOC_l_FIeldLink)
	C_LONGINT:C283(DOC_l_RecordID; DOC_l_TableLink; WIN_l_CurrentWinRef; $_l_ActionsIndex; $_l_CharacterPosition; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_DiaryType; $_l_ProcessState; $_l_TabRow; $_l_VirtualFieldRow)
	C_LONGINT:C283($_l_VirtualFieldRow2; CON_l_IPcall; CON_l_SubInfoProcess; CON_l_ViewTabsLabelsTABLE; DOC_l_FIeldLink; DOC_l_RecordID; DOC_l_TableLink; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_NulText; $_t_oldMethodName; CON_t_FalseTab; CON_t_SelectedCompanyCode; CON_t_ViewTabsLabel; DB_t_WindowTitle; DOC_t_RecordCode; GEN_t_CancelText; GEN_t_OKText; $_t_DummyTab; $_t_NulText)
	C_TEXT:C284($_t_oldMethodName; CON_t_SelectedCompanyCode; CON_t_ViewTabsLabel; DB_t_WindowTitle; DOC_t_RecordCode; GEN_t_CancelText; GEN_t_OKText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_AddSubentity")

//NG Feb 2004
//This method is to replace the code on the Companies_In screen
//it simply takes the code from the button xreport on each page where it appears and encompases the code
$_t_oldMethodName:=ERR_MethodTracker("Contacts_addSubEntity")
If (CON_l_SubInfoProcess>0)
	CON_Contexts  //..so the arrays are loaded here too
	$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
	If ($_l_ProcessState>=0)
		GET PROCESS VARIABLE:C371(CON_l_SubInfoProcess; CON_l_ViewTabsLabelsTABLE; CON_l_ViewTabsLabelsTABLE)
		If (CON_l_ViewTabsLabelsTABLE>0)
			
			
			//Script from x report on Page_1
			$_t_DummyTab:=CON_t_FalseTab  //Use has selected something from the add diary on the left....
			CON_t_FalseTab:=""
			Case of 
					
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[DIARY:12])) | ($_t_DummyTab#"")  //Diary
					If (True:C214) & (Not:C34(Is compiled mode:C492))
						//get the settings for the current tab
						ARRAY LONGINT:C221($_al_TabIncludes; 0)
						If ($_t_DummyTab="")
							GET PROCESS VARIABLE:C371(CON_l_SubInfoProcess; CON_t_ViewTabsLabel; CON_t_ViewTabsLabel)
							$_l_TabRow:=Find in array:C230(CON_at_TabNames; CON_t_ViewTabsLabel)
						Else 
							$_l_CharacterPosition:=Position:C15("Enter "; $_t_DummyTab)
							If ($_l_CharacterPosition>0)
								$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
								
								$_l_TabRow:=Find in array:C230(CON_at_TabNames; $_t_DummyTab)
							End if 
						End if 
						If ($_l_TabRow>0)
							COPY ARRAY:C226(CON_al_TabIncludes{$_l_TabRow}; $_al_TabIncludes)
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
							For ($_l_ActionsIndex; 1; Records in selection:C76([ACTIONS:13]))
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
											$_l_VirtualFieldRow2:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldRow}; Table:C252(->[COMPANIES:2]))
											If ($_l_VirtualFieldRow2>0)
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
						$_at_Relations{1}:=[CONTACTS:1]Contact_Code:2
						$_al_RelationTables{1}:=Table:C252(->[CONTACTS:1])
						$_al_RelationFields{1}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
						If (CON_t_SelectedCompanyCode#"")
							$_at_Relations{2}:=CON_t_SelectedCompanyCode
							$_al_RelationTables{2}:=Table:C252(->[COMPANIES:2]Company_Code:1)
							$_al_RelationFields{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
						Else 
							ARRAY TEXT:C222($_at_Relations; 1)
							ARRAY LONGINT:C221($_al_RelationTables; 1)
							ARRAY LONGINT:C221($_al_RelationFields; 1)
						End if 
						//if you want to send  other values to the diary entry such as start time then do so in the following way
						ARRAY LONGINT:C221($_al_FieldNumbers; 0)  //an array of the DIARY FIELD NUMBERS to set
						
						//ARRAY TEXT($FieldValue;0)  // a TEXT array of the values to put in=so coerse the date you want into alpha(its text so you can pass descriptions
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
						//$FieldValue{1}:=String(Current Date(*))
						
						$_l_CurrentProcess:=Current process:C322
						$_l_DiaryType:=2
						SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; ""; ->$_at_Tabincludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
						
					Else 
						Case of 
							: (CON_t_SelectedCompanyCode#"")
								ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); CON_t_SelectedCompanyCode; [CONTACTS:1]Contact_Code:2; "Diary_InNEW")
							: ([CONTACTS:1]Company_Code:1#"")
								ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [CONTACTS:1]Company_Code:1; [CONTACTS:1]Contact_Code:2; "Diary_InNEW")
							Else 
								ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; [CONTACTS:1]Contact_Code:2; "Diary_InNEW")
						End case 
					End if 
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[DOCUMENTS:7])) & ($_t_DummyTab="")
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
								Case of 
										
									: (CON_t_SelectedCompanyCode#"")
										DB_MenuNewRecord("DiaryLetter"; ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InL";◊K5*2;"Enter Letters";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
									: ([CONTACTS:1]Company_Code:1#"")
										DB_MenuNewRecord("DiaryLetter"; ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InL";◊K5*2;"Enter Letters";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
									Else 
										$_t_NulText:=""
										DB_MenuNewRecord("DiaryLetter"; ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InL";◊K5*2;"Enter Letters";String(Current process);"";[CONTACTS]Contact Code)
								End case 
								
							: (GEN_at_DropDownMenu=2)
								Case of 
									: (CON_t_SelectedCompanyCode#"")
										DB_MenuNewRecord("DiaryEmail"; ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InEmail";◊K4;"Enter eMail";CON_t_SelectedCompanyCode;[CONTACTS]Contact Code;"";String(Current process))
									: ([CONTACTS:1]Company_Code:1#"")
										DB_MenuNewRecord("DiaryEmail"; ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InEmail";◊K4;"Enter eMail";[CONTACTS]Company Code;[CONTACTS]Contact Code;"";String(Current process))
									Else 
										$_t_NulText:=""
										DB_MenuNewRecord("DiaryEmail"; ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
										
										//ZProc ("Diary_InEmail";◊K4;"Enter eMail";"";[CONTACTS]Contact Code;"";String(Current process))
								End case 
								//we could have SMS as well here!
							: (GEN_at_DropDownMenu=3)  //attach external document
								If ([CONTACTS:1]x_ID:33=0)
									[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
								End if 
								
								DOC_l_TableLink:=Table:C252(->[CONTACTS:1])
								DOC_l_FIeldLink:=Field:C253(->[CONTACTS:1]Contact_Code:2)
								DOC_t_RecordCode:=[CONTACTS:1]Contact_Code:2
								DOC_l_RecordID:=[CONTACTS:1]x_ID:33
								DOC_AddExternalDocument(->DOC_l_TableLink; ->DOC_l_FIeldLink; ->DOC_t_RecordCode; ->DOC_l_RecordID)
								CON_l_IPcall:=100
								SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; CON_l_IPcall)
								POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
						End case 
					End if 
					
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[ORDERS:24])) & ($_t_DummyTab="")
					
					GET PROCESS VARIABLE:C371(CON_l_SubInfoProcess; CON_t_ViewTabsLabel; CON_t_ViewTabsLabel)
					Case of 
						: (CON_t_ViewTabsLabel="Enquiries")
							// enter enquiries
							If (Not:C34(<>StatesLoaded))
								States_Load
							End if 
							Case of 
								: (CON_t_SelectedCompanyCode#"")
									DB_MenuNewRecord("OrdersEnquries"; ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
									
									//ZProc ("Order_InE";◊K3;Term_OrdWT ("Enter Enquiries");String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
								: ([CONTACTS:1]Company_Code:1#"")
									DB_MenuNewRecord("OrdersEnquiries"; ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
									
									//ZProc ("Order_InE";◊K3;Term_OrdWT ("Enter Enquiries");String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
								Else 
									$_t_NulText:=""
									DB_MenuNewRecord("OrdersEnquiries"; ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
									
									//ZProc ("Order_InE";◊K3;Term_OrdWT ("Enter Enquiries");String(Current process);"";[CONTACTS]Contact Code)
							End case 
							
						: (CON_t_ViewTabsLabel="Orders")
							
							Case of 
								: (CON_t_SelectedCompanyCode#"")
									DB_MenuNewRecord((Table name:C256(Table:C252(->[ORDERS:24]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
									
									
									//ZProc ("Order_In";◊K3;"Enter Sales Orders";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
								: ([CONTACTS:1]Company_Code:1#"")
									DB_MenuNewRecord((Table name:C256(Table:C252(->[ORDERS:24]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
									
									//ZProc ("Order_In";◊K3;"Enter Sales Orders";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
								Else 
									$_t_NulText:=""
									DB_MenuNewRecord((Table name:C256(Table:C252(->[ORDERS:24]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
									
									//ZProc ("Order_In";◊K3;"Enter Sales Orders";String(Current process);"";[CONTACTS]Contact Code)
							End case 
							
							
					End case 
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[PURCHASE_ORDERS:57])) & ($_t_DummyTab="")
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("PurchOrd_In";◊K2;"Enter Purchase Orders";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("PurchOrd_In";◊K2;"Enter Purchase Orders";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PURCHASE_ORDERS:57]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("PurchOrd_In";◊K2;"Enter Purchase Orders";String(Current process);"";[CONTACTS]Contact Code)
					End case 
					
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[INVOICES:39])) & ($_t_DummyTab="")
					
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[INVOICES:39]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Invoice_In";◊K3;"Enter Adhoc Invoices";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[INVOICES:39]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Invoice_In";◊K3;"Enter Adhoc Invoices";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[INVOICES:39]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Invoice_In";◊K3;"Enter Adhoc Invoices";String(Current process);"";[CONTACTS]Contact Code)
					End case 
					
					
					
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[CONTRACTS:17])) & ($_t_DummyTab="")
					//this does not put company in by default
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[CONTRACTS:17]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Contracts_In";◊K3;"Enter Contracts";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[CONTRACTS:17]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Contracts_In";◊K3;"Enter Contracts";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[CONTRACTS:17]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Contracts_In";◊K3;"Enter Contracts";String(Current process);"";[CONTACTS]Contact Code)
					End case 
					
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[SERVICE_CALLS:20])) & ($_t_DummyTab="")
					//AL not supporting bullets???? or time????
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Calls_In";◊K3;"Enter Calls";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Calls_In";◊K3;"Enter Calls";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Calls_In";◊K3;"Enter Calls";String(Current process);"";[CONTACTS]Contact Code)
					End case 
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[PRODUCTS:9])) & ($_t_DummyTab="")
					//need some special handling added here to add the supplier to the products
					
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PRODUCTS:9]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Products_In";◊K2;"Enter Products";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PRODUCTS:9]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Products_In";◊K2;"Enter Products";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[PRODUCTS:9]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Products_In";◊K2;"Enter Products";String(Current process);"";[CONTACTS]Contact Code)
					End case 
				: (CON_l_ViewTabsLabelsTABLE=Table:C252(->[JOBS:26])) & ($_t_DummyTab="")
					
					
					
					Case of 
						: (CON_t_SelectedCompanyCode#"")
							
							//ZProc ("Jobs_In";◊K2;"Enter Jobs";String(Current process);CON_t_SelectedCompanyCode;[CONTACTS]Contact Code)
							DB_MenuNewRecord((Table name:C256(Table:C252(->[JOBS:26]))); ->CON_t_SelectedCompanyCode; ->[CONTACTS:1]Contact_Code:2)
							
						: ([CONTACTS:1]Company_Code:1#"")
							DB_MenuNewRecord((Table name:C256(Table:C252(->[JOBS:26]))); ->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Jobs_In";◊K2;"Enter Jobs";String(Current process);[CONTACTS]Company Code;[CONTACTS]Contact Code)
						Else 
							$_t_NulText:=""
							DB_MenuNewRecord((Table name:C256(Table:C252(->[JOBS:26]))); ->$_t_NulText; ->[CONTACTS:1]Contact_Code:2)
							
							//ZProc ("Jobs_In";◊K2;"Enter Jobs";String(Current process);"";[CONTACTS]Contact Code)
					End case 
					
					
					
					
					
					
					
			End case 
			
			
			
			
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Contacts_addSubEntity"; $_t_oldMethodName)
