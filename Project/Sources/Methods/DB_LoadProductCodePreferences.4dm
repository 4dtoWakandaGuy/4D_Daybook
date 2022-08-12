//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_LoadProductCodePreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FromTransaction; $_bo_SavePreferences; $_bo_Unload; $1; DM_bo_CreditsSequence; DM_bo_nomAllowUnProc; DM_bo_nomenforceAnalysis; DM_bo_nomLedgersBatched; DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch; DM_bo_nomPostbyCompany)
	C_BOOLEAN:C305(DM_bo_nomTransinCalc; DM_bo_nomVatcash; DM_bo_ProductUseBrand; DM_bo_ProductUseGroupandBrand; DM_bo_SALESAllowInvoicecancel; DM_bo_SALESAllowInvoicenoPrint; DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESAllowPurchaseZero; DM_bo_SALESInvoiceAutoReceipt)
	C_DATE:C307(DM_D_SalesLEdgerStartDate)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_CodePrefID; $_l_offset; $_l_SavePreferenceProcess; $2; DB_l_CurrentOwnerRequest; DM_l_NomAgingStage1; DM_l_NomAgingStage2; DM_l_NomAgingStage3)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; $_t_OutputFolderPath; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom)
	C_TEXT:C284(DM_T_BankAccTo; DM_T_NomActualLayer; DM_T_NomDefaultCreditStage; DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax; DM_T_NomPurchaseTerms; DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSDepositReconcile; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay)
	C_TEXT:C284(DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC; DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_LoadProductCodePreferences")
$_bo_FromTransaction::=False:C215
If (Count parameters:C259>=2)
	$_bo_FromTransaction:=False:C215
End if 
If (Not:C34($_bo_FromTransaction=False:C215))
	While (Semaphore:C143("LockLedgerPreferences"))
		DelayTicks(2)
	End while 
End if 

If (Count parameters:C259>=3)
	DB_l_CurrentOwnerRequest:=$2
End if 

If (Count parameters:C259>=1)
	$_bo_SavePreferences:=$1
Else 
	
	$_bo_SavePreferences:=False:C215
End if 
If (Not:C34($_bo_SavePreferences))  //note to save they must be loaded!!
	If (Application type:C494=4D Server:K5:6)
		If (Is macOS:C1572)
			
			$_t_OutputFolderPath:=DB_GetDocumentPath
			
		Else 
			
			$_t_OutputFolderPath:=DB_GetDocumentPath
			
			
		End if 
		$_t_DocumentPath:=$_t_OutputFolderPath+"LoadProductCodePrefs.txt"
		
		If (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
			$_ti_DocumentRef:=Create document:C266($_t_DocumentPath; "TEXT")
		Else 
			$_ti_DocumentRef:=Append document:C265($_t_DocumentPath; "TEXT")
		End if 
		If (DB_l_CurrentOwnerRequest>0)
			//SEND PACKET($_ti_DocumentRef;String(DB_l_CurrentOwnerRequest))
			
		Else 
			//SEND PACKET($_ti_DocumentRef;String(<>PER_l_CurLoggedinDataOwnerID))
		End if 
		//Close DocUMENT($_ti_DocumentRef)
	End if 
	
	If (Application type:C494=4D Server:K5:6)
		If (DB_l_CurrentOwnerRequest>0)
			$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; DB_l_CurrentOwnerRequest)
		Else 
			$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	End if 
	READ ONLY:C145([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CodePrefID)
	If (Application type:C494=4D Server:K5:6)
		If (DB_l_CurrentOwnerRequest>0)
			SEND PACKET:C103($_ti_DocumentRef; String:C10(DB_l_CurrentOwnerRequest)+Char:C90(Tab:K15:37)+String:C10($_l_CodePrefID))
			
			
			
		Else 
			SEND PACKET:C103($_ti_DocumentRef; String:C10(<>PER_l_CurLoggedinDataOwnerID)+Char:C90(Tab:K15:37)+String:C10($_l_CodePrefID))
		End if 
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_ProductUseGroupandBrand)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_ProductUseBrand)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		If (In transaction:C397)
			//If we are in a transaction and creating this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Load Ledger Preferences"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Load Ledger Preferences"; False:C215; True:C214)
				End if 
			Else 
				$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Load Ledger Preferences"; False:C215; True:C214)
			End if 
			
			While (Process state:C330($_l_SavePreferenceProcess)>=0)
				DelayTicks(5)
			End while 
		Else 
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (Records in selection:C76([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				ALL RECORDS:C47([USER:15])
				
			End if 
			
			DM_bo_ProductUseGroupandBrand:=[USER:15]ProdGroupBrand:140
			DM_bo_ProductUseBrand:=False:C215
			
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_CodePrefID
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				
				[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			End if 
			VARIABLE TO BLOB:C532(DM_bo_ProductUseGroupandBrand; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_ProductUseBrand; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			
		End if 
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_ProductUseGroupandBrand; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_ProductUseBrand; $_l_offset)
		
	End if 
	
Else 
	If ($_bo_SavePreferences)
		If (In transaction:C397)
			//If we are in a transaction and creating or saving this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Save Ledger Preferences"; True:C214; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Save Ledger Preferences"; True:C214; True:C214)
				End if 
			Else 
				$_l_SavePreferenceProcess:=New process:C317("DB_LoadProductCodePreferences"; 128000; "Save Ledger Preferences"; True:C214; True:C214)
			End if 
			
			While (Process state:C330($_l_SavePreferenceProcess)>=0)
				DelayTicks(5)
			End while 
		Else 
			//note they must be loaded to save them
			
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				$_l_CodePrefID:=PREF_GetPreferenceID("Product Code Combination"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
			
			//QUERY([PREFERENCES];[PREFERENCES]IDNumber=$_l_CodePrefID)
			//TRACE
			//$_bo_OK:=Check_Locked (->[PREFERENCES];1)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CodePrefID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_CodePrefID
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
					Else 
						[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
					End if 
				Else 
					
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			End if 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_bo_ProductUseGroupandBrand; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_ProductUseBrand; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			
		End if 
	End if 
End if 
If (Not:C34($_bo_FromTransaction=False:C215))
	CLEAR SEMAPHORE:C144("LockLedgerPreferences")
End if 
ERR_MethodTrackerReturn("DB_LoadProductCodePreferences"; $_t_oldMethodName)