//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2011 16:53 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ApplicableAnalysis; 0)
	ARRAY TEXT:C222($_at_ApplicableLayers; 0)
	//ARRAY TEXT(ACC_at_ApplicableAnalDel;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerDel;0)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_AnalysisRow; $_l_Index)
	C_TEXT:C284($_t_AccountCodeOLD; $_t_oldMethodName; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_BankAccTO)
	C_TEXT:C284(DM_T_nomVatCashACC; DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_InLPA")
//Accounts_InLPA
If (False:C215)  //NG March 2004 this section set to false
	
Else   //NG March2004 replaced with this section writing from arrays
	If (False:C215)  //January 2007 replace swith a blob
		
	Else 
		READ WRITE:C146([ACCOUNTS_ANALYSES:157])
		SET BLOB SIZE:C606([ACCOUNTS:32]xAnalysisCodes:12; 0)
		VARIABLE TO BLOB:C532(ACC_at_ApplicableAnalyses; [ACCOUNTS:32]xAnalysisCodes:12; *)
		QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
		SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_ApplicableAnalysis)
		For ($_l_Index; 1; Size of array:C274($_at_ApplicableAnalysis))
			$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; $_at_ApplicableAnalysis{$_l_Index})
			If ($_l_AnalysisRow<0)
				QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2; *)
				QUERY:C277([ACCOUNTS_ANALYSES:157];  & ; [ACCOUNTS_ANALYSES:157]Analysis_Code:1=$_at_ApplicableAnalysis{$_l_Index})
				If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
					DELETE RECORD:C58([ACCOUNTS_ANALYSES:157])
				End if 
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274(ACC_at_ApplicableAnalyses))
			$_l_AnalysisRow:=Find in array:C230($_at_ApplicableAnalysis; ACC_at_ApplicableAnalyses{$_l_Index})
			If ($_l_AnalysisRow<0)
				CREATE RECORD:C68([ACCOUNTS_ANALYSES:157])
				[ACCOUNTS_ANALYSES:157]ID:2:=AA_GetNextID(->[ACCOUNTS_ANALYSES:157]ID:2)
				[ACCOUNTS_ANALYSES:157]Account_Code:3:=[ACCOUNTS:32]Account_Code:2
				[ACCOUNTS_ANALYSES:157]Analysis_Code:1:=ACC_at_ApplicableAnalyses{$_l_Index}
				DB_SaveRecord(->[ACCOUNTS_ANALYSES:157])
				
			End if 
		End for 
		If (Size of array:C274(ACC_at_ApplicableLayerDel)>0)
			
			For ($_l_Index; 1; Size of array:C274(ACC_at_ApplicableAnalDel))
				QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2; *)
				QUERY:C277([ACCOUNTS_ANALYSES:157];  & ; [ACCOUNTS_ANALYSES:157]Analysis_Code:1=ACC_at_ApplicableAnalDel{$_l_Index})
				If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
					DELETE RECORD:C58([ACCOUNTS_ANALYSES:157])
				End if 
			End for 
		End if 
		UNLOAD RECORD:C212([ACCOUNTS_ANALYSES:157])
		
	End if 
	
	//````
	If (False:C215)  //NG January 2007-replaceing the subtable with a blob so much simpler
	Else 
		SET BLOB SIZE:C606([ACCOUNTS:32]xLayerCodes:11; 0)
		VARIABLE TO BLOB:C532(ACC_at_ApplicableLayer; [ACCOUNTS:32]xLayerCodes:11; *)
		QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
		SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_ApplicableLayers)
		For ($_l_Index; 1; Size of array:C274($_at_ApplicableLayers))
			$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableLayer; $_at_ApplicableLayers{$_l_Index})
			If ($_l_AnalysisRow<0)
				QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2; *)
				QUERY:C277([ACCOUNTS_LAYERS:156];  & ; [ACCOUNTS_LAYERS:156]Layer_Code:1=$_at_ApplicableLayers{$_l_Index})
				If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
					DELETE RECORD:C58([ACCOUNTS_LAYERS:156])
				End if 
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274(ACC_at_ApplicableLayer))
			$_l_AnalysisRow:=Find in array:C230($_at_ApplicableLayers; ACC_at_ApplicableLayer{$_l_Index})
			If ($_l_AnalysisRow<0)
				CREATE RECORD:C68([ACCOUNTS_LAYERS:156])
				[ACCOUNTS_LAYERS:156]ID:2:=AA_GetNextID(->[ACCOUNTS_LAYERS:156]ID:2)
				[ACCOUNTS_LAYERS:156]Account_Code:3:=[ACCOUNTS:32]Account_Code:2
				[ACCOUNTS_LAYERS:156]Layer_Code:1:=ACC_at_ApplicableLayer{$_l_Index}
				DB_SaveRecord(->[ACCOUNTS_LAYERS:156])
				
			End if 
		End for 
		If (Size of array:C274(ACC_at_ApplicableLayerDel)>0)
			READ WRITE:C146([ACCOUNTS_LAYERS:156])
			For ($_l_Index; 1; Size of array:C274(ACC_at_ApplicableLayerDel))
				QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2; *)
				QUERY:C277([ACCOUNTS_LAYERS:156]Layer_Code:1=ACC_at_ApplicableLayerDel{$_l_Index})
				If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
					DELETE RECORD:C58([ACCOUNTS_LAYERS:156])
				End if 
			End for 
		End if 
	End if 
	
End if 

$_t_AccountCodeOLD:=Old:C35([ACCOUNTS:32]Account_Code:2)

If (($_t_AccountCodeOLD#"") & ($_t_AccountCodeOLD#[ACCOUNTS:32]Account_Code:2))
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Debit_Account:4=$_t_AccountCodeOLD; *)
	QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]Credit_Account:5=$_t_AccountCodeOLD; *)
	QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]C_Range_F:11=$_t_AccountCodeOLD; *)
	QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]C_Range_T:12=$_t_AccountCodeOLD; *)
	QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]D_Range_F:9=$_t_AccountCodeOLD; *)
	QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]D_Range_T:10=$_t_AccountCodeOLD)
	If (Records in selection:C76([TRANSACTION_TYPES:31])>0)
		READ WRITE:C146([TRANSACTION_TYPES:31])
		FIRST RECORD:C50([TRANSACTION_TYPES:31])
		While (Not:C34(End selection:C36([TRANSACTION_TYPES:31])))
			If (Not:C34(Locked:C147([TRANSACTION_TYPES:31])))
				If ([TRANSACTION_TYPES:31]Debit_Account:4=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]Debit_Account:4:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([TRANSACTION_TYPES:31]Credit_Account:5=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]Credit_Account:5:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([TRANSACTION_TYPES:31]C_Range_F:11=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]C_Range_F:11:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([TRANSACTION_TYPES:31]C_Range_T:12=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]C_Range_T:12:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([TRANSACTION_TYPES:31]D_Range_F:9=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]D_Range_F:9:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([TRANSACTION_TYPES:31]D_Range_T:10=$_t_AccountCodeOLD)
					[TRANSACTION_TYPES:31]D_Range_T:10:=[ACCOUNTS:32]Account_Code:2
				End if 
				DB_SaveRecord(->[TRANSACTION_TYPES:31])
			Else 
				Gen_Alert("NB: Transaction Type "+[TRANSACTION_TYPES:31]Transaction_Type_Code:1+" could not be updated - record in use")
			End if 
			NEXT RECORD:C51([TRANSACTION_TYPES:31])
		End while 
		UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
		READ ONLY:C145([TRANSACTION_TYPES:31])
	End if 
	
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Sales_Account:7=$_t_AccountCodeOLD; *)
	QUERY:C277([PRODUCTS:9];  | ; [PRODUCTS:9]Purchase_Account:13=$_t_AccountCodeOLD; *)
	QUERY:C277([PRODUCTS:9];  | ; [PRODUCTS:9]Stock_Account:42=$_t_AccountCodeOLD)
	If (Records in selection:C76([PRODUCTS:9])>0)
		READ WRITE:C146([PRODUCTS:9])
		FIRST RECORD:C50([PRODUCTS:9])
		While (Not:C34(End selection:C36([PRODUCTS:9])))
			If (Not:C34(Locked:C147([PRODUCTS:9])))
				If ([PRODUCTS:9]Sales_Account:7=$_t_AccountCodeOLD)
					[PRODUCTS:9]Sales_Account:7:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([PRODUCTS:9]Purchase_Account:13=$_t_AccountCodeOLD)
					[PRODUCTS:9]Purchase_Account:13:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([PRODUCTS:9]Stock_Account:42=$_t_AccountCodeOLD)
					[PRODUCTS:9]Stock_Account:42:=[ACCOUNTS:32]Account_Code:2
				End if 
				DB_SaveRecord(->[PRODUCTS:9])
				AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
			Else 
				Gen_Alert("NB: Product "+[PRODUCTS:9]Product_Code:1+" could not be updated - record in use")
			End if 
			NEXT RECORD:C51([PRODUCTS:9])
		End while 
		UNLOAD RECORD:C212([PRODUCTS:9])
		READ ONLY:C145([PRODUCTS:9])
	End if 
	
	QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Sales_Account:4=$_t_AccountCodeOLD; *)
	QUERY:C277([PRODUCT_GROUPS:10];  | ; [PRODUCT_GROUPS:10]Purchase_Account:5=$_t_AccountCodeOLD; *)
	QUERY:C277([PRODUCT_GROUPS:10];  | ; [PRODUCT_GROUPS:10]Stock_Account:8=$_t_AccountCodeOLD)
	If (Records in selection:C76([PRODUCT_GROUPS:10])>0)
		READ WRITE:C146([PRODUCT_GROUPS:10])
		FIRST RECORD:C50([PRODUCT_GROUPS:10])
		While (Not:C34(End selection:C36([PRODUCT_GROUPS:10])))
			If (Not:C34(Locked:C147([PRODUCT_GROUPS:10])))
				If ([PRODUCT_GROUPS:10]Sales_Account:4=$_t_AccountCodeOLD)
					[PRODUCT_GROUPS:10]Sales_Account:4:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([PRODUCT_GROUPS:10]Purchase_Account:5=$_t_AccountCodeOLD)
					[PRODUCT_GROUPS:10]Purchase_Account:5:=[ACCOUNTS:32]Account_Code:2
				End if 
				If ([PRODUCT_GROUPS:10]Stock_Account:8=$_t_AccountCodeOLD)
					[PRODUCT_GROUPS:10]Stock_Account:8:=[ACCOUNTS:32]Account_Code:2
				End if 
				DB_SaveRecord(->[PRODUCT_GROUPS:10])
			Else 
				Gen_Alert("NB: Product Group "+[PRODUCT_GROUPS:10]Group_Code:1+" could not be updated - record in use")
			End if 
			NEXT RECORD:C51([PRODUCT_GROUPS:10])
		End while 
		UNLOAD RECORD:C212([PRODUCT_GROUPS:10])
		READ ONLY:C145([PRODUCT_GROUPS:10])
	End if 
	
	If (Accounts_CheckPref($_t_AccountCodeOLD; False:C215)=False:C215)
		READ ONLY:C145([USER:15])
		$_bo_Unload:=(Records in selection:C76([USER:15])=0)
		If (<>SYS_l_LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
		End if 
		If (Locked:C147([USER:15]))
			Gen_Alert("The change to Preferences could not be saved - record in use")
		Else 
			Case of 
				: ($_t_AccountCodeOLD=DB_GetSalesLedgerBankFrom)
					DM_T_BankAccFrom:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetSalesLedgerBankTo)
					DM_T_BankAccTO:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerCashFromACC)
					DM_T_BankAccCashFrom:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerCashToACC)
					DM_T_BankAccCashTo:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerVatInputACC)
					DM_T_nomVatInput:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerVatoutputACC)
					DM_T_nomVatOutput:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerECcreditor)
					DM_T_nomVatECCreditor:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerCashvatACC)
					DM_T_nomVatCashACC:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerExchangeControlACC)
					DM_T_BankAccCurrencyExchange:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerExchangeACC)
					DM_T_BankAccCurrencyCharges:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerProfitACC)
					DM_T_BankAccBalanceProfitYTD:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerBroughtforwardACC)
					
					DM_T_BankAccBalanceProfitBFWD:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
				: ($_t_AccountCodeOLD=DB_GetLedgerProfitAdjACC)
					DM_T_BankAccBalanceAdjustments:=[ACCOUNTS:32]Account_Code:2
					DB_SaveLedgerPreferences
			End case 
			DB_SaveRecord(->[USER:15])
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([USER:15])
		End if 
		READ ONLY:C145([USER:15])
	End if 
End if 
ERR_MethodTrackerReturn("Accounts_InLPA"; $_t_oldMethodName)
