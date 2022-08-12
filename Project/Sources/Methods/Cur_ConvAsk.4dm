//%attributes = {}
If (False:C215)
	//Project Method Name:      Cur_ConvAsk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(Curr_al_Currency;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_OutputCurrencies; 0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_InputCUrrencies;0)
	C_BOOLEAN:C305($_bo_Continue; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_Index; $_l_OK; $_l_WindowReferenceRow; $4; ch0; ch1; ch2; r0; r1; WIN_l_CurrentWinRef)
	C_POINTER:C301($3)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $0; $1; $2; $5; ACC_t_CurrencyCode; CUR_t_OutputCurrency; vCallCode; vType_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cur_ConvAsk")

CUR_t_OutputCurrency:=$2

If (DB_GetModuleSettingByNUM(Module_MultiCurrency)>1)
	
	If (Character code:C91(ACC_t_CurrencyCode)=64)
		ACC_t_CurrencyCode:=""
	End if 
	vCallCode:=""
	vType_:="*Any*"
	If (ACC_t_CurrencyCode#<>SYS_t_BaseCurrency)
		ARRAY TEXT:C222(CUR_at_InputCUrrencies; 0)
		
		If (Count parameters:C259>=3)
			COPY ARRAY:C226($3->; CUR_at_InputCUrrencies)
		End if 
		Open_AnyTypeWindow(218; 467; 5; "Currency Conversion Options")
		DIALOG:C40([ACCOUNT_BALANCES:34]; "dCurrConv1")
		AD_SavePrefs
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		$_bo_Continue:=False:C215
		ARRAY TEXT:C222($_at_OutputCurrencies; 0)
		If ($_l_OK=1)
			If (Size of array:C274(Curr_al_Currency)>0)
				For ($_l_Index; 1; Size of array:C274(Curr_al_Currency))
					
					If (Curr_al_Currency{$_l_Index}=1)
						APPEND TO ARRAY:C911($_at_OutputCurrencies; CUR_at_CurrencyCodes{$_l_Index})
					End if 
					
				End for 
				$_bo_Continue:=True:C214
			Else 
				
				APPEND TO ARRAY:C911($_at_OutputCurrencies; ACC_t_CurrencyCode)
				$_bo_Continue:=True:C214
			End if 
		Else 
			CUR_t_OutputCurrency:=""
		End if 
	Else 
		APPEND TO ARRAY:C911($_at_OutputCurrencies; ACC_t_CurrencyCode)
		$_bo_Continue:=True:C214
	End if 
	If (CUR_t_OutputCurrency#"")
		If (Count parameters:C259<4)
			CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "SelectedCurrAccbal")
			CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "jTempset")
		Else 
			Case of 
				: ($4=Table:C252(->[ACCOUNT_BALANCES:34]))
					CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "SelectedCurrAccbal")
					CREATE EMPTY SET:C140([ACCOUNT_BALANCES:34]; "jTempset")
				: ($4=Table:C252(->[INVOICES:39]))
					CREATE EMPTY SET:C140([INVOICES:39]; "SelectedCurrAccbal")
					CREATE EMPTY SET:C140([INVOICES:39]; "jTempset")
				: ($4=Table:C252(->[PURCHASE_INVOICES:37]))
					CREATE EMPTY SET:C140([PURCHASE_INVOICES:37]; "SelectedCurrAccbal")
					CREATE EMPTY SET:C140([PURCHASE_INVOICES:37]; "jTempset")
			End case 
		End if 
		
		For ($_l_Index; 1; Size of array:C274($_at_OutputCurrencies))
			If (Count parameters:C259<4)
				USE SET:C118("Master")
				If ($_at_OutputCurrencies{$_l_Index}=<>SYS_t_BaseCurrency)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_at_OutputCurrencies{$_l_Index}; *)
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
				Else 
					QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_at_OutputCurrencies{$_l_Index})
				End if 
				
				If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
					CREATE SET:C116([ACCOUNT_BALANCES:34]; "jTempset")
					UNION:C120("jTempset"; "SelectedCurrAccbal"; "SelectedCurrAccbal")
				End if 
			Else 
				USE SET:C118($5)
				Case of 
					: ($4=Table:C252(->[INVOICES:39]))
						If ($_at_OutputCurrencies{$_l_Index}=<>SYS_t_BaseCurrency)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_OutputCurrencies{$_l_Index}; *)
							QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]Currency_Code:27="")
						Else 
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Currency_Code:27=$_at_OutputCurrencies{$_l_Index})
						End if 
						If (Records in selection:C76([INVOICES:39])>0)
							CREATE SET:C116([INVOICES:39]; "jTempset")
							UNION:C120("jTempset"; "SelectedCurrAccbal"; "SelectedCurrAccbal")
						End if 
					: ($4=Table:C252(->[PURCHASE_INVOICES:37]))
						If ($_at_OutputCurrencies{$_l_Index}=<>SYS_t_BaseCurrency)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=$_at_OutputCurrencies{$_l_Index}; *)
							QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Currency_Code:23="")
						Else 
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=$_at_OutputCurrencies{$_l_Index})
						End if 
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							CREATE SET:C116([PURCHASE_INVOICES:37]; "jTempset")
							UNION:C120("jTempset"; "SelectedCurrAccbal"; "SelectedCurrAccbal")
						End if 
						
				End case 
				
			End if 
			
			
		End for 
		COPY ARRAY:C226($_at_OutputCurrencies; $3->)
		
		If (Count parameters:C259<4)
			COPY SET:C600("SelectedCurrAccbal"; "Master")
		Else 
			COPY SET:C600("SelectedCurrAccbal"; $5)
		End if 
	End if 
	
Else 
	r0:=1
	r1:=0
	ch0:=1
	ch1:=0
	ch2:=0
	vCallCode:=""
End if 

$0:=CUR_t_OutputCurrency

CLEAR SET:C117("jTempset")
CLEAR SET:C117("SelectedCurrAccbal")
ERR_MethodTrackerReturn("Cur_ConvAsk"; $_t_oldMethodName)