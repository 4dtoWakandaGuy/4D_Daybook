//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   03/06/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(WR DELETE OFFSCREEN AREA)
	//C_UNKNOWN(WR INSERT TEXT)
	//C_UNKNOWN(WR New offscreen area)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CONT_al_TabPage;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY TEXT(CON_at_ChargePeriods;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	//ARRAY TEXT(CONT_at_TabNames;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(SVS_at_ChargableActions;0)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_BOOLEAN:C305($_bo_4DWriteIsInstalled; $_bo_DocOK; CON_bo_Chargable; CON_bo_LoansBilling; CON_bo_PartsBilling; CON_bo_TimeOption; DB_bo_NoLoad; DB_bo_RecordModified; ORD_bo_ProductIsFound; PAL_bo_ButtonSubFunction; SVS_bo_Chargable)
	C_BOOLEAN:C305(SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_Sheduled; SVS_bo_TimeOption)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CalledFromProcess; $_l_CharacterPosition; $_l_Event; $_l_Index; $_l_ModuleRow; $_l_Offscreen; $_l_TypeOpenEndedStatus; $1; CON_iRB_ChargoutBilling; CON_iRB_TimeBilling)
	C_LONGINT:C283(CON_l_ChargeLoanOption; CON_l_ChargePeriodType; CON_l_LoansPricePeriod; CON_l_LoansPricePeriodOLD; CON_l_OpenEndedStatus; CON_l_RestrictCharging; CON_l_TimeBilling; CON_l_TimeMinimum; CON_l_TimeMinimumOLD; CON_l_TimePerUnit; CON_l_TimePerUnitOLD)
	C_LONGINT:C283(CON2_iRB_ChargePartPeriod; CON2_iRB_ChargePartPeriodnil; CON2_iRB_ChargeProRata; CONT_4DWriteText; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_PreviousRecord; SD2_l_CallingProcess; SD2_l_TableNum; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimePerUnit)
	C_OBJECT:C1216($_obj_ContractRules; $_obj_WpProObject; CONT_Obj_4DContractText)
	C_PICTURE:C286(CON_pic_ModePict)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListboxSetup)
	C_REAL:C285(S_iRB_TimeBilling; vTot)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_DocumentWriteType; $_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_SubItemName; BAR_t_Button; COM_t_TelephoneNumberFormat; CON_t_CurrencyCode; CON_t_CurrencyCodeOLD; CON_t_CurrencyName)
	C_TEXT:C284(CON_t_LoansPriceGroup; CON_t_PartsPriceGroup; CONT_t_FalseTab; CONT_t_LoansPriceGroup; CONT_t_LoansPriceGroupOLD; CONT_t_PartsPriceGroup; CONT_t_PartsPriceGroupOLD; CONT_t_TabFunction; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR)
	C_TEXT:C284(PAL_BUTTON; SD2_t_TabFunction; SVS_t_CurrencyCode; SVS_t_LoansPriceGroup; SVS_t_PartsPriceGroup; vButtDisCNTR; vCompName; vTel; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_InLP")
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388  //Contracts_InLP
Else 
	$_l_Event:=$1
End if 


Case of 
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->SVS_lb_ItemsSetup)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CONTRACTS:17]); "Contract_in")
		OpenHelp(Table:C252(->[CONTRACTS:17]); "Contract_in")
		
		$_ptr_ListboxSetup:=->SVS_aptr_ListboxSetup
		If (Size of array:C274($_ptr_ListboxSetup->)>=9)
			
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>=10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				If (FORM Get current page:C276=1)
					If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
						
						In_ButtChkDis(->vButtDisCNTR; "Contract")
					Else 
						If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //if and when we make items removable then we can include other tables this
							In_ButtChkDis(->vButtDisCNTR; "Contract"; $_t_SubItemName)
						Else 
							In_ButtChkDis(->vButtDisCNTR; "Contract")
						End if 
					End if 
				Else 
					In_ButtChkDis(->vButtDisCNTR; "Contract")
				End if 
			End if 
		End if 
		If (Records in selection:C76([CONTRACTS:17])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup(->CONT_al_ViewTableToTable; ->CONT_at_ViewTabsLabels; ->CONT_at_TabNames)
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				inButtSubHandle(FORM Get current page:C276; ->[CONTRACTS:17])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Code"))
				IP_t_MessageReplySTR:=[CONTRACTS:17]Company_Code:1
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Contact Code"))
				IP_t_MessageReplySTR:=[CONTRACTS:17]Contact_Code:2
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Record ID"))
				If ([CONTRACTS:17]x_ID:12=0)
					[CONTRACTS:17]x_ID:12:=AA_GetNextIDinMethod(->[CONTRACTS:17]x_ID:12)
				End if 
				IP_t_MessageReplySTR:=String:C10([CONTRACTS:17]x_ID:12)
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveDragged"))
				SCL_RetreiveDraggedLines(->SVS_aptr_ListboxSetup)
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				CONT_t_FalseTab:=CONT_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[CONTRACTS:17])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
				//Here we must select the records and put them in a longint array then pass them back to the calling process
				If (SD2_l_CallingProcess>0)
					$_l_CalledFromProcess:=SD2_l_CallingProcess
					SD2_l_CallingProcess:=0
					$_t_DummyTab:=SD2_t_TabFunction
					$_l_CharacterPosition:=Position:C15("View "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("View "); Length:C16($_t_DummyTab))
					End if 
					SD2_t_TabFunction:=""
					CREATE SET:C116([DIARY:12]; "COMcurrentDiary")  //Just to make sure we keep the selection
					CONT_SelectDiaryRecords(0; $_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CalledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CalledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					
				End if 
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("P:Contracts_InLPA"; ""; "Contracts_InDel"; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; "Contracts"; "1 3 4"; "Contracts_InLPB"; "Master"; "Contracts_Sel"; ""; ->[ORDER_ITEMS:25]; ->vButtDisCNTR; ->SVS_lb_ItemsSetup; True:C214)
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CONTRACTS:17]); "Contract_in")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([CONTRACTS:17]End_Date:6))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]End_Date:6)
			: (Modified:C32([CONTRACTS:17]Start_Date:5))
				[CONTRACTS:17]End_Date:6:=[CONTRACTS:17]Start_Date:5+[CONTRACT_TYPES:19]Days:4
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Start_Date:5)
			: (vTot=1)
				[CONTRACTS:17]Contract_Cost:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)); 2; 2)
				vTot:=0
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CONTRACTS:17]Company_Code:1))
				Check_Company(->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17]Contact_Code:2; ->[CONTRACTS:17])
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				If ([COMPANIES:2]Country:8#"")
					If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
						QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
						COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
					End if 
				Else 
					COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
				End if 
				If (COM_t_TelephoneNumberFormat#"")
					OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
				End if 
				Check_ContDef(->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17]Contact_Code:2)
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Company_Code:1)
			: (Modified:C32([CONTRACTS:17]Contact_Code:2))
				Check_Contact(->[CONTRACTS:17]Contact_Code:2; ->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17])
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Contact_Code:2)
			: (Modified:C32([CONTRACTS:17]Contract_Code:3))
				RemoveLeadTr(Uppercase:C13([CONTRACTS:17]Contract_Code:3); ->[CONTRACTS:17]Contract_Code:3)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					Gen_Confirm("Do you want to recode the Contract Items?"; "Yes"; "No")
					If (OK=1)
						If (Not:C34(In transaction:C397))
							DB_lockFile(->[ORDER_ITEMS:25])
							APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						Else 
							FIRST RECORD:C50([ORDER_ITEMS:25])
							For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
								[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								NEXT RECORD:C51([ORDER_ITEMS:25])
							End for 
						End if 
						
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Contract_Code:3)
			: (Modified:C32([CONTRACTS:17]Contract_Type_Code:4))
				Check_Minor(->[CONTRACTS:17]Contract_Type_Code:4; "Type"; ->[CONTRACT_TYPES:19]; ->[CONTRACT_TYPES:19]Contract_Type_Code:1; ->[CONTRACT_TYPES:19]Contract_Type_Name:2; "ContTypes In")
				If ([CONTRACTS:17]Contract_Type_Code:4#"")
					If ([CONTRACTS:17]Start_Date:5=!00-00-00!)
						[CONTRACTS:17]Start_Date:5:=<>DB_d_CurrentDate
						[CONTRACTS:17]End_Date:6:=<>DB_d_CurrentDate+[CONTRACT_TYPES:19]Days:4
					End if 
					
					DB_bo_RecordModified:=True:C214
					
					If ([CONTRACT_TYPES:19]Contract_Type_Code:1#[CONTRACTS:17]Contract_Type_Code:4)
						QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=[CONTRACTS:17]Contract_Type_Code:4)
					End if 
					$_l_TypeOpenEndedStatus:=[CONTRACT_TYPES:19]xOpenEndedStatus:12
					If (BLOB size:C605([CONTRACTS:17]xContractRules:13)=0)
						$_obj_ContractRules:=New object:C1471
						$_obj_ContractRules:=SVS_ContractTypeLoadRules  // Load the contract type rules.
						//`Save these into the contract blob
						//NOTE THESE ARE THE CONTRACT TYPE VARIABLES NOT THE CONTRACT VARIABLES!!
						VARIABLE TO BLOB:C532(SVS_bo_Chargable; [CONTRACT_TYPES:19]xContractTypeRules:9; *)  //Work is charg-able
						VARIABLE TO BLOB:C532(SVS_t_CurrencyCode; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_TimeBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_TimePerUnit; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_TimeMinimum; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_bo_TimeOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_bo_Sheduled; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_bo_PartsBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_t_PartsPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_bo_LoansBilling; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_t_LoansPriceGroup; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_LoansPricePeriod; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_ChargePeriodType; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_l_ChargeLoanOption; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						VARIABLE TO BLOB:C532(SVS_at_ChargableActions; [CONTRACT_TYPES:19]xContractTypeRules:9; *)
						SVS_ContractLoadRules
					End if 
					//``
					If ($_l_TypeOpenEndedStatus>0)
						If ([CONTRACTS:17]End_Date:6=!00-00-00!) | ([CONTRACTS:17]End_Date:6>=Current date:C33(*))
							OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; True:C214)
							If ($_l_TypeOpenEndedStatus=2)
								[CONTRACTS:17]End_Date:6:=!00-00-00!
								OBJECT SET VISIBLE:C603(*; "oEndDate@"; False:C215)
								[CONTRACTS:17]xOpenEndedStatus:16:=1  // is open ended
								OBJECT SET ENABLED:C1123(CON_l_OpenEndedStatus; False:C215)
								//Object Set Enabled(CON_l_OpenEndedStatus;FALSE)
							Else 
								If ([CONTRACTS:17]End_Date:6=[CONTRACTS:17]Start_Date:5) & ([CONTRACTS:17]xOpenEndedStatus:16=1)
									[CONTRACTS:17]End_Date:6:=!00-00-00!
									OBJECT SET VISIBLE:C603(*; "oEndDate@"; False:C215)
								End if 
								//it is what it is..
								//[CONTRACTS]xOpenEndedStatus:=0  ` is NOT open ended
							End if 
						Else 
							//Contract has an end date and is already finished
							[CONTRACTS:17]xOpenEndedStatus:16:=0
							OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; False:C215)
							
						End if 
					Else 
						//it never is
						[CONTRACTS:17]xOpenEndedStatus:16:=0
						OBJECT SET VISIBLE:C603(*; "oContractOpenEndedStatus"; False:C215)
						
					End if 
					CON_l_OpenEndedStatus:=[CONTRACTS:17]xOpenEndedStatus:16
					
					//```
					
					//4D Write Letter
					If (DB_UserHas4DWriteAccess)
						$_t_DocumentWriteType:=Documents_4DWriteAccessType(True:C214)
						If ($_t_DocumentWriteType="W@")
							If (([CONTRACTS:17]Contract_Text:8="") | ([CONTRACTS:17]Contract_Text:8=" ") | ([CONTRACTS:17]Contract_Text:8=Char:C90(13)))
								If ([CONTRACT_TYPES:19]Contract_DOCRef:10="")  //this contract type has not template document
									If ([CONTRACT_TYPES:19]Contract_Text:6#"")  //it does have some text
										[CONTRACTS:17]Contract_Text:8:=[CONTRACT_TYPES:19]Contract_Text:6
										CREATE RECORD:C68([DOCUMENTS:7])
										[DOCUMENTS:7]Document_Class:14:=4D Write Letter  //
										[DOCUMENTS:7]Document_Status:15:=1
										[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACTS:17])
										[DOCUMENTS:7]Heading:2:="Contract "+[CONTRACTS:17]Contract_Code:3
										Set_DocumentCode(1)
										$_obj_WpProObject:=WP New:C1317
										//$_l_Offscreen:=WR New offscreen area  //wr new offscreen area
										
										//WR INSERT TEXT($_l_Offscreen; [CONTRACTS]Contract_Text)  //wr  insert text
										WP SET TEXT:C1574($_obj_WpProObject; [CONTRACTS:17]Contract_Text:8; wk append:K81:179)
										[DOCUMENTS:7]DocumentWPPro:35:=$_obj_WpProObject
										
										//[DOCUMENTS]Write_:=WR Area to picture($_l_Offscreen; 1; 1)  //wr aread to picutre
										//WR DELETE OFFSCREEN AREA($_l_Offscreen)  //delete offscreen area
										DB_SaveRecord(->[DOCUMENTS:7])
										[CONTRACTS:17]Contract_DocRef:14:=[DOCUMENTS:7]Document_Code:1
										$_bo_DocOK:=True:C214
									Else 
										$_bo_DocOK:=False:C215
									End if 
								Else 
									//contract TYPE has a wp doc
									$_bo_DocOK:=True:C214
									QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[CONTRACT_TYPES:19]Contract_DOCRef:10)
									//$_l_Offscreen:=WR New offscreen area  ///wr new offscreen area
									$_obj_WpProObject:=WP New:C1317
									//WR PICTURE TO AREA($_l_Offscreen; [DOCUMENTS]Write_)  //Expanding the field
									$_obj_WpProObject:=[DOCUMENTS:7]DocumentWPPro:35
									DUPLICATE RECORD:C225([DOCUMENTS:7])
									[DOCUMENTS:7]DocumentWPPro:35:=$_obj_WpProObject
									//[DOCUMENTS]Write_:=WR Area to picture($_l_Offscreen; 1; 1)
									//WR DELETE OFFSCREEN AREA($_l_Offscreen)
									Set_DocumentCode(2; "L")
									[DOCUMENTS:7]Standard:9:=False:C215
									[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
									[DOCUMENTS:7]Heading:2:="Contract "+[CONTRACTS:17]Contract_Code:3
									[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
									[DOCUMENTS:7]Document_Status:15:=1
									DB_SaveRecord(->[DOCUMENTS:7])
									[CONTRACTS:17]Contract_DocRef:14:=[DOCUMENTS:7]Document_Code:1
								End if 
								If ($_bo_DocOK=True:C214)
									CONT_Obj_4DContractText:=[DOCUMENTS:7]DocumentWPPro:35
									//WR PICTURE TO AREA(CONT_4DWriteText; [DOCUMENTS]Write_)
									DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
									
								Else 
									DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
								End if 
							Else 
								//this contract already has text
								If ([CONTRACT_TYPES:19]Contract_DOCRef:10="")
									CREATE RECORD:C68([DOCUMENTS:7])
									[DOCUMENTS:7]Document_Class:14:=4D Write Letter
									[DOCUMENTS:7]Document_Status:15:=1
									[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACTS:17])
									[DOCUMENTS:7]Heading:2:="Contract "+[CONTRACTS:17]Contract_Code:3
									Set_DocumentCode(1)
									$_l_Offscreen:=WR New offscreen area:P12000:47
									WR INSERT TEXT:P12000:19($_l_Offscreen; [CONTRACTS:17]Contract_Text:8)
									[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139($_l_Offscreen; 1; 1)
									WR DELETE OFFSCREEN AREA:P12000:38($_l_Offscreen)
									DB_SaveRecord(->[DOCUMENTS:7])
									[CONTRACTS:17]Contract_DocRef:14:=[DOCUMENTS:7]Document_Code:1
								Else 
									QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[CONTRACTS:17]Contract_DocRef:14)
								End if 
								WR PICTURE TO AREA:P12000:141(CONT_4DWriteText; [DOCUMENTS:7]Write_:5)
								DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
								
							End if 
							OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; False:C215)
							OBJECT SET VISIBLE:C603(CONT_4DWriteText; True:C214)
						Else 
							//no 4D write here.
							OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; True:C214)
							OBJECT SET VISIBLE:C603(CONT_4DWriteText; False:C215)
							If (([CONTRACTS:17]Contract_Text:8="") | ([CONTRACTS:17]Contract_Text:8=" ") | ([CONTRACTS:17]Contract_Text:8=Char:C90(13)))
								[CONTRACTS:17]Contract_Text:8:=[CONTRACT_TYPES:19]Contract_Text:6
							End if 
						End if 
						
					Else 
						//no 4D write here.
						OBJECT SET VISIBLE:C603([CONTRACTS:17]Contract_Text:8; True:C214)
						OBJECT SET VISIBLE:C603(CONT_4DWriteText; False:C215)
						If (([CONTRACTS:17]Contract_Text:8="") | ([CONTRACTS:17]Contract_Text:8=" ") | ([CONTRACTS:17]Contract_Text:8=Char:C90(13)))
							[CONTRACTS:17]Contract_Text:8:=[CONTRACT_TYPES:19]Contract_Text:6
						End if 
					End if 
					
					Macro_AccTypePt(->[CONTRACTS:17]Contract_Type_Code:4)
				End if 
				
			: (Modified:C32([CONTRACTS:17]Supplier_Company:9))
				Check_Minor(->[CONTRACTS:17]Supplier_Company:9; "Company"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Name:2; "Companies_In")
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Check_ContDef(->[CONTRACTS:17]Supplier_Company:9; ->[CONTRACTS:17]Supplier_Contact:10)
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Supplier_Company:9)
			: (Modified:C32([CONTRACTS:17]Supplier_Contact:10))
				Check_Contact(->[CONTRACTS:17]Supplier_Contact:10; ->[CONTRACTS:17]Supplier_Company:9; ->[CONTRACTS:17])
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[CONTRACTS:17]Supplier_Contact:10)
				
			: (Modified:C32([CONTRACTS:17]X_Contract_Billing_Product:11))
				ORD_bo_ProductIsFound:=False:C215
				Check_Product(->[CONTRACTS:17]X_Contract_Billing_Product:11; "Product"; ->ORD_bo_ProductIsFound)
				Macro_AccTypePt(->[CONTRACTS:17]X_Contract_Billing_Product:11)
				
			: (CON_t_CurrencyCode#CON_t_CurrencyCodeOLD)  //modified Currency Code
				Check_MinorNC(->CON_t_CurrencyCode; "Units"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
				If (CON_t_CurrencyCode#"")
					CON_t_CurrencyCodeOLD:=CON_t_CurrencyCode
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CON_t_CurrencyCode)
					If (Records in selection:C76([CURRENCIES:71])=1)
						CON_t_CurrencyName:=[CURRENCIES:71]Currency_Name:2
					End if 
					
					UNLOAD RECORD:C212([CURRENCIES:71])
					OBJECT SET VISIBLE:C603(CON_t_CurrencyName; True:C214)
				Else 
					CON_t_CurrencyCode:=CON_t_CurrencyCodeOLD
				End if 
			: (CON_l_TimePerUnit#CON_l_TimePerUnitOLD)  //modified Currency Cod
			: (CON_l_TimeMinimum#CON_l_TimeMinimumOLD)
			: (CONT_t_PartsPriceGroup#CONT_t_PartsPriceGroupOLD)
				Check_MinorNC(->CONT_t_PartsPriceGroup; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
				If (CONT_t_PartsPriceGroup#"")
					CONT_t_PartsPriceGroupOLD:=CONT_t_PartsPriceGroup
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_PartsPriceGroup)
					CON_t_PartsPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
				Else 
					CONT_t_PartsPriceGroup:=CONT_t_PartsPriceGroupOLD
				End if 
			: (CONT_t_LoansPriceGroup#CONT_t_LoansPriceGroupOLD)
				Check_MinorNC(->CONT_t_LoansPriceGroup; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
				If (CONT_t_LoansPriceGroup#"")
					CONT_t_LoansPriceGroupOLD:=CONT_t_LoansPriceGroup
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_LoansPriceGroup)
					CON_t_LoansPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
				Else 
					CONT_t_LoansPriceGroup:=CONT_t_LoansPriceGroupOLD
				End if 
			: (CON_l_LoansPricePeriod#CON_l_LoansPricePeriodOLD)
			: ($_l_Event=On Menu Selected:K2:14)
				DB_SetInputFormMenu(Table:C252(->[CONTRACTS:17]); "Contract_in")
				If (Size of array:C274(SVS_aptr_ListboxSetup)>=9)
					$_ptr_ArrayReferences:=SVS_aptr_ListboxSetup{9}
					If (Size of array:C274($_ptr_ArrayReferences->)>=10)
						$_t_SubItemName:=$_ptr_ArrayReferences->{10}
						If (FORM Get current page:C276=1)
							If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
								
								In_ButtChkDis(->vButtDisCNTR; "Contract")
							Else 
								If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //if and when we make items removable then we can include other tables this
									In_ButtChkDis(->vButtDisCNTR; "Contract"; $_t_SubItemName)
								Else 
									In_ButtChkDis(->vButtDisCNTR; "Contract")
								End if 
							End if 
						Else 
							In_ButtChkDis(->vButtDisCNTR; "Contract")
						End if 
					End if 
				End if 
				If (Records in selection:C76([CONTRACTS:17])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
				SD2_SetDiaryPopup(->CONT_al_ViewTableToTable; ->CONT_at_ViewTabsLabels; ->CONT_at_TabNames)
				
		End case 
		If (CON_iRB_TimeBilling=1)
			CON_l_TimeBilling:=1
		End if 
		If (CON_bo_Chargable)
			OBJECT SET ENTERABLE:C238(*; "oChargingCurrency"; True:C214)
			OBJECT SET ENABLED:C1123(*; "oContractTimeBilling"; True:C214)
			OBJECT SET ENABLED:C1123(*; "oContractChargoutBilling"; True:C214)
			OBJECT SET ENABLED:C1123(*; "oRestrictCharging"; True:C214)
			If (CON_t_CurrencyCode#"")
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=CON_t_CurrencyCode)
				If (Records in selection:C76([CURRENCIES:71])=1)
					CON_t_CurrencyName:=[CURRENCIES:71]Currency_Name:2
				End if 
				
				UNLOAD RECORD:C212([CURRENCIES:71])
				OBJECT SET VISIBLE:C603(*; "oConCurrencyName"; True:C214)
			End if 
			Case of 
				: (CON_iRB_TimeBilling=1)
					CON_l_TimeBilling:=1
					CON_iRB_ChargoutBilling:=0
					OBJECT SET ENTERABLE:C238(*; "oChargingTime"; True:C214)
					OBJECT SET ENTERABLE:C238(*; "oChargingTimeMinimum"; True:C214)
					OBJECT SET ENABLED:C1123(*; "oContractTimeOption"; True:C214)
					CON_iRB_ChargoutBilling:=0
				Else 
					S_iRB_TimeBilling:=0
					CON_l_TimeBilling:=0
					OBJECT SET ENTERABLE:C238(*; "oChargingTime"; False:C215)
					OBJECT SET ENTERABLE:C238(*; "oChargingTimeMinimum"; False:C215)
					OBJECT SET ENABLED:C1123(*; "oContractTimeOption"; False:C215)
					CON_iRB_ChargoutBilling:=1
			End case 
		Else 
			
			
			OBJECT SET ENTERABLE:C238(*; "oChargingTime"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "oChargingTimeMinimum"; False:C215)
			OBJECT SET ENABLED:C1123(*; "oContractTimeOption"; False:C215)
			OBJECT SET ENTERABLE:C238(CON_t_CurrencyCode; False:C215)
			OBJECT SET ENABLED:C1123(CON_iRB_TimeBilling; False:C215)
			OBJECT SET ENABLED:C1123(CON_iRB_ChargoutBilling; False:C215)
			OBJECT SET ENABLED:C1123(CON_l_RestrictCharging; False:C215)
		End if 
		
		If (CON_bo_PartsBilling)
			OBJECT SET ENTERABLE:C238(CONT_t_PartsPriceGroup; True:C214)
			QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_PartsPriceGroup)
			CON_t_PartsPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
		Else 
			OBJECT SET ENTERABLE:C238(CONT_t_PartsPriceGroup; False:C215)
			CON_t_PartsPriceGroup:=""
			OBJECT SET VISIBLE:C603(CON_t_PartsPriceGroup; False:C215)
		End if 
		
		If (CON_bo_LoansBilling)
			OBJECT SET ENTERABLE:C238(CONT_t_LoansPriceGroup; True:C214)
			QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=CONT_t_LoansPriceGroup)
			CON_t_LoansPriceGroup:=[PRICE_GROUPS:18]Price_Name:2
			OBJECT SET ENTERABLE:C238(CON_l_LoansPricePeriod; True:C214)
			OBJECT SET VISIBLE:C603(CON_t_LoansPriceGroup; True:C214)
			OBJECT SET VISIBLE:C603(CON_at_ChargePeriods; True:C214)
			CON_at_ChargePeriods:=CON_l_ChargePeriodType
			Case of 
				: (CON2_iRB_ChargeProRata=1)
					CON_l_ChargeLoanOption:=2
					CON2_iRB_ChargePartPeriod:=0
					CON2_iRB_ChargePartPeriodnil:=0
				: (CON2_iRB_ChargePartPeriod=1)
					CON_l_ChargeLoanOption:=1
					CON2_iRB_ChargeProRata:=0
					
					CON2_iRB_ChargePartPeriodnil:=0
				: (CON2_iRB_ChargePartPeriodnil=1)
					CON_l_ChargeLoanOption:=0
					CON2_iRB_ChargeProRata:=0
					CON2_iRB_ChargePartPeriod:=0
					
			End case 
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargeProRata; True:C214)
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargePartPeriod; True:C214)
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargePartPeriodnil; True:C214)
		Else 
			OBJECT SET ENTERABLE:C238(CONT_t_LoansPriceGroup; False:C215)
			CON_t_LoansPriceGroup:=""
			OBJECT SET ENTERABLE:C238(CON_l_LoansPricePeriod; False:C215)
			OBJECT SET VISIBLE:C603(CON_t_LoansPriceGroup; False:C215)
			OBJECT SET VISIBLE:C603(CON_at_ChargePeriods; False:C215)
			CON_at_ChargePeriods:=0
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargeProRata; False:C215)
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargePartPeriod; False:C215)
			OBJECT SET ENABLED:C1123(CON2_iRB_ChargePartPeriodnil; False:C215)
		End if 
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[CONTRACTS:17]); "Contract_in")
		WS_AutoscreenSize(1; 384; 700; Table name:C256(->[CONTRACTS:17])+"_"+"Contract_in")
		ARRAY TEXT:C222(SVS_at_ContractsTabs; 3)
		ARRAY LONGINT:C221(CONT_al_TabPage; 3)
		OBJECT SET FONT:C164(SVS_at_ContractsTabs; "arial")
		OBJECT SET FONT STYLE:C166(SVS_at_ContractsTabs; 1)
		OBJECT SET FONT SIZE:C165(SVS_at_ContractsTabs; 12)
		SVS_at_ContractsTabs{1}:="   Contract Schedule  "
		CONT_al_TabPage{1}:=1
		SVS_at_ContractsTabs{2}:="   Contract Document  "
		CONT_al_TabPage{2}:=2
		SVS_at_ContractsTabs{3}:="   Charging Preferences  "
		CONT_al_TabPage{3}:=3
		// SVS_at_ContractsTabs{3}:="   3  "
		SVS_at_ContractsTabs:=1
		ARRAY TEXT:C222(CON_at_EditMode; 0)
		ARRAY LONGINT:C221(CON_al_EditMode; 0)
		LBi_SetListBoxOptions(->CON_at_EditMode; ->CON_al_EditMode; ->CON_pic_ModePict)
		Contracts_InLPB
		
		INT_SetInput(Table:C252(->[CONTRACTS:17]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[CONTRACTS:17]); "Contract_in")
		If (Records in selection:C76([CONTRACTS:17])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		SD2_SetDiaryPopup(->CONT_al_ViewTableToTable; ->CONT_at_ViewTabsLabels; ->CONT_at_TabNames)
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Contracts_InLP"; $_t_oldMethodName)

