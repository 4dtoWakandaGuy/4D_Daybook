//%attributes = {"publishedSoap":true}
If (False:C215)
	//Project Method Name:      CTypes_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(iCancel)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_BUTTON_20)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//C_UNKNOWN(SVS_iRB_ChargoutBilling)
	//C_UNKNOWN(SVS_iRB_TimeBilling)
	//C_UNKNOWN(SVS2_iRB_ChargePartPeriod)
	//C_UNKNOWN(SVS2_iRB_ChargePartPeriodnil)
	//C_UNKNOWN(SVS2_iRB_ChargeProRata)
	//C_UNKNOWN(vButtDisCtypes)
	//ARRAY BOOLEAN(SVS_abo_IsChargable;0)
	//ARRAY BOOLEAN(SVS_lb_RestrictCharging;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(SVS_at_ActionCodes;0)
	//ARRAY TEXT(SVS_at_ChargableActions;0)
	//ARRAY TEXT(SVS_at_ChargePeriods;0)
	C_BOOLEAN:C305($_bo_4DWriteInstalled; $_bo_Update; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_TimeOption; $_bo_4DWriteFound; $_bo_Update; DB_bo_NoLoad)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_TimeOption)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CharacterCount; $_l_Event; $_l_Index; $_l_ModuleRow; CONT_4DWriteText; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber)
	C_LONGINT:C283(PAL_BUTTON_20; PAL_but_NextRecord; PAL_but_FirstRecord; SVS_iRB_ChargoutBilling; SVS_iRB_TimeBilling; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_LoansPricePeriodOLD; SVS_l_TimeBilling; SVS_l_TimeMinimum)
	C_LONGINT:C283(SVS_l_TimeMinimumOLD; SVS_l_TimePerUnit; SVS_l_TimePerUnitOLD; SVS_lb_RestrictCharging; SVS2_iRB_ChargePartPeriod; SVS2_iRB_ChargePartPeriodnil; SVS2_iRB_ChargeProRata; $_l_ButtonNumber; $_l_CharacterCount; $_l_Event; $_l_Index)
	C_LONGINT:C283($_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; PAL_but_PreviousRecord; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_LoansPricePeriodOLD; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimeMinimumOLD)
	C_LONGINT:C283(SVS_l_TimePerUnit; SVS_l_TimePerUnitOLD)
	C_OBJECT:C1216($_obj_Licence; $_obj_ThisLicence; $_obj_WPRange; CONT_Obj_4DwriteText; $_obj_Licence; $_obj_WPRange; CONT_Obj_4DwriteText)
	C_REAL:C285(S_iRB_TimeBilling)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_WPText; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; SVS_t_CurrencyCode; SVS_t_CurrencyCodeOLD; SVS_t_CurrencyName; SVS_t_LoansPriceGroup)
	C_TEXT:C284(SVS_t_LoansPriceGroupNames; SVS_t_LoansPriceGroupOLD; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName; SVS_t_PartsPriceGroupOLD; vButtDisCtypes; WIN_t_CurrentInputForm; $_t_oldMethodName; $_t_PalletButtonName; $_t_WPText; BAR_t_Button)
	C_TEXT:C284(DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; SVS_t_CurrencyCode; SVS_t_CurrencyCodeOLD; SVS_t_CurrencyName; SVS_t_LoansPriceGroup; SVS_t_LoansPriceGroupNames; SVS_t_LoansPriceGroupOLD; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName; SVS_t_PartsPriceGroupOLD)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CTypes_InLP")
$_l_Event:=Form event code:C388
Minor_LP(->[CONTRACT_TYPES:19]Contract_Type_Code:1; ->[CONTRACT_TYPES:19]Contract_Type_Name:2; ->[CONTRACT_TYPES:19]; "Types"; "1"; "CTypes_InLPB"; "")

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[CONTRACT_TYPES:19]); "ContractType_In")
		CTypes_InLPB
		
		SD2_SetDiaryPopup
		WS_AutoscreenSize(1; 625; 585; Table name:C256(->[CONTRACT_TYPES:19])+"_"+"ContractType_In")
		INT_SetInput(Table:C252(->[CONTRACT_TYPES:19]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[CONTRACT_TYPES:19]); "ContractType_In")
		If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_20; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		//vButtDisCtypes:="I DPMO  FSSSRCADT"
		vButtDisCtypes:="I DPMO  FSSSRCADT"
		In_ButtChkDis(->vButtDisCtypes)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CONTRACT_TYPES:19]); "ContractType_In")
		If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_20; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (FORM Get current page:C276=4)
			vButtDisCtypes:="I    O  FSSSRCADT"
			In_ButtChkDis(->vButtDisCtypes)
		Else 
			vButtDisCtypes:="I DPMO  FSSSRCADT"
			In_ButtChkDis(->vButtDisCtypes)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[CONTRACT_TYPES:19]); "ContractType_In")
		If (Records in selection:C76([ACCOUNT_BALANCES:34])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_20; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		//Addded NG November 2006. This is to cope with update the blob and the document
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				//$Press:=DB L_ButtonClickedFunction
				inButtSubHandle(FORM Get current page:C276; ->[CONTRACT_TYPES:19])
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				Case of 
					: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1)
						
						If (DB_UserHas4DWriteAccess)  //| (True)
							If ([CONTRACT_TYPES:19]Contract_DOCRef:10#"")
								$_bo_Update:=True:C214
								READ WRITE:C146([DOCUMENTS:7])
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[CONTRACT_TYPES:19]Contract_DOCRef:10)
							Else 
								//$_l_CharacterCount:=‘12000;143‘(CONT_4DWriteText; ‘k12009;1‘)
								$_obj_WPRange:=WP Text range:C1341(CONT_Obj_4DwriteText; wk start text:K81:165; wk end text:K81:164)
								$_t_WPText:=WP Get text:C1575($_obj_WPRange; wk expressions as value:K81:255)
								$_l_CharacterCount:=Length:C16(Replace string:C233(Replace string:C233($_t_WPText; " "; ""); Char:C90(13); ""))
								
								If ($_l_CharacterCount>0)
									$_bo_Update:=True:C214
									//Document to be created
								End if 
							End if 
						Else 
							$_bo_Update:=False:C215
						End if 
						If ($_bo_Update=True:C214)
							If (Records in selection:C76([DOCUMENTS:7])=0)
								CREATE RECORD:C68([DOCUMENTS:7])
								CREATE RECORD:C68([DOCUMENTS:7])
								[DOCUMENTS:7]Document_Class:14:=4D Write Letter Template
								[DOCUMENTS:7]Document_Status:15:=0
								[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACT_TYPES:19])
								
								Set_DocumentCode(1)
							End if 
							[DOCUMENTS:7]Heading:2:=[CONTRACT_TYPES:19]Contract_Type_Name:2
							////[DOCUMENTS]Write_:=‘12000;139‘(CONT_4DWriteText; 1; 1)
							[DOCUMENTS:7]DocumentWPPro:35:=CONT_Obj_4DwriteText
							
							DB_SaveRecord(->[DOCUMENTS:7])
							UNLOAD RECORD:C212([DOCUMENTS:7])
						End if 
						ARRAY TEXT:C222(SVS_at_ChargableActions; 0)
						
						ARRAY TEXT:C222(SVS_at_ChargableActions; Size of array:C274(SVS_abo_IsChargable))
						$_l_CharacterCount:=0
						For ($_l_Index; 1; Size of array:C274(SVS_abo_IsChargable))
							If (SVS_abo_IsChargable{$_l_Index})
								$_l_CharacterCount:=$_l_CharacterCount+1
								SVS_at_ChargableActions{$_l_CharacterCount}:=SVS_at_ActionCodes{$_l_Index}
							End if 
						End for 
						ARRAY TEXT:C222(SVS_at_ChargableActions; $_l_CharacterCount)
						SVS_ContractTypeLoadRules(True:C214)
						
				End case 
		End case 
		
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[CONTRACT_TYPES:19]); "ContractType_In")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
			Else 
				If (Modified:C32([CONTRACT_TYPES:19]Price_Group:7))
					Check_MinorNC(->[CONTRACT_TYPES:19]Price_Group:7; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
				End if 
				Case of 
					: (SVS_t_CurrencyCode#SVS_t_CurrencyCodeOLD)  //modified Currency Code
						Check_MinorNC(->SVS_t_CurrencyCode; "Units"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
						If (SVS_t_CurrencyCode#"")
							SVS_t_CurrencyCodeOLD:=SVS_t_CurrencyCode
							QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=SVS_t_CurrencyCode)
							If (Records in selection:C76([CURRENCIES:71])=1)
								SVS_t_CurrencyName:=[CURRENCIES:71]Currency_Name:2
							End if 
							
							UNLOAD RECORD:C212([CURRENCIES:71])
							OBJECT SET VISIBLE:C603(SVS_t_CurrencyName; True:C214)
						Else 
							SVS_t_CurrencyCode:=SVS_t_CurrencyCodeOLD
						End if 
					: (SVS_l_TimePerUnit#SVS_l_TimePerUnitOLD)  //modified Currency Cod
					: (SVS_l_TimeMinimum#SVS_l_TimeMinimumOLD)
					: (SVS_t_PartsPriceGroup#SVS_t_PartsPriceGroupOLD)
						Check_MinorNC(->SVS_t_PartsPriceGroup; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
						If (SVS_t_PartsPriceGroup#"")
							SVS_t_PartsPriceGroupOLD:=SVS_t_PartsPriceGroup
							QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=SVS_t_PartsPriceGroup)
							SVS_t_PartsPriceGroupName:=[PRICE_GROUPS:18]Price_Name:2
						Else 
							SVS_t_PartsPriceGroup:=SVS_t_PartsPriceGroupOLD
						End if 
					: (SVS_t_LoansPriceGroup#SVS_t_LoansPriceGroupOLD)
						Check_MinorNC(->SVS_t_LoansPriceGroup; "PriceName"; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
						If (SVS_t_LoansPriceGroup#"")
							SVS_t_LoansPriceGroupOLD:=SVS_t_LoansPriceGroup
							QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=SVS_t_LoansPriceGroup)
							SVS_t_LoansPriceGroupNames:=[PRICE_GROUPS:18]Price_Name:2
						Else 
							SVS_t_LoansPriceGroup:=SVS_t_LoansPriceGroupOLD
						End if 
					: (SVS_l_LoansPricePeriod#SVS_l_LoansPricePeriodOLD)
				End case 
				If (SVS_iRB_TimeBilling=1)
					SVS_l_TimeBilling:=1
				End if 
				If (SVS_bo_Chargable)
					OBJECT SET ENTERABLE:C238(SVS_t_CurrencyCode; True:C214)
					OBJECT SET ENABLED:C1123(SVS_iRB_TimeBilling; True:C214)
					OBJECT SET ENABLED:C1123(SVS_iRB_ChargoutBilling; True:C214)
					OBJECT SET ENABLED:C1123(SVS_lb_RestrictCharging; True:C214)
					If (SVS_t_CurrencyCode#"")
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=SVS_t_CurrencyCode)
						If (Records in selection:C76([CURRENCIES:71])=1)
							SVS_t_CurrencyName:=[CURRENCIES:71]Currency_Name:2
						End if 
						
						UNLOAD RECORD:C212([CURRENCIES:71])
						OBJECT SET VISIBLE:C603(SVS_t_CurrencyName; True:C214)
					End if 
					Case of 
						: (SVS_iRB_TimeBilling=1)
							SVS_l_TimeBilling:=1
							SVS_iRB_ChargoutBilling:=0
							OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; True:C214)
							OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; True:C214)
							OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; True:C214)
							SVS_iRB_ChargoutBilling:=0
						Else 
							S_iRB_TimeBilling:=0
							SVS_l_TimeBilling:=0
							OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; False:C215)
							OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; False:C215)
							OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; False:C215)
							SVS_iRB_ChargoutBilling:=1
					End case 
				Else 
					
					
					OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; False:C215)
					OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; False:C215)
					OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; False:C215)
					OBJECT SET ENTERABLE:C238(SVS_t_CurrencyCode; False:C215)
					OBJECT SET ENABLED:C1123(SVS_iRB_TimeBilling; False:C215)
					OBJECT SET ENABLED:C1123(SVS_iRB_ChargoutBilling; False:C215)
					OBJECT SET ENABLED:C1123(SVS_lb_RestrictCharging; False:C215)
				End if 
				
				If (SVS_bo_PartsBilling)
					OBJECT SET ENTERABLE:C238(SVS_t_PartsPriceGroup; True:C214)
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=SVS_t_PartsPriceGroup)
					SVS_t_PartsPriceGroupName:=[PRICE_GROUPS:18]Price_Name:2
				Else 
					OBJECT SET ENTERABLE:C238(SVS_t_PartsPriceGroup; False:C215)
					SVS_t_PartsPriceGroupName:=""
					OBJECT SET VISIBLE:C603(SVS_t_PartsPriceGroupName; False:C215)
				End if 
				
				If (SVS_bo_LoansBilling)
					OBJECT SET ENTERABLE:C238(SVS_t_LoansPriceGroup; True:C214)
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=SVS_t_LoansPriceGroup)
					SVS_t_LoansPriceGroupNames:=[PRICE_GROUPS:18]Price_Name:2
					OBJECT SET ENTERABLE:C238(SVS_l_LoansPricePeriod; True:C214)
					OBJECT SET VISIBLE:C603(SVS_t_LoansPriceGroupNames; True:C214)
					OBJECT SET VISIBLE:C603(SVS_at_ChargePeriods; True:C214)
					SVS_at_ChargePeriods:=SVS_l_ChargePeriodType
					Case of 
						: (SVS2_iRB_ChargeProRata=1)
							SVS_l_ChargeLoanOption:=2
							SVS2_iRB_ChargePartPeriod:=0
							SVS2_iRB_ChargePartPeriodnil:=0
						: (SVS2_iRB_ChargePartPeriod=1)
							SVS_l_ChargeLoanOption:=1
							SVS2_iRB_ChargeProRata:=0
							
							SVS2_iRB_ChargePartPeriodnil:=0
						: (SVS2_iRB_ChargePartPeriodnil=1)
							SVS_l_ChargeLoanOption:=0
							SVS2_iRB_ChargeProRata:=0
							SVS2_iRB_ChargePartPeriod:=0
							
					End case 
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargeProRata; True:C214)
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriod; True:C214)
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriodnil; True:C214)
				Else 
					OBJECT SET ENTERABLE:C238(SVS_t_LoansPriceGroup; False:C215)
					SVS_t_LoansPriceGroupNames:=""
					OBJECT SET ENTERABLE:C238(SVS_l_LoansPricePeriod; False:C215)
					OBJECT SET VISIBLE:C603(SVS_t_LoansPriceGroupNames; False:C215)
					OBJECT SET VISIBLE:C603(SVS_at_ChargePeriods; False:C215)
					SVS_at_ChargePeriods:=0
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargeProRata; False:C215)
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriod; False:C215)
					OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriodnil; False:C215)
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("CTypes_InLP"; $_t_oldMethodName)
