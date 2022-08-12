If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]SubItemDisplay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_RelationTypes;0)
	C_BOOLEAN:C305(<>ItementryOpen; $_bo_Close; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ButtonFunction; $_l_Cancel; $_l_event; $_l_OK; $_l_Retries; $_l_Row; ACC_l_BatchItemID; ACC_l_DisplayedItemNumber; ACC_l_ItemViewContext; ACC_l_MaxItemNumber; ACC_l_ParentProcessNumber)
	C_LONGINT:C283(ACC_l_Relations; ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; DB_l_ButtonClickedFunction; iCancel; iOK; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransAmountCredit; ACC_R_TransAmountDebit; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTaxAmtCredit; ACC_R_TRANSTAXAMTCREDITOLD; ACC_R_TransTaxAmtDebit; ACC_R_TRANSTAXAMTDEBITOLD; ACC_R_TransTotal; ACC_R_TransTotalCredit)
	C_REAL:C285(ACC_R_TransTotalDebit)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName; ACC_t_KEYCOMMENT; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode)
	C_TEXT:C284(ACC_t_TransCurrencyCodeCred; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred)
	C_TEXT:C284(ACC_t_TransTransCode; ACC_t_UKEC; ACC_t_UKECCred; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES].SubItemDisplay"; Form event code:C388)
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar(0; False:C215)
		OpenHelp(Table:C252(->[TRANSACTION_BATCHES:30]); "SubItemDisplay")
		
		WS_AutoscreenSize(5; 560; 600)
		INT_SetInput(Table:C252(->[TRANSACTION_BATCHES:30]); WIN_t_CurrentInputForm)
		//this form is 'sent' variables here we translate them for this screen
		ARRAY TEXT:C222(ACC_at_RelationTypes; 19)  // A POP OF TYYPES
		ACC_at_RelationTypes{1}:="Company"
		$_l_Row:=1
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)
			$_l_Row:=$_l_Row+1
			ACC_at_RelationTypes{$_l_Row}:="Sales Invoice"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)
			$_l_Row:=$_l_Row+1
			ACC_at_RelationTypes{$_l_Row}:="Purchase Invoice"
			$_l_Row:=$_l_Row+1
			ACC_at_RelationTypes{$_l_Row}:="Purchase Order"
		End if 
		$_l_Row:=$_l_Row+1
		ACC_at_RelationTypes{$_l_Row}:="Cheque"
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
			$_l_Row:=$_l_Row+1
			ACC_at_RelationTypes{$_l_Row}:="Job"
		End if 
		
		ARRAY TEXT:C222(ACC_at_RelationTypes; $_l_Row)
		//```````
		ACC_SUBITEMSETDISPLAY
		
		If (Is macOS:C1572)
			ACC_t_KEYCOMMENT:=Char:C90(240)+"r"
		Else 
			ACC_t_KEYCOMMENT:="ctrl"+"r"
		End if 
		<>ItementryOpen:=True:C214
		
		//: ($_l_event=On Timer )
		//INT_SetInput (Table(->[TRANS IN]);WIN_t_CurrentInputForm)
		//SET TIMER(0)
		BRING TO FRONT:C326(Current process:C322)
		OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
		
	: ($_l_event=On Outside Call:K2:11)
		//BRING TO FRONT(Current process)
		//This will pass most of the calls to the parent process-except add which will behave like enter
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus"))
				DB_l_ButtonClickedFunction:=0
				ACC_BatchItemSendtoBatch
				//
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus"))
				DB_l_ButtonClickedFunction:=0
				Case of 
						
					: (ACC_l_ItemViewContext=1)  //add entry
						//--just clear
						
					: (ACC_l_ItemViewContext=3)  //edit entry
						//delete batch item
						//here we will call the parent process to tell it what to delete
						//refresh the viewin that process and clear this process view
						GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
						$_l_Retries:=0
						While (DB_l_ButtonClickedFunction>0)
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
							GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
							
						End while 
						
						SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_GetButtonFunction("DeleteBatchItem"))
						POST OUTSIDE CALL:C329(ACC_l_ParentProcessNumber)
						GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
						$_l_Retries:=0
						While (DB_l_ButtonClickedFunction>0)
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
							GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
							
						End while 
						DB_l_ButtonClickedFunction:=0
						
				End case 
				ACC_R_TransAmount:=0
				ACC_l_TransBatchItemID:=0
				ACC_t_TransChequeNo:=""
				ACC_t_TransCoCode:=""
				ACC_t_TransCreditAcc:=""
				ACC_t_TransCreditIO:=""
				ACC_l_TransCreditID:=0
				ACC_t_TransCurrencyCode:=""
				ACC_t_TransDebitAcc:=""
				ACC_t_TransDebitIO:=""
				ACC_l_TransDebitID:=0
				ACC_T_TransDescription:=""
				ACC_t_TransEventCode:=""
				ACC_t_TransInvoiceNo:=""
				ACC_t_TransJobCode:=""
				//ACC_t_TransLayerCode:=""
				//ACC_t_TransPeriodCode:=""
				ACC_t_TransPurchinvno:=""
				ACC_t_TransPurchCode:=""
				ACC_R_TransSecondAmt:=0
				ACC_R_TransTaxAmt:=0
				ACC_t_TransTaxCode:=""
				ACC_R_TransTotal:=0
				ACC_t_TransTransCode:=""
				//ACC_D_TransDate:=
				ACC_t_UKEC:=""
				ACC_t_CURRENCYNAME:=""
				ACC_t_DebitAccountName:=""
				ACC_t_CreditAccountName:=""
				ACC_t_CompanyName:=""
				//ACC_t_AnalysisNames:=
				//ACC_t_LayerName:=
				ACC_l_BatchItemID:=0
				ACC_R_TransAmountDebit:=0
				ACC_R_TransTaxAmtDebit:=0
				ACC_R_TransTotalDebit:=0
				ACC_t_TransCurrencyCodeCred:=""
				ACC_R_TransAmountCredit:=0
				ACC_t_TransTaxCodeCred:=""
				ACC_t_UKECCred:=""
				ACC_R_TransTaxAmtCredit:=0
				ACC_R_TransTotalCredit:=0
				ACC_SUBITEMSETDISPLAY
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				//`Well duh we are open!!
				
			: (((DB_l_ButtonClickedFunction#801)) | (iOK=1) | (iCancel=1))
				$_l_OK:=iOK
				$_l_Cancel:=ICancel
				
				$_l_ButtonFunction:=DB_l_ButtonClickedFunction
				DB_l_ButtonClickedFunction:=0
				If (ACC_l_ItemViewContext#2)
					ACC_BatchItemSendtoBatch($_l_ButtonFunction)
					GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
					$_l_Retries:=0
					While (DB_l_ButtonClickedFunction>0)
						$_l_Retries:=$_l_Retries+1
						DelayTicks($_l_Retries*2)
						GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
						
					End while 
					
				Else 
					
				End if 
				
				//DB_l_ButtonClickedFunction:=$_l_ButtonFunction
				If ($_l_ButtonFunction=0)
					Case of 
						: ($_l_OK=1)
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
						: ($_l_Cancel=1)
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
							
					End case 
					
				End if 
				SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; $_l_ButtonFunction)
				POST OUTSIDE CALL:C329(ACC_l_ParentProcessNumber)
				$_bo_Close:=($_l_ButtonFunction=DB_GetButtonFunction("OK")) | ($_l_ButtonFunction=DB_GetButtonFunction("Cancel")) | ($_l_ButtonFunction=DB_GetButtonFunction("Next")) | ($_l_ButtonFunction=DB_GetButtonFunction("Previous"))
				
				
				If ($_bo_Close)
					CANCEL:C270
				End if 
			Else 
				If (DB_l_ButtonClickedFunction>0)
					Case of 
						: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("ReceiveBatchItem"))
							
							//display an item
							BRING TO FRONT:C326(Current process:C322)
							
							ACC_SUBITEMSETDISPLAY
							
					End case 
				End if 
				DB_l_ButtonClickedFunction:=0
		End case 
End case 
ERR_MethodTrackerReturn("FM:SubItemDisplay"; $_t_oldMethodName)
