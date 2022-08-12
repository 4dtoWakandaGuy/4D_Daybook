//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 13:09`Method: Calls_InLP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_LB_CHARGES;0)
	//ARRAY BOOLEAN(SC_lb_PROD;0)
	//ARRAY LONGINT(SC_al_ModeCharge;0)
	//ARRAY LONGINT(SC_al_ModeParts;0)
	//ARRAY LONGINT(SC_al_ProblemTypeIdsTemp;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY LONGINT(SVA_al_ServiceTabPage;0)
	//ARRAY LONGINT(SVS_al_ExtServiceLocations;0)
	//ARRAY LONGINT(SVS_al_IntServiceLocations;0)
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	ARRAY TEXT:C222($_at_ContractCodes; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	//ARRAY TEXT(SC_at_ModeCharge;0)
	//ARRAY TEXT(SC_at_ModeParts;0)
	//ARRAY TEXT(SC_at_ProblemTypes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	//ARRAY TEXT(SVS_at_ExtServiceLoactions;0)
	//ARRAY TEXT(SVS_at_IntServiceLoactions;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	//ARRAY TEXT(SVS_at_ResponseTypes;0)
	//ARRAY TEXT(SVS_at_ServiceTab;0)
	//ARRAY TEXT(SVS_at_StateCodes;0)
	//ARRAY TEXT(SVS_at_StatesNames;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Resolved; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Event; $_l_FieldNumber; $_l_Index; $_l_ItemReference; $_l_offset; $_l_ProblemTypePosition; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SublistID; $_l_TableNumber; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(iCancel; iOK; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; SC_l_problemtypes; SVS_l_ChargableCall; SVS_l_MaxResponseTime)
	C_PICTURE:C286(SC_Pi_PartsMode; SC_pic_LBMode)
	C_POINTER:C301($_ptr_FocusObject)
	C_REAL:C285($1; vTot)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_ItemText; $_t_oldMethodName; $_t_PalletButtonName; $_t_VariableName; COM_t_TelephoneNumberFormat; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; SVS_t_CallPriority; SVS_t_CompDetails)
	C_TEXT:C284(SVS_t_emailAddress; SVS_t_Mobile; vButtDisSC; vCompName; vStage; vTel; WIN_t_CurrentInputForm)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLP")
//Calls_In
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Resize:K2:27)
		LBI_Scrollonresize(->SC_lb_PROD)
		LBI_Scrollonresize(->SC_LB_CHARGES)
		SVS_SetFieldPositions(True:C214)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[SERVICE_CALLS:20]); "Calls_In13")
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "Calls  In13")
		In_ButtChkDis(->vButtDisSC)
		If (Records in selection:C76([SERVICE_CALLS:20])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[SERVICE_CALLS:20]); "Calls_In13")
		In_ButtChkDis(->vButtDisSC)
		If (Records in selection:C76([SERVICE_CALLS:20])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				Case of 
					: (FORM Get current page:C276=1)
						
						inButtSubHandle(FORM Get current page:C276; ->[SERVICE_CALLS:20]; "Calls_In13")
						
					: (FORM Get current page:C276=2)
						inButtSubHandle(FORM Get current page:C276; ->[SERVICE_CALLS:20]; "Calls_In13")
					: (FORM Get current page:C276=3)
						inButtSubHandle(FORM Get current page:C276; ->[SERVICE_CALLS:20]; "Calls_In13t")
						
				End case 
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("Calls_InLPA"; ""; "Minor_DelSin"; ->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; "Calls"; "1 4 5"; "Calls_InLPB"; "Master"; "Calls_Sel"; ""; ->[ORDER_ITEMS:25]; ->vButtDisSC)
			Else 
		End case 
		If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
			[SERVICE_CALLS:20]Response_Time:21:=((<>DB_d_CurrentDate-[SERVICE_CALLS:20]Call_Date:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+Current time:C178
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
			[SERVICE_CALLS:20]Response_Time:21:=((<>DB_d_CurrentDate-[SERVICE_CALLS:20]Call_Date:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+Current time:C178
		End if 
		
	: ($_l_Event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: (vTot=1)
				vTot:=0
				[SERVICE_CALLS:20]Value:12:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
				DB_bo_RecordModified:=True:C214
			: ($_t_VariableName="SVS_l_ChargableCall")
				//changed the chargable
				
				If (([SERVICE_CALLS:20]Your_Order_Number:25="") | ([SERVICE_CALLS:20]Your_Order_Number:25="CHARGE") | ([SERVICE_CALLS:20]Your_Order_Number:25="CONTRACT"))
					If (SVS_l_ChargableCall=1)
						[SERVICE_CALLS:20]Charge:8:="Y"
					Else 
						[SERVICE_CALLS:20]Charge:8:=""
					End if 
					If ([SERVICE_CALLS:20]Charge:8="Y")
						[SERVICE_CALLS:20]Your_Order_Number:25:="CHARGE"
					Else 
						[SERVICE_CALLS:20]Your_Order_Number:25:="CONTRACT"
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SERVICE_CALLS:20]Charge:8)
			: ($_t_VariableName="SVS_at_StatesNames")
				[SERVICE_CALLS:20]Table_State:29:=SVS_at_StateCodes{SVS_at_StatesNames}
				$_bo_Resolved:=[SERVICE_CALLS:20]Resolved:9
				[SERVICE_CALLS:20]Resolved:9:=SVS_SetResolved([SERVICE_CALLS:20]Table_State:29)
				// Was never any code one clicking resolved
				DB_bo_RecordModified:=True:C214
				If ([SERVICE_CALLS:20]Resolved:9#$_bo_Resolved)
					Macro_AccTypePt(->[SERVICE_CALLS:20]Resolved:9)
				End if 
			: ($_t_VariableName="SVS_t_CallPriority")
				$_l_ProblemTypePosition:=Find in array:C230(SVS_at_priorityNames; SVS_t_CallPriority)
				If ($_l_ProblemTypePosition>0)
					SVS_t_CallPriority:=SVS_at_priorityNames{$_l_ProblemTypePosition}
					[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{$_l_ProblemTypePosition})  //Yes its a number stored as a string
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
				Else 
					$_l_ProblemTypePosition:=Find in array:C230(SVS_al_PriorityNumbers; Num:C11(SVS_t_CallPriority))
					If ($_l_ProblemTypePosition>0)
						SVS_t_CallPriority:=SVS_at_priorityNames{$_l_ProblemTypePosition}
						[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{$_l_ProblemTypePosition})  //Yes its a number stored as a string
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
					End if 
				End if 
			: ($_t_VariableName="SVS_at_priorityNames")
				SVS_t_CallPriority:=SVS_at_priorityNames{SVS_at_priorityNames}
				[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{SVS_at_priorityNames})  //Yes its a number stored as a string
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
			: ($_t_VariableName="SC_l_ProblemTypes")
				$_l_SelectedListItem:=Selected list items:C379(SC_l_problemtypes)
				If ($_l_SelectedListItem>0)
					ARRAY TEXT:C222($_at_DiaryCodes; 0)
					GET LIST ITEM:C378(SC_l_problemtypes; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					If ($_l_ItemReference<0)
						$_l_ProblemtypePosition:=Find in array:C230(SC_al_ProblemTypeIdsTemp; Abs:C99($_l_ItemReference))
						If ($_l_ProblemtypePosition>0)  //it should be
							[SERVICE_CALLS:20]Problem_Code:14:=SC_at_ProblemTypes{$_l_ProblemtypePosition}
							QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=[SERVICE_CALLS:20]Problem_Code:14)
							[SERVICE_CALLS:20]x_ProblemTypeID:30:=[PROBLEMS:22]ProblemTypeID:3
							$_l_SelectedItemParent:=List item parent:C633(SC_l_problemtypes; $_l_ItemReference)
							If ($_l_SelectedItemParent>0)
								$_l_ProblemTypePosition:=Find in array:C230(SD2_al_ProblemTypeIDs; $_l_SelectedItemParent)
								If ($_l_ProblemTypePosition>0)
									[SERVICE_CALLS:20]x_ProblemTypeName:31:=SD2_at_ProblemTypeNames{$_l_ProblemTypePosition}
									
									//this is a defined problem type
									For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions{$_l_ProblemTypePosition}))
										APPEND TO ARRAY:C911($_at_DiaryCodes; SD_at_ProblemTypeActions{$_l_ProblemTypePosition}{$_l_Index})
										
									End for 
									
								End if 
								
							End if 
						End if 
						
						If (Size of array:C274($_at_DiaryCodes)>0)
							//this will transfer the problem description into the diary items and create 'n' actions-all of which will get their appropriate properties
							For ($_l_Index; 1; Size of array:C274($_at_DiaryCodes))
								SC_CreateDiaryItem([SERVICE_CALLS:20]Call_Code:4; $_at_DiaryCodes{$_l_Index})
								
							End for 
							//And update the arrays
						End if 
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
						
					End if 
					
				End if 
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			Case of 
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]xServiceLocationName:33))
					$_l_ProblemTypePosition:=Find in array:C230(SVS_at_IntServiceLoactions; [SERVICE_CALLS:20]xServiceLocationName:33)
					If ($_l_ProblemTypePosition<0)
						OBJECT SET VISIBLE:C603(*; "oIncoming@"; False:C215)
						$_l_ProblemTypePosition:=Find in array:C230(SVS_at_ExtServiceLoactions; [SERVICE_CALLS:20]xServiceLocationName:33)
						If ($_l_ProblemTypePosition<0)
							[SERVICE_CALLS:20]xServiceLocationName:33:=""
						Else 
							[SERVICE_CALLS:20]xServiceLocation:32:=SVS_al_ExtServiceLocations{$_l_ProblemTypePosition}
						End if 
					Else 
						OBJECT SET VISIBLE:C603(*; "oIncoming@"; True:C214)
						[SERVICE_CALLS:20]xServiceLocation:32:=SVS_al_IntServiceLocations{$_l_ProblemTypePosition}
					End if 
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Company_Code:1))
					Check_Company(->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20]Contact_Code:2; ->[SERVICE_CALLS:20])
					
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
					Address_Details(->SVS_t_CompDetails)
					QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
					If ([SERVICE_CALLS:20]Company_Code:1#"")
						Calls_dItemsLP
						If ([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3="")
							Check_ContDef(->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20]Contact_Code:2)
						Else 
							RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
							If (BLOB size:C605([CONTRACTS:17]xContactCodes:15)=0)
								QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
								
								
								If (Records in selection:C76([CONTRACTS_CONTACTS:151])>0)
									[SERVICE_CALLS:20]Contact_Code:2:=[CONTRACTS_CONTACTS:151]Contact_Code:1
									RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
									Contact_Details
								Else 
									If ([CONTRACTS:17]Contact_Code:2#"")
										[SERVICE_CALLS:20]Contact_Code:2:=[CONTRACTS:17]Contact_Code:2
										RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
										Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
									Else 
										Check_ContDef(->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20]Contact_Code:2)
										Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
									End if 
								End if 
							Else 
								ARRAY TEXT:C222($_at_ContractCodes; 0)
								$_l_offset:=0
								BLOB TO VARIABLE:C533([CONTRACTS:17]xContactCodes:15; $_at_ContractCodes; $_l_offset)
								If (Size of array:C274($_at_ContractCodes)>0)
									[SERVICE_CALLS:20]Contact_Code:2:=$_at_ContractCodes{1}
									RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
									Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
								Else 
									If ([CONTRACTS:17]Contact_Code:2#"")
										[SERVICE_CALLS:20]Contact_Code:2:=[CONTRACTS:17]Contact_Code:2
										RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
										Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
									Else 
										Check_ContDef(->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20]Contact_Code:2)
										Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
									End if 
								End if 
								
							End if 
							RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
							vStage:=[CREDIT_STAGES:54]Stage_Name:2
						End if 
					End if 
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Company_Code:1)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Contact_Code:2))
					Check_Contact(->[SERVICE_CALLS:20]Contact_Code:2; ->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20])
					
					If ([SERVICE_CALLS:20]Contact_Code:2#"")
						Calls_dItemsLP
						If (([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3#"") & ([SERVICE_CALLS:20]Contact_Code:2#""))
							RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
							QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
							If (Records in selection:C76([CONTRACTS_CONTACTS:151])>0)
								QUERY SELECTION:C341([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contact_Code:1=[SERVICE_CALLS:20]Contact_Code:2)
								If (Records in selection:C76([CONTRACTS_CONTACTS:151])=0)
									Gen_Alert("NB: This Contact is not 'allowed' on the Contract"; "OK")
								End if 
							End if 
						End if 
					End if 
					Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
					If ([SERVICE_CALLS:20]Company_Code:1#"")
						RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
						vStage:=[CREDIT_STAGES:54]Stage_Name:2
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Contact_Code:2)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Person:11))
					Check_MinorNC(->[SERVICE_CALLS:20]Person:11; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)  //5
					[SERVICE_CALLS:20]Supervisor:13:=[PERSONNEL:11]Supervisor:4
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Person:11)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Supervisor:13))
					Check_MinorNC(->[SERVICE_CALLS:20]Supervisor:13; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)  //5
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Supervisor:13)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Charge:8))
					[SERVICE_CALLS:20]Charge:8:=Uppercase:C13([SERVICE_CALLS:20]Charge:8)
					If (([SERVICE_CALLS:20]Your_Order_Number:25="") | ([SERVICE_CALLS:20]Your_Order_Number:25="CHARGE") | ([SERVICE_CALLS:20]Your_Order_Number:25="CONTRACT"))
						If ([SERVICE_CALLS:20]Charge:8="Y")
							[SERVICE_CALLS:20]Your_Order_Number:25:="CHARGE"
						Else 
							[SERVICE_CALLS:20]Your_Order_Number:25:="CONTRACT"
						End if 
					End if 
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Charge:8)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Problem_Code:14))
					Check_Minor(->[SERVICE_CALLS:20]Problem_Code:14; ""; ->[PROBLEMS:22]; ->[PROBLEMS:22]Problem_Code:1; ->[PROBLEMS:22]Problem_Name:2; "Problems In"; "Problem")  //7
					
					If ([SERVICE_CALLS:20]Problem_Code:14#"")
						If ([PROBLEMS:22]Problem_Code:1#[SERVICE_CALLS:20]Problem_Code:14)
							QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=[SERVICE_CALLS:20]Problem_Code:14)
						End if 
						[SERVICE_CALLS:20]x_ProblemTypeID:30:=[PROBLEMS:22]ProblemTypeID:3
						If ([SERVICE_CALLS:20]x_ProblemTypeID:30>0)
							$_l_ProblemTypePosition:=Find in array:C230(SD2_al_ProblemTypeIDs; [SERVICE_CALLS:20]x_ProblemTypeID:30)
							[SERVICE_CALLS:20]x_ProblemTypeName:31:=SD2_at_ProblemTypeNames{$_l_ProblemTypePosition}
						End if 
					End if 
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Problem_Code:14)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Problem_Description:15))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Problem_Description:15)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Solution_Code:16))
					
					Check_Minor(->[SERVICE_CALLS:20]Solution_Code:16; ""; ->[SOLUTIONS:23]; ->[SOLUTIONS:23]Solution_Code:1; ->[SOLUTIONS:23]Solution_Name:2; "Solutions In"; "Solution")
					Calls_InLPSol
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Solution_Code:16)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Solution_Description:17))
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Solution_Description:17)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Solution_Date:18))
					
					[SERVICE_CALLS:20]Elapsed_Time:19:=(([SERVICE_CALLS:20]Solution_Date:18-[SERVICE_CALLS:20]Call_Date:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+Current time:C178
					Macro_AccTypePt(->[SERVICE_CALLS:20]Solution_Date:18)
					
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Priority:10))
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
				: ($_l_FieldNumber=Field:C253(->[SERVICE_CALLS:20]Your_Order_Number:25))
					[SERVICE_CALLS:20]Your_Order_Number:25:=Uppercase:C13([SERVICE_CALLS:20]Your_Order_Number:25)
					DB_bo_RecordModified:=True:C214
					If (([SERVICE_CALLS:20]Your_Order_Number:25#"") & ([SERVICE_CALLS:20]Your_Order_Number:25#"CHARGE") & ([SERVICE_CALLS:20]Your_Order_Number:25#"CONTRACT"))
						//DISABLE BUTTON(SVS_l_ChargableCall)
						
					End if 
					Macro_AccTypePt(->[SERVICE_CALLS:20]Your_Order_Number:25)
			End case 
		End if 
		Case of 
			: (vTot=1)
				vTot:=0
				[SERVICE_CALLS:20]Value:12:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
				DB_bo_RecordModified:=True:C214
				
				
				
				
			: ($_t_VariableName="SVS_l_MaxResponseTime")
				Case of 
					: (SVS_at_ResponseTypes=1)
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_MaxResponseTime*60)
					: (SVS_at_ResponseTypes=2)
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_MaxResponseTime*60)*60
					: (SVS_at_ResponseTypes=3)
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+((SVS_l_MaxResponseTime*60)*60)*24
				End case 
			: ($_t_VariableName="SVS_l_ChargableCall")
				//changed the chargable
				
				If (([SERVICE_CALLS:20]Your_Order_Number:25="") | ([SERVICE_CALLS:20]Your_Order_Number:25="CHARGE") | ([SERVICE_CALLS:20]Your_Order_Number:25="CONTRACT"))
					If (SVS_l_ChargableCall=1)
						[SERVICE_CALLS:20]Charge:8:="Y"
					Else 
						[SERVICE_CALLS:20]Charge:8:=""
					End if 
					If ([SERVICE_CALLS:20]Charge:8="Y")
						[SERVICE_CALLS:20]Your_Order_Number:25:="CHARGE"
					Else 
						[SERVICE_CALLS:20]Your_Order_Number:25:="CONTRACT"
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SERVICE_CALLS:20]Charge:8)
			: ($_t_VariableName="SVS_at_StatesNames")
				[SERVICE_CALLS:20]Table_State:29:=SVS_at_StateCodes{SVS_at_StatesNames}
				$_bo_Resolved:=[SERVICE_CALLS:20]Resolved:9
				[SERVICE_CALLS:20]Resolved:9:=SVS_SetResolved([SERVICE_CALLS:20]Table_State:29)
				// Was never any code one clicking resolved
				DB_bo_RecordModified:=True:C214
				If ([SERVICE_CALLS:20]Resolved:9#$_bo_Resolved)
					Macro_AccTypePt(->[SERVICE_CALLS:20]Resolved:9)
				End if 
			: ($_t_VariableName="SVS_t_CallPriority")
				$_l_ProblemTypePosition:=Find in array:C230(SVS_at_priorityNames; SVS_t_CallPriority)
				If ($_l_ProblemTypePosition>0)
					SVS_t_CallPriority:=SVS_at_priorityNames{$_l_ProblemTypePosition}
					[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{$_l_ProblemTypePosition})  //Yes its a number stored as a string
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
				Else 
					$_l_ProblemTypePosition:=Find in array:C230(SVS_al_PriorityNumbers; Num:C11(SVS_t_CallPriority))
					If ($_l_ProblemTypePosition>0)
						SVS_t_CallPriority:=SVS_at_priorityNames{$_l_ProblemTypePosition}
						[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{$_l_ProblemTypePosition})  //Yes its a number stored as a string
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
					End if 
				End if 
			: ($_t_VariableName="SVS_at_priorityNames")
				SVS_t_CallPriority:=SVS_at_priorityNames{SVS_at_priorityNames}
				[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{SVS_at_priorityNames})  //Yes its a number stored as a string
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
			: ($_t_VariableName="SC_l_ProblemTypes")
				$_l_SelectedListItem:=Selected list items:C379(SC_l_problemtypes)
				If ($_l_SelectedListItem>0)
					ARRAY TEXT:C222($_at_DiaryCodes; 0)
					GET LIST ITEM:C378(SC_l_problemtypes; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					If ($_l_ItemReference<0)
						$_l_ProblemtypePosition:=Find in array:C230(SC_al_ProblemTypeIdsTemp; Abs:C99($_l_ItemReference))
						If ($_l_ProblemtypePosition>0)  //it should be
							[SERVICE_CALLS:20]Problem_Code:14:=SC_at_ProblemTypes{$_l_ProblemtypePosition}
							QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=[SERVICE_CALLS:20]Problem_Code:14)
							[SERVICE_CALLS:20]x_ProblemTypeID:30:=[PROBLEMS:22]ProblemTypeID:3
							$_l_SelectedItemParent:=List item parent:C633(SC_l_problemtypes; $_l_ItemReference)
							If ($_l_SelectedItemParent>0)
								
								$_l_ProblemTypePosition:=Find in array:C230(SD2_al_ProblemTypeIDs; $_l_SelectedItemParent)
								If ($_l_ProblemTypePosition>0)
									[SERVICE_CALLS:20]x_ProblemTypeName:31:=SD2_at_ProblemTypeNames{$_l_ProblemTypePosition}
									//this is a defined problem type
									For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions{$_l_ProblemTypePosition}))
										APPEND TO ARRAY:C911($_at_DiaryCodes; SD_at_ProblemTypeActions{$_l_ProblemTypePosition}{$_l_Index})
										
									End for 
									
								End if 
								
							End if 
						End if 
						
						If (Size of array:C274($_at_DiaryCodes)>0)
							//this will transfer the problem description into the diary items and create 'n' actions-all of which will get their appropriate properties
							For ($_l_Index; 1; Size of array:C274($_at_DiaryCodes))
								SC_CreateDiaryItem([SERVICE_CALLS:20]Call_Code:4; $_at_DiaryCodes{$_l_Index})
								
							End for 
							//And update the arrays
						End if 
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
						
					End if 
					
				End if 
				
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[SERVICE_CALLS:20]); "Calls_In13")
		
		
		WS_AutoscreenSize(1; 450; 1200; Table name:C256(->[SERVICE_CALLS:20])+"_"+"Calls_In13")
		ARRAY TEXT:C222(SVS_at_ServiceTab; 3)
		ARRAY LONGINT:C221(SVA_al_ServiceTabPage; 3)
		SVS_at_ServiceTab{1}:="Problem and Solution"
		SVS_at_ServiceTab{2}:="Products_Involved"
		SVS_at_ServiceTab{3}:="Charges & Parts Used"
		
		SVA_al_ServiceTabPage{1}:=1
		SVA_al_ServiceTabPage{2}:=2
		SVA_al_ServiceTabPage{3}:=3
		
		ARRAY TEXT:C222(SC_at_ModeParts; 0)
		ARRAY LONGINT:C221(SC_al_ModeParts; 0)
		LBi_SetListBoxOptions(->SC_at_ModeParts; ->SC_al_ModeParts; ->SC_Pi_PartsMode)
		
		ARRAY TEXT:C222(SC_at_ModeCharge; 0)
		ARRAY LONGINT:C221(SC_al_ModeCharge; 0)
		LBi_SetListBoxOptions(->SC_at_ModeCharge; ->SC_al_ModeCharge; ->SC_pic_LBMode)
		SVS_at_ServiceTab:=1
		FORM GOTO PAGE:C247(1)
		Calls_InLPB
		
		
		
		SVS_at_ServiceTab:=1
		FORM GOTO PAGE:C247(1)
		
		
		
		INT_SetInput(Table:C252(->[SERVICE_CALLS:20]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[SERVICE_CALLS:20]); "Calls_In13")
		If (Records in selection:C76([SERVICE_CALLS:20])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisSC)
		
		
		
		
		
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Calls_InLP"; $_t_oldMethodName)