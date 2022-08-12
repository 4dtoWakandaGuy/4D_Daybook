If (False:C215)
	//Table Form Method Name: Object Name:      [ACCOUNT_BALANCES].dCurrConv1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 17:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_DeactivatedCurrencies; 0)
	//ARRAY BOOLEAN(CUR_lb_CurrencyList;0)
	//ARRAY BOOLEAN(CURR_abo_CurrencySelect;0)
	//ARRAY LONGINT(Curr_al_Currency;0)
	//ARRAY TEXT(CUR_at_CurrencyCodeName;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	//ARRAY TEXT(CUR_at_InputCUrrencies;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_BaseCurrencyRow; $_l_BlankRow; $_l_CUrrenciesIndex; $_l_DefaultCurrencyRow; $_l_isUsed; bDeselectAll; bselectAll; CUR_l_BUT1; CUR_l_But2; CUR_l_BUT3; CUR_l_BUT4)
	C_LONGINT:C283(CUR_l_BUT5; CUR_l_BUT6; CUR_l_BUT7; CUR_l_BUT8; CUR_l_BUT9; Cur_PageNUmber; r0; r1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_CurrencyCode; CUR_t_COL1; CUR_t_COL2; CUR_t_COL3; CUR_t_COL4; CUR_t_COL5; CUR_t_COL6; CUR_t_COL7; CUR_t_COL8)
	C_TEXT:C284(CUR_t_COL9; CUR_t_HED1; CUR_t_HED2; CUR_t_HED3; CUR_t_HED4; CUR_t_HED5; CUR_t_HED6; CUR_t_HED7; CUR_t_HED8; CUR_t_HED9; CUR_t_OutputCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].dCurrConv1"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "dCurrConv1")
		AD_PreferenceLoad
		ARRAY LONGINT:C221(Curr_al_Currency; 0)
		ARRAY TEXT:C222(CUR_at_CurrencyCodeName; 0)
		ARRAY TEXT:C222(CUR_at_CurrencyCodeName; 0)
		ARRAY TEXT:C222(CUR_at_CurrencyCodes; 0)
		
		Case of 
				
			: (ACC_t_CurrencyCode="")
				ARRAY TEXT:C222(CUR_at_CurrencyCodes; 0)
				ARRAY TEXT:C222(CUR_at_CurrencyNames; 0)
				
				READ ONLY:C145([CURRENCIES:71])
				ALL RECORDS:C47([CURRENCIES:71])
				If (Size of array:C274(CUR_at_InputCUrrencies)>0)
					QUERY WITH ARRAY:C644([CURRENCIES:71]Currency_Code:1; CUR_at_InputCUrrencies)
				End if 
				SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; CUR_at_CurrencyCodes; [CURRENCIES:71]Currency_Name:2; CUR_at_CurrencyNames; [CURRENCIES:71]De_ActivatedCurrency:9; $_abo_DeactivatedCurrencies)
				Repeat 
					$_l_BlankRow:=Find in array:C230(CUR_at_CurrencyCodes; "")
					
					If ($_l_BlankRow>0)
						DELETE FROM ARRAY:C228(CUR_at_CurrencyCodes; $_l_BlankRow)
					End if 
					
				Until ($_l_BlankRow<0)
				
				$_l_DefaultCurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; <>SYS_t_BaseCurrency)
				ARRAY BOOLEAN:C223(CURR_abo_CurrencySelect; 0)
				ARRAY LONGINT:C221(Curr_al_Currency; 0)
				ARRAY TEXT:C222(CUR_at_CurrencyCodeName; 0)
				ARRAY TEXT:C222(CUR_at_CurrencyCodeName; 0)
				
				For ($_l_CUrrenciesIndex; 1; Size of array:C274(CUR_at_CurrencyCodes))
					If ($_abo_DeactivatedCurrencies{$_l_CUrrenciesIndex}=False:C215)
						APPEND TO ARRAY:C911(Curr_al_Currency; 1)
						APPEND TO ARRAY:C911(CURR_abo_CurrencySelect; True:C214)
						APPEND TO ARRAY:C911(CUR_at_CurrencyCodeName; CUR_at_CurrencyCodes{$_l_CUrrenciesIndex}+" ("+CUR_at_CurrencyNames{$_l_CUrrenciesIndex}+")")
						APPEND TO ARRAY:C911(CUR_at_CurrencyCodeName; CUR_at_CurrencyCodes{$_l_CUrrenciesIndex}+" ("+CUR_at_CurrencyNames{$_l_CUrrenciesIndex}+")")
					End if 
				End for 
				$_l_BaseCurrencyRow:=Find in array:C230(CUR_at_CurrencyCodes; <>SYS_t_BaseCurrency)
				If ($_l_BaseCurrencyRow<0)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
					If (Records in selection:C76([CURRENCIES:71])>0)
						APPEND TO ARRAY:C911(CUR_at_CurrencyCodeName; [CURRENCIES:71]Currency_Code:1+"("+[CURRENCIES:71]Currency_Name:2+")")
						$_l_DefaultCurrencyRow:=Size of array:C274(CUR_at_CurrencyCodeName)
					End if 
				End if 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_isUsed)
				
				For ($_l_CUrrenciesIndex; 1; Size of array:C274(CUR_at_CurrencyCodes))
					$_l_BaseCurrencyRow:=Find in array:C230(CUR_at_CurrencyCodeName; CUR_at_CurrencyCodes{$_l_CUrrenciesIndex})
					If ($_l_BaseCurrencyRow<0)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=CUR_at_CurrencyCodes{$_l_CUrrenciesIndex}; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5>=Current date:C33(*)-(365))
						
						If ($_l_isUsed>0)
							APPEND TO ARRAY:C911(CUR_at_CurrencyCodeName; CUR_at_CurrencyCodes{$_l_CUrrenciesIndex}+"("+CUR_at_CurrencyNames{$_l_CUrrenciesIndex}+")")
						End if 
					End if 
				End for 
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				
				CUR_at_CurrencyCodeName:=$_l_DefaultCurrencyRow
				LB_SetupListbox(->CUR_lb_CurrencyList; "CUR_t"; "CUR_L"; 1; ->Curr_al_Currency; ->CURR_abo_CurrencySelect; ->CUR_at_CurrencyCodeName)
				
				LB_SetColumnHeaders(->CUR_lb_CurrencyList; "CUR_L"; 1; ""; "Selected"; "Currency")
				LB_SetColumnWidths(->CUR_lb_CurrencyList; "CUR_t"; 1; 0; 21; 225)
				
				LB_SetEnterable(->CUR_lb_CurrencyList; False:C215; 0)
				LB_StyleSettings(->CUR_lb_CurrencyList; "Black"; 9; "CUR_t"; ->[DIARY:12])
				
				//INT_SetLongintCheckFormat (->Curr_al_Currency)
				
				
				FORM GOTO PAGE:C247(2)
				Cur_PageNUmber:=2
			: (ACC_t_CurrencyCode#<>SYS_t_BaseCurrency)
				ARRAY TEXT:C222(CUR_at_CurrencyCodes; 1)
				ARRAY TEXT:C222(CUR_at_CurrencyNames; 1)
				CUR_at_CurrencyCodes{1}:=ACC_t_CurrencyCode
				
				r0:=1
				r1:=0
				OBJECT SET TITLE:C194(r0; ACC_t_CurrencyCode)
				OBJECT SET TITLE:C194(r1; <>SYS_t_BaseCurrency)
				
				FORM GOTO PAGE:C247(1)
				Cur_PageNUmber:=1
				
				LB_SetupListbox(->CUR_lb_CurrencyList; "CUR_t"; "CUR_L"; 1; ->Curr_al_Currency; ->CUR_at_CurrencyCodeName)
				
				LB_SetColumnHeaders(->CUR_lb_CurrencyList; "CUR_L"; 1; "Selected"; "Currency")
				LB_SetColumnWidths(->CUR_lb_CurrencyList; "CUR_t"; 1; 21; 225)
				
				LB_SetEnterable(->CUR_lb_CurrencyList; False:C215; 0)
				LB_StyleSettings(->CUR_lb_CurrencyList; "Black"; 9; "CUR_t"; ->[DIARY:12])
				
		End case 
		
		INT_SetDialog
		SD2_SetDiaryPopup
	: (Form event code:C388=On Clicked:K2:4)
		
		
		Case of 
				
			: (bselectAll=1)
				
				For ($_l_CUrrenciesIndex; 1; Size of array:C274(Curr_al_Currency))
					Curr_al_Currency{$_l_CUrrenciesIndex}:=1
				End for 
				
			: (bDeselectAll=1)
				For ($_l_CUrrenciesIndex; 1; Size of array:C274(Curr_al_Currency))
					Curr_al_Currency{$_l_CUrrenciesIndex}:=0
				End for 
				
		End case 
		
	: (Form event code:C388=On Unload:K2:2) & (Not:C34(DB_bo_NoLoad))
		
		
		Case of 
			: (Cur_PageNUmber=2)
				If (CUR_at_CurrencyCodeName<=Size of array:C274(CUR_at_CurrencyCodes))
					CUR_t_OutputCurrency:=CUR_at_CurrencyCodes{CUR_at_CurrencyCodeName}
				Else 
					CUR_t_OutputCurrency:=<>SYS_t_BaseCurrency
				End if 
			Else 
				If (r0=1)
					CUR_t_OutputCurrency:=ACC_t_CurrencyCode
				Else 
					CUR_t_OutputCurrency:=<>SYS_t_BaseCurrency
				End if 
		End case 
	: (Form event code:C388=On Activate:K2:9)
		
		SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM:dCurrConv1"; $_t_oldMethodName)
