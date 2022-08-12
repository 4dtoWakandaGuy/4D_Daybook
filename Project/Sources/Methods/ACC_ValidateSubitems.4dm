//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ValidateSubitems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/03/2010 16:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_BatchTransTypesCode;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesname;0)
	//ARRAY TEXT(ACC_at_CreditAcc;0)
	//ARRAY TEXT(ACC_at_DebitAcc;0)
	//ARRAY TEXT(ACC_at_IOValues;0)
	//ARRAY TEXT(ACC_at_IOValuesCred;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	//ARRAY TEXT(ACC_at_TAnalysisCode;0)
	//ARRAY TEXT(ACC_at_TCurrencyCode;0)
	//ARRAY TEXT(ACC_at_TLayerCode;0)
	//ARRAY TEXT(ACC_at_TTaxCode;0)
	C_BOOLEAN:C305(<>PersAnOver; $_bo_Applicable; $_bo_Create; $_bo_Edit; $_bo_NewCollection; $_bo_NoWildCard; $_bo_Sel; $_bo_Selected; $3; ACC_bo_Autofill)
	C_COLLECTION:C1488($_col_SubPeriodCodes; $_col_window)
	C_DATE:C307(ACC_D_TransDate; vDate)
	C_LONGINT:C283($_l_BatchTypeRow; $_l_Bottom; $_l_FieldNumber; $_l_Index; $_l_Left; $_l_OBottom; $_l_OLeft; $_l_OLeftTop; $_l_ORight; $_l_OTop; $_l_PeriodID)
	C_LONGINT:C283($_l_RecordsCount; $_l_Reduce; $_l_Right; $_l_SelEnd; $_l_SelStart; $_l_TableNumber; $_l_Top; $_l_ViewinContext; $_l_WildCardPosition; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; $_l_WldcardPosition; $4; $5; $6; $7; ACC_l_ItemViewContext; ACC_l_NextColumn; ACC_l_selectedPeriod)
	C_OBJECT:C1216($_obj_Account; $_obj_Accounts; $_obj_Analyses; $_obj_Analysis; $_obj_Layer; $_obj_Layers; $_obj_PeriodCode; $_obj_PeriodCodes; $_obj_Popup; $_obj_TransactionType; $_obj_TransactionTypes)
	C_OBJECT:C1216($_obj_Validation; $_obj_ValidationProperties)
	C_POINTER:C301($_Ptr_SearchVar; $1; $2)
	C_REAL:C285($_r_TaxAmount; $_r_TaxRate; $_r_TransAmount; $_r_TransTaxmount; ACC_R_TransAmount; ACC_R_TransAmountCredit; ACC_R_TransAmountDebit; ACC_R_TransAmountOLD; ACC_R_TransTaxAmt; ACC_R_TransTaxAmtCredit; ACC_R_TransTaxAmtDebit)
	C_REAL:C285(ACC_R_TransTaxAmtDebitOLD; ACC_R_TransTotal; ACC_R_TransTotalCredit; ACC_R_TransTotalDebit; vTot; vTot2)
	C_TEXT:C284($_t_FieldName; $_t_ObjectName; $_t_oldMethodName; $_t_VariableName; $_t_WildCard; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCodeOLD; ACC_t_CreditAccountName; ACC_t_DebitAccountName; ACC_t_LayerName)
	C_TEXT:C284(ACC_t_TestName; ACC_t_TransCreditAcc; ACC_t_TransCreditAccOLD; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeCred; ACC_t_TransCurrencyCodeOLD; ACC_t_TransDebitAcc; ACC_t_TransDebitAccOLD; ACC_t_TransDebitIO; ACC_t_TransDebitIOOLD)
	C_TEXT:C284(ACC_T_TransDescription; ACC_t_TransLayerCode; ACC_t_TranslayerCodeOLD; ACC_t_TransPeriodCode; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred; ACC_t_TransTaxCodeOLD; ACC_t_TransTransCode; ACC_t_TransTransCodeOLD; ACC_t_UKEC; ACC_t_UKECCred)
	C_TEXT:C284(ACC_t_UKECOLD; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; TRANSNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ValidateSubitems")


If (Count parameters:C259>=2)
	$_obj_ValidationProperties:=New object:C1471
	If (False:C215)  //this is the new code-not live till it is tested fully.
		//$_obj_ValidationProperties:=$1
		$_t_ObjectName:=""
		
		If (Not:C34($_obj_ValidationProperties.ObjectName=Null:C1517))
			$_t_ObjectName:=$_obj_ValidationProperties.ObjectName
			$_Ptr_SearchVar:=OBJECT Get pointer:C1124(Object named:K67:5; $_obj_ValidationProperties.ObjectName)
		End if 
		If (Not:C34($_obj_ValidationProperties.NoWildCard=Null:C1517))
			$_bo_NoWildCard:=$_obj_ValidationProperties.NoWildCard
		Else 
			$_bo_NoWildCard:=False:C215
		End if 
		
		If (Not:C34($_obj_ValidationProperties.WindowValues=Null:C1517))
			
			$_col_window:=$_obj_ValidationProperties.WindowValues  //this is a collection either 2 or 4 parameters left top right bottom
			Case of 
				: ($_col_window.length=2)
					$_l_Left:=$_col_window[0]
					$_l_Right:=$_l_Left
					$_l_Top:=$_col_window[1]
					$_l_Bottom:=$_l_Top
					
					
				: ($_col_window.length=4)
					$_l_Left:=$_col_window[0]
					$_l_Right:=$_col_window[1]
					$_l_Top:=$_col_window[2]
					$_l_Bottom:=$_col_window[3]
				Else 
					If ($_t_ObjectName#"")
						OBJECT GET COORDINATES:C663(*; $_t_ObjectName; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
					End if 
			End case 
		Else 
			If ($_t_ObjectName#"")
				OBJECT GET COORDINATES:C663(*; $_t_ObjectName; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
				$_col_window.push($_l_Left)
				$_col_window.push($_l_Top)
				$_col_window.push($_l_Right)
				$_col_window.push($_l_Bottom)
			End if 
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_OLeft:=$_l_WindowLeft+$_l_Left
		$_l_OTop:=$_l_windowTop+$_l_Top
		$_l_ORight:=$_l_WindowLeft+$_l_Left
		$_l_OBottom:=($_l_windowTop+$_l_Top)
		
		
		If (Not:C34($_obj_ValidationProperties.ViewInContext=Null:C1517))
			$_l_ViewinContext:=$_obj_ValidationProperties.ViewInContext
		Else 
			$_l_ViewinContext:=ACC_l_ItemViewContext
		End if 
		$_t_FieldName:="'"
		If (Not:C34($_obj_ValidationProperties.DSattribute=Null:C1517))
			$_t_FieldName:=$_obj_ValidationProperties.DSattribute
		End if 
		If ($_bo_NoWildCard)
			$_t_WildCard:=""
		Else 
			$_t_WildCard:="@"
		End if 
		Case of 
			: ($_t_FieldName="Period_Code")
				$_obj_PeriodCodes:=ds:C1482.PERIODS.query("Period_Code =:1"; $_Ptr_SearchVar->+$_t_WildCard)
				If ($_obj_PeriodCodes.length=1)
					$_Ptr_SearchVar->:=$_obj_PeriodCodes[0].Period_Code
				Else 
					
					$_obj_PeriodCodes:=$_obj_PeriodCodes.orderBy("Period_Code asc")
					
					If ($_obj_PeriodCodes.length<255)
						$_obj_Popup:=New object:C1471("CollectionList"; $_obj_PeriodCodes.Period_Code; "WindowTitle"; "Select Period"; "OKButtontext"; "Select"; "CancelButtonText"; "Cancel"; "WindowValues"; New collection:C1472($_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom))
						Gen_ChoicePopUpByCollection($_obj_Popup)
						If (Not:C34($_obj_Popup.ItemName=Null:C1517))
							$_Ptr_SearchVar->:=$_obj_Popup.ItemName
						End if 
					Else 
						//this is just to avoid a ridiculous drop down!!
						$_l_Index:=0
						$_bo_NewCollection:=True:C214
						$_bo_Selected:=False:C215
						For each ($_obj_PeriodCode; $_obj_PeriodCodes) Until ($_bo_Selected)
							
							
							
							
							$_l_Index:=$_l_Index+1
							If ($_bo_NewCollection)
								$_col_SubPeriodCodes:=New collection:C1472
								$_bo_NewCollection:=False:C215
							End if 
							$_col_SubPeriodCodes.push($_obj_PeriodCode)
							If ($_l_Index=$_obj_PeriodCodes.length) | ($_l_Index=200)
								$_bo_NewCollection:=True:C214
								If ($_l_Index<$_obj_PeriodCodes.length)
									$_col_SubPeriodCodes.push("More...")
								End if 
								$_obj_Popup:=New object:C1471("CollectionList"; $_col_SubPeriodCodes; "WindowTitle"; "Select Period"; "OKButtontext"; "Select"; "CancelButtonText"; "Cancel"; "WindowValues"; New collection:C1472($_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom))
								Gen_ChoicePopUpByCollection($_obj_Popup)
								If (Not:C34($_obj_Popup.ItemName=Null:C1517))
									If ($_obj_Popup.ItemName#"More...")
										$_bo_Selected:=True:C214
										$_Ptr_SearchVar->:=$_obj_Popup.ItemName
									End if 
								End if 
							End if 
							
						End for each 
					End if 
				End if 
			: ($_t_FieldName="Transaction_Type_Code")
				$_l_WldcardPosition:=Position:C15(Char:C90(64); $_Ptr_SearchVar->)
				If ($_l_WldcardPosition=0) & (Not:C34($_bo_NoWildCard))
					//i don;t think we ever needed to do this because i am pretty certain that checckMinor already added a missing wildcard on
				End if 
				//$_obj_ValidationProperties.ObjectName-i can confirm that is the case so i am not sure how the no wildcard would have operated previously
				CheckMinorByObject(New object:C1471("ObjectName"; $_obj_ValidationProperties.ObjectName; "TRANSACTION_TYPES"; New collection:C1472("Transaction_Type_Code"; "Transaction_Type_Name")))
			: ($_t_FieldName="Transaction_Date")
				If (Not:C34($_Ptr_SearchVar->=!00-00-00!))
					$_l_PeriodID:=Check_Period($_Ptr_SearchVar->)
					ACC_t_TransPeriodCode:=[PERIODS:33]Period_Code:1
					Trans_SubLPPer(ACC_t_TransLayerCode; ->ACC_t_TransPeriodCode; $_Ptr_SearchVar)
				End if 
			: ($_t_FieldName="Description")
				$_Ptr_SearchVar->:=Uppers3($_Ptr_SearchVar->)
			: ($_t_FieldName="Analysis_Code")
				Check_Analysis($_Ptr_SearchVar; ""; ->ACC_t_TransDebitAcc; ->ACC_t_TransCreditAcc; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
				If ($_Ptr_SearchVar->#"")
					$_obj_Analysis:=ds:C1482.ANALYSES.query("Analysis_Code =:1"; $_Ptr_SearchVar->)
					If ($_obj_Analysis.length>0)
						$_obj_Analyses:=$_obj_Analysis[0]
						ACC_t_AnalysisNames:=$_obj_Analyses.Analysis_Name
					End if 
				End if 
			: ($_t_FieldName="Layer_Code")
				$_bo_Edit:=Trans_SubLPLayer($_Ptr_SearchVar; ->ACC_t_TransDebitAcc; -2; ->ACC_t_TransCreditAcc; ACC_t_TransTransCode; ->ACC_t_TransPeriodCode; ->ACC_D_TransDate)
				If (Not:C34($_bo_Edit))
					
					$_Ptr_SearchVar->:=ACC_t_TranslayerCodeOLD
				End if 
				$_obj_Layers:=ds:C1482.LAYERS.query("Layer_Code =:1"; $_Ptr_SearchVar->)
				If ($_obj_Layers.length>0)
					$_obj_Layer:=$_obj_Layers[0]
					ACC_t_LayerName:=$_obj_Layer.PLayer_Name
				Else 
					ACC_t_LayerName:=""
					GOTO OBJECT:C206(*; "$_t_ObjectName")
					
				End if 
			: ($_t_FieldName="Debit_IO")
				Trans_SubLPIOx($_Ptr_SearchVar; ->ACC_t_TransDebitAcc; ACC_t_TransDebitIOOLD)
				//here reset the amounts
				If ($_Ptr_SearchVar->#ACC_t_TransDebitIOOLD)
					//the debit and the credit are defined.
					//as we have modified the debit IO recalc the credit IO
					$_r_TransAmount:=ACC_R_TransAmount
					$_r_TransTaxmount:=ACC_R_TransTaxAmt
					Case of 
						: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
								ACC_R_TransTaxAmtCredit:=0
								ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
							End if 
							
						: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								ACC_R_TransTaxAmtDebit:=0
								ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
							End if 
							
						Else 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							
					End case 
					
					
				End if 
			: ($_t_FieldName="Debit_Account")
				CheckMinorByObject(New object:C1471("ObjectName"; $_obj_ValidationProperties.ObjectName; "ACCOUNTS"; New collection:C1472("Account_Code"; "Account_Name")))
				If ($_Ptr_SearchVar->#"")
					$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
					If ($_obj_Accounts.length>0)
						$_obj_Account:=$_obj_Accounts[0]
						If ($_obj_Account.No_NL_Postings)
							If ((DB_t_CurrentFormUsage3#"Pch") | (ACC_t_TransTransCode#DB_GetLedgerTRANSINVpost) | (ACC_t_TransTransCode#DB_GetLedgerTRANSRECpost))
								Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
								$_Ptr_SearchVar->:=ACC_t_TransDebitAccOLD
								If ($_Ptr_SearchVar->#"")
									$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
									If ($_obj_Accounts.length>0)
										$_obj_Account:=$_obj_Accounts[0]
										//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
										ACC_t_TransDebitIO:=$_obj_Account.IO
										ACC_t_DebitAccountName:=$_obj_Account.Account_Name
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
								
							Else 
								ACC_t_TransDebitIO:=$_obj_Account.IO
								ACC_t_DebitAccountName:=$_obj_Account.Account_Name
							End if 
						Else 
							ACC_t_TransDebitIO:=$_obj_Account.IO
							ACC_t_DebitAccountName:=$_obj_Account.Account_Name
						End if 
					Else 
						ACC_t_TransDebitIO:=""
						ACC_t_DebitAccountName:=""
					End if 
					ACC_l_NextColumn:=0
					$_bo_Applicable:=True:C214
					$_obj_TransactionTypes:=ds:C1482.TRANSACTION_TYPES.query("Transaction_Type_Code =:1"; ACC_t_TransTransCode)
					If ($_obj_TransactionTypes.length>0)
						$_obj_TransactionType:=$_obj_TransactionTypes[0]
						//QUERY([TRANSACTION_TYPES];[TRANSACTION_TYPES]Transaction_Type_Code=ACC_t_TransTransCode)
						If (ACC_t_DebitAccountName#"")
							$_bo_Applicable:=Trans_SubLPLayerCode($_Ptr_SearchVar; ->ACC_t_TransLayerCode; -1; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with layer+"+ACC_t_TransLayerCode; "OK")
								
								
								$_Ptr_SearchVar->:=ACC_t_TransDebitAccOLD
								If ($_Ptr_SearchVar->#"")
									$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
									If ($_obj_Accounts.length>0)
										$_obj_Account:=$_obj_Accounts[0]
										//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
										ACC_t_TransDebitIO:=$_obj_Account.IO
										ACC_t_DebitAccountName:=$_obj_Account.Account_Name
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
								
								
							End if 
							
						End if 
						If ($_Ptr_SearchVar->#"")
							$_bo_Applicable:=Check_AnalAcc($_Ptr_SearchVar; ->ACC_t_BatchItemAnalysisCode; -1; True:C214; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with analysis+"+ACC_t_BatchItemAnalysisCode)
								$_Ptr_SearchVar->:=ACC_t_TransDebitAccOLD
								If ($_Ptr_SearchVar->#"")
									$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
									If ($_obj_Accounts.length>0)
										$_obj_Account:=$_obj_Accounts[0]
										//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
										ACC_t_TransDebitIO:=$_obj_Account.IO
										ACC_t_DebitAccountName:=$_obj_Account.Account_Name
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
								
							End if 
						End if 
						
						If (($_Ptr_SearchVar->#"") & (($_obj_TransactionType.D_Range_F#"") | ($_obj_TransactionType.D_Range_T#"")))
							If (($_Ptr_SearchVar-><$_obj_TransactionType.D_Range_F) | ($_Ptr_SearchVar->>$_obj_TransactionType.D_Range_T))
								If ($_obj_TransactionType.D_Enforce)
									Gen_Alert("This Account does not fall within the Transaction Type's required range of Debit"+" Accounts."; "Try again")
									$_bo_Applicable:=False:C215
									$_Ptr_SearchVar->:=$_obj_TransactionType.Debit_Account
									$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
									
									If ($_obj_Accounts.length>0)
										$_obj_Account:=$_obj_Accounts[0]
										//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
										ACC_t_TransDebitIO:=$_obj_Account.IO
										ACC_t_DebitAccountName:=$_obj_Account.Account_Name
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
									
								Else 
									Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Debit"+" Accounts."; "Allow"; "Try again")
									If (OK=0)
										$_bo_Applicable:=False:C215
										$_Ptr_SearchVar->:=$_obj_TransactionType.Debit_Account
										$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
										
										If ($_obj_Accounts.length>0)
											$_obj_Account:=$_obj_Accounts[0]
											//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
											ACC_t_TransDebitIO:=$_obj_Account.IO
											ACC_t_DebitAccountName:=$_obj_Account.Account_Name
										Else 
											ACC_t_TransDebitIO:=""
											ACC_t_DebitAccountName:=""
										End if 
										
									End if 
								End if 
							End if 
						End if 
					End if 
					If ($_bo_Applicable)
						$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
						
						If ($_obj_Accounts.length>0)
							$_obj_Account:=$_obj_Accounts[0]
							//QUERY([ACCOUNTS];[ACCOUNTS]Account_Code=$2->)
							ACC_t_TransDebitIO:=$_obj_Account.IO
							ACC_t_DebitAccountName:=$_obj_Account.Account_Name
						Else 
							ACC_t_TransDebitIO:=""
							ACC_t_DebitAccountName:=""
						End if 
						
						If (ACC_t_TransDebitIO="")
							ACC_t_TransDebitIO:="N"
						End if 
						If ((($_Ptr_SearchVar->="") | (ACC_t_TransCreditAcc="")) & (ACC_R_TransTotal>0))
							vTot:=1
							vTot2:=1
						End if 
					End if 
					If ($_Ptr_SearchVar->#"")
						$_obj_Accounts:=ds:C1482.ACCOUNTS.query("Account_Code =:1"; $_Ptr_SearchVar->)
						If ($_obj_Accounts.length>0)
							$_obj_Account:=$_obj_Accounts[0]
							If ($_obj_Account.No_NL_Postings)
								If ((DB_t_CurrentFormUsage3#"Pch") | (ACC_t_TransTransCode#DB_GetLedgerTRANSINVpost) | (ACC_t_TransTransCode#DB_GetLedgerTRANSRECpost))
									Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
									$2->:=ACC_t_TransDebitAccOLD
									If ($2->#"")
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
										ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
										ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
									
								Else 
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								End if 
							Else 
								ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
								ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
							End if 
						Else 
							ACC_t_TransDebitIO:=""
							ACC_t_DebitAccountName:=""
						End if 
						ACC_l_NextColumn:=0
						$_bo_Applicable:=True:C214
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=ACC_t_TransTransCode)
						If (ACC_t_DebitAccountName#"")
							$_bo_Applicable:=Trans_SubLPLayerCode($2; ->ACC_t_TransLayerCode; -1; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with layer+"+ACC_t_TransLayerCode; "OK")
								
								
								$2->:=ACC_t_TransDebitAccOLD
								If ($2->#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
							End if 
							
						End if 
						If ($2->#"")
							$_bo_Applicable:=Check_AnalAcc($2; ->ACC_t_BatchItemAnalysisCode; -1; True:C214; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with analysis+"+ACC_t_BatchItemAnalysisCode)
								$2->:=ACC_t_TransDebitAccOLD
								If ($2->#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
							End if 
						End if 
						
						If (($2->#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
							If (($2-><[TRANSACTION_TYPES:31]D_Range_F:9) | ($2->>[TRANSACTION_TYPES:31]D_Range_T:10))
								If ([TRANSACTION_TYPES:31]D_Enforce:13)
									Gen_Alert("This Account does not fall within the Transaction Type's required range of Debit"+" Accounts."; "Try again")
									$_bo_Applicable:=False:C215
									$2->:=[TRANSACTION_TYPES:31]Debit_Account:4
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[TRANSACTION_TYPES:31]Debit_Account:4)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Debit"+" Accounts."; "Allow"; "Try again")
									If (OK=0)
										$_bo_Applicable:=False:C215
										$2->:=[TRANSACTION_TYPES:31]Debit_Account:4
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[TRANSACTION_TYPES:31]Debit_Account:4)
										ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
										ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
									End if 
								End if 
							End if 
						End if 
						If ($_bo_Applicable)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
							ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
							ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
							If (ACC_t_TransDebitIO="")
								ACC_t_TransDebitIO:="N"
							End if 
							If ((($2->="") | (ACC_t_TransCreditAcc="")) & (ACC_R_TransTotal>0))
								vTot:=1
								vTot2:=1
							End if 
						End if 
						
						
						//End case
						//If (Count parameters>=3)  //if the value was picked from a list should only check exact value
						//$_bo_NoWildCard:=$3
						//Else
						//$_bo_NoWildCard:=False
						//End if
					End if 
					
				End if 
		End case 
	End if 
	ACC_bo_Autofill:=True:C214
	
	If (ACC_l_ItemViewContext#2)
		If (Count parameters:C259>=2)
			Case of 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Period_Code:11))
					If ($_bo_NoWildCard)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$2->)
					Else 
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$2->+"@")
					End if 
					If (Records in selection:C76([PERIODS:33])=1)
						$2->:=[PERIODS:33]Period_Code:1
					Else 
						ARRAY TEXT:C222(ACC_at_PeriodCodes; 0)
						ACC_l_selectedPeriod:=0
						If (Records in selection:C76([PERIODS:33])<255)
							SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes)
							SORT ARRAY:C229(ACC_at_PeriodCodes; <)
							$_bo_Create:=GEN_ChoicePopupCall(->ACC_at_PeriodCodes; ->ACC_l_selectedPeriod; False:C215; "Select Period"; "Select"; "Cancel"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
							
							If (ACC_l_selectedPeriod>0)
								$2->:=ACC_at_PeriodCodes{ACC_l_selectedPeriod}
							End if 
						Else 
							CREATE SET:C116([PERIODS:33]; "Periods")
							$_l_SelStart:=1
							$_l_SelEnd:=200
							Repeat 
								ACC_l_selectedPeriod:=0
								USE SET:C118("Periods")
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
								REDUCE SELECTION:C351([PERIODS:33]; $_l_SelEnd)
								$_l_RecordsCount:=Records in selection:C76([PERIODS:33])
								ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; <)
								$_l_Reduce:=$_l_RecordsCount-($_l_SelStart-1)
								REDUCE SELECTION:C351([PERIODS:33]; $_l_Reduce)
								
								$_l_SelStart:=$_l_SelEnd+1
								$_l_SelEnd:=$_l_SelStart+200
								
								SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes)
								SORT ARRAY:C229(ACC_at_PeriodCodes; <)
								$_bo_Create:=GEN_ChoicePopupCall(->ACC_at_PeriodCodes; ->ACC_l_selectedPeriod; False:C215; "Select Period"; "Select"; "Cancel"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
								If (ACC_l_selectedPeriod>0)
									If (ACC_at_PeriodCodes{ACC_l_selectedPeriod}#"More...")
										$2->:=ACC_at_PeriodCodes{ACC_l_selectedPeriod}
									Else 
										ACC_l_selectedPeriod:=0
									End if 
								End if 
								
							Until (ACC_l_selectedPeriod>0)
							CLEAR SET:C117("periods")
							ACC_l_selectedPeriod:=0
						End if 
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1))
					//Check_SecTrB (->[TRANS IN_TRANS SUB]Trans Code)
					If (OK=1)
						$_l_WildCardPosition:=Position:C15(Char:C90(64); $2->)
						If ($_l_WildCardPosition>0)
							TRANSNAME:=""
							///CheckMinorByObject (New object("ObjectValue";
							Check_MinorNC($2; "Type"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; ""; "-1"; True:C214; $_l_OLeft; $_l_OTop)  //10
						Else 
							//TRACE
							If ($_bo_NoWildCard)
								ACC_t_TestName:=$2->
							Else 
								ACC_t_TestName:=$2->+"@"
							End if 
							TRANSNAME:=""
							Check_MinorNC(->ACC_t_TestName; "Type"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2; ""; "-1"; True:C214; $_l_OLeft; $_l_OTop)  //10
							
							$2->:=ACC_t_TestName
						End if 
						
						If ($2->#"")
							$_l_BatchTypeRow:=Find in array:C230(ACC_at_BatchTransTypesCode; $2->)
							If ($_l_BatchTypeRow>0)
								If (ACC_bo_Autofill)  //Auto fill debit and credit sides
									
									If (ACC_t_TransDebitAcc="")
										ACC_t_TransDebitAcc:=ACC_at_DebitAcc{$_l_BatchTypeRow}
										
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_DebitAcc{$_l_BatchTypeRow})
										ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
										ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
										If (ACC_at_TTaxCode{$_l_BatchTypeRow}#"")
											ACC_t_TransTaxCode:=ACC_at_TTaxCode{$_l_BatchTypeRow}
										End if 
										If (ACC_t_TransDebitIO="")
											ACC_t_TransDebitIO:="N"
										End if 
									End if 
									
									If (ACC_t_TransCreditAcc="")
										ACC_t_TransCreditAcc:=ACC_at_CreditAcc{$_l_BatchTypeRow}
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
										ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
										ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
										If (ACC_at_TTaxCode{$_l_BatchTypeRow}#"")
											ACC_t_TransTaxCode:=ACC_at_TTaxCode{$_l_BatchTypeRow}
										End if 
										If (ACC_t_TransCreditIO="")
											ACC_t_TransCreditIO:="N"
										End if 
									End if 
								Else 
									//no autofill-set variables
								End if 
								If (ACC_t_BatchItemAnalysisCode="")
									If (<>PersAnOver=False:C215)
										ACC_t_BatchItemAnalysisCode:=ACC_at_TAnalysisCode{$_l_BatchTypeRow}
										If ([ANALYSES:36]Analysis_Code:1#ACC_t_BatchItemAnalysisCode)
											READ ONLY:C145([ANALYSES:36])
											QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=ACC_t_BatchItemAnalysisCode)
										End if 
										ACC_t_AnalysisNames:=[ANALYSES:36]Analysis_Name:2
									End if 
									
								End if 
								If (ACC_T_TransDescription="")
									ACC_T_TransDescription:=ACC_at_BatchTransTypesname{$_l_BatchTypeRow}
									ACC_T_TransDescription:=Uppers3(ACC_T_TransDescription)
								End if 
								If (ACC_at_TLayerCode{$_l_BatchTypeRow}#"")
									ACC_t_TransLayerCode:=ACC_at_TLayerCode{$_l_BatchTypeRow}
									If ([LAYERS:76]Layer_Code:1#ACC_t_TransLayerCode)
										READ ONLY:C145([LAYERS:76])
										QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=ACC_t_TransLayerCode)
									End if 
									ACC_t_LayerName:=[LAYERS:76]Layer_Name:2
								End if 
								If (ACC_at_TCurrencyCode{$_l_BatchTypeRow}#"")
									ACC_t_TransCurrencyCode:=ACC_at_TCurrencyCode{$_l_BatchTypeRow}
									If (ACC_t_TransCurrencyCode#"")
										If ([CURRENCIES:71]Currency_Code:1#ACC_t_TransCurrencyCode)
											READ ONLY:C145([CURRENCIES:71])
											QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_t_TransCurrencyCode)
										End if 
										//ACC_at_CURRENCYNAME{$Row2}:=[CURRENCIES]Currency Name
									End if 
								End if 
								
								
							Else 
								ACC_t_TransTransCode:=ACC_t_TransTransCodeOLD
								GOTO OBJECT:C206(ACC_t_TransTransCode)
							End if 
							
						Else 
							
							$2->:=""
						End if 
						
						
					Else 
						$2->:=ACC_t_TransTransCodeOLD
						GOTO OBJECT:C206($2->)
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5))
					If (Not:C34($2->=!00-00-00!))
						OK:=1
						//Check_SecTrB (->[TRANS IN_TRANS SUB]Trans_Date)
						If (OK=1)
							//vDate:=
							$_l_PeriodID:=Check_Period($2->)
							ACC_t_TransPeriodCode:=[PERIODS:33]Period_Code:1
							Trans_SubLPPer(ACC_t_TransLayerCode; ->ACC_t_TransPeriodCode; $2)
						Else 
							$2->:=!00-00-00!
						End if 
						
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Description:10))
					$2->:=Uppers3($2->)
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2))
					
					//Check_SecTrB (->[TRANS IN_TRANS SUB]Analysis Code)
					If (OK=1)
						Check_Analysis($2; ""; ->ACC_t_TransDebitAcc; ->ACC_t_TransCreditAcc; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
						If ($2->#"")
							If ([ANALYSES:36]Analysis_Code:1#$2->)
								READ ONLY:C145([ANALYSES:36])
								QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$2->)
							End if 
							ACC_t_AnalysisNames:=[ANALYSES:36]Analysis_Name:2
						Else 
							ACC_t_AnalysisNames:=""
						End if 
						
					Else 
						
						$2->:=ACC_t_BatchItemAnalysisCodeOLD
						GOTO OBJECT:C206($2->)
						If ($2->#"")
							If ([ANALYSES:36]Analysis_Code:1#$2->)
								READ ONLY:C145([ANALYSES:36])
								QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$2->)
							End if 
							ACC_t_AnalysisNames:=[ANALYSES:36]Analysis_Name:2
						End if 
					End if 
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20))
					$_bo_Edit:=Trans_SubLPLayer($2; ->ACC_t_TransDebitAcc; -2; ->ACC_t_TransCreditAcc; ACC_t_TransTransCode; ->ACC_t_TransPeriodCode; ->ACC_D_TransDate)
					If ($_bo_Edit)
						If ($2->#"")
							If ([LAYERS:76]Layer_Code:1#$2->)
								READ ONLY:C145([LAYERS:76])
								QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$2->)
							End if 
							ACC_t_LayerName:=[LAYERS:76]Layer_Name:2
						Else 
							ACC_t_LayerName:=""
						End if 
					Else 
						
						$2->:=ACC_t_TranslayerCodeOLD
						GOTO OBJECT:C206($2->)
						If ($2->#"")
							If ([LAYERS:76]Layer_Code:1#$2->)
								READ ONLY:C145([LAYERS:76])
								QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$2->)
							End if 
							ACC_t_LayerName:=[LAYERS:76]Layer_Name:2
						Else 
							ACC_t_LayerName:=""
						End if 
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15))
					Trans_SubLPIOx($2; ->ACC_t_TransDebitAcc; ACC_t_TransDebitIOOLD)
					//here reset the amounts
					If ($2->#ACC_t_TransDebitIOOLD)
						//the debit and the credit are defined.
						//as we have modified the debit IO recalc the credit IO
						$_r_TransAmount:=ACC_R_TransAmount
						$_r_TransTaxmount:=ACC_R_TransTaxAmt
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
								
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
									ACC_R_TransTaxAmtDebit:=0
									ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								End if 
								
							Else 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								
						End case 
						
						
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3))
					//Check_SecTrB (->[TRANS IN_TRANS SUB]Debit Acc)
					If (OK=1)
						Check_MinorNC($2; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; ""; "-1"; True:C214; $_l_OLeft; $_l_OTop)  //10
						
						
						If ($2->#"")
							If ([ACCOUNTS:32]No_NL_Postings:9)
								If ((DB_t_CurrentFormUsage3#"Pch") | (ACC_t_TransTransCode#DB_GetLedgerTRANSINVpost) | (ACC_t_TransTransCode#DB_GetLedgerTRANSRECpost))
									Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
									$2->:=ACC_t_TransDebitAccOLD
									If ($2->#"")
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
										ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
										ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
									Else 
										ACC_t_TransDebitIO:=""
										ACC_t_DebitAccountName:=""
									End if 
									
								Else 
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								End if 
							Else 
								ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
								ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
							End if 
						Else 
							ACC_t_TransDebitIO:=""
							ACC_t_DebitAccountName:=""
						End if 
						ACC_l_NextColumn:=0
						$_bo_Applicable:=True:C214
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=ACC_t_TransTransCode)
						If (ACC_t_DebitAccountName#"")
							$_bo_Applicable:=Trans_SubLPLayerCode($2; ->ACC_t_TransLayerCode; -1; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with layer+"+ACC_t_TransLayerCode; "OK")
								
								
								$2->:=ACC_t_TransDebitAccOLD
								If ($2->#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
							End if 
							
						End if 
						If ($2->#"")
							$_bo_Applicable:=Check_AnalAcc($2; ->ACC_t_BatchItemAnalysisCode; -1; True:C214; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_DebitAccountName+" may not be used with analysis+"+ACC_t_BatchItemAnalysisCode)
								$2->:=ACC_t_TransDebitAccOLD
								If ($2->#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransDebitIO:=""
									ACC_t_DebitAccountName:=""
								End if 
							End if 
						End if 
						
						If (($2->#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
							If (($2-><[TRANSACTION_TYPES:31]D_Range_F:9) | ($2->>[TRANSACTION_TYPES:31]D_Range_T:10))
								If ([TRANSACTION_TYPES:31]D_Enforce:13)
									Gen_Alert("This Account does not fall within the Transaction Type's required range of Debit"+" Accounts."; "Try again")
									$_bo_Applicable:=False:C215
									$2->:=[TRANSACTION_TYPES:31]Debit_Account:4
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[TRANSACTION_TYPES:31]Debit_Account:4)
									ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
									ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Debit"+" Accounts."; "Allow"; "Try again")
									If (OK=0)
										$_bo_Applicable:=False:C215
										$2->:=[TRANSACTION_TYPES:31]Debit_Account:4
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[TRANSACTION_TYPES:31]Debit_Account:4)
										ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
										ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
									End if 
								End if 
							End if 
						End if 
						If ($_bo_Applicable)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
							ACC_t_TransDebitIO:=[ACCOUNTS:32]IO:5
							ACC_t_DebitAccountName:=[ACCOUNTS:32]Account_Name:3
							If (ACC_t_TransDebitIO="")
								ACC_t_TransDebitIO:="N"
							End if 
							If ((($2->="") | (ACC_t_TransCreditAcc="")) & (ACC_R_TransTotal>0))
								vTot:=1
								vTot2:=1
							End if 
						End if 
					End if 
					Case of 
						: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
								ACC_R_TransTaxAmtCredit:=0
								ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
							End if 
							
						: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								ACC_R_TransTaxAmtDebit:=0
								ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
							End if 
							
						Else 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							
					End case 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19))
					
					$_bo_Edit:=Trans_SubLPCur($2)
					If ($_bo_Edit=False:C215)
						$2->:=ACC_t_TransCurrencyCodeOLD
						GOTO OBJECT:C206($2->)
					End if 
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Total:9))
					RESOLVE POINTER:C394($2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					//Check_SecTrB(->[TRANS IN_TRANS SUB]Amount)
					If (OK=1)
						Case of 
							: ($_t_VariableName="ACC_R_TransTotalDebit")
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
								ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
								If (((ACC_t_TransDebitIO="I@") | (ACC_t_TransCreditIO="I@")) & (ACC_t_UKEC="E"))
									ACC_R_TransAmount:=Gen_Round((ACC_R_TransTotal); 2; 2)
								Else 
									If ([TAX_CODES:35]Tax_Code:1#ACC_t_TransTaxCode)
										QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=ACC_t_TransTaxCode)
										$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
									Else 
										$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
									End if 
									ACC_R_TransAmount:=Gen_Round(((ACC_R_TransTotal/(100+$_r_TaxRate))*100); 2; 2)
									ACC_R_TransTaxAmt:=Gen_Round((ACC_R_TransTotal-ACC_R_TransAmount); 2; 2)
								End if 
								Case of 
									: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTotal-ACC_R_TransAmount; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
											ACC_R_TransTaxAmtCredit:=0
											ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
										End if 
									: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=0
										ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
										
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
											ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
											ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										End if 
										
									Else 
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
											ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
											ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
										End if 
										
								End case 
							: ($_t_VariableName="ACC_R_TransTotalCredit")
								ACC_R_TransTotalcredit:=Gen_Round(ACC_R_TransTotalcredit; 2; 2)
								ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalcredit; 2; 2)
								If (((ACC_t_TransDebitIO="I@") | (ACC_t_TransCreditIO="I@")) & (ACC_t_UKEC="E"))
									ACC_R_TransAmount:=Gen_Round((ACC_R_TransTotal); 2; 2)
								Else 
									If ([TAX_CODES:35]Tax_Code:1#ACC_t_TransTaxCode)
										QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=ACC_t_TransTaxCode)
										$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
									Else 
										$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
									End if 
									ACC_R_TransAmount:=Gen_Round(((ACC_R_TransTotal/(100+$_r_TaxRate))*100); 2; 2)
									ACC_R_TransTaxAmt:=Gen_Round((ACC_R_TransTotal-ACC_R_TransAmount); 2; 2)
								End if 
								Case of 
									: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
										ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
										ACC_R_TransTaxAmtCredit:=0
										ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
										
										If (ACC_t_TransDebitAcc#"")
											ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
											ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTotal-ACC_R_TransAmount; 2; 2)
											ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
											ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
										End if 
										
									: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
										ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
										ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=0
										ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
										
										
										
									Else 
										ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
										ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
										
										
										
										
										
										
								End case 
								
						End case 
						ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmount; 2; 2)
						Trans_SubLPVAT(ACC_t_TransDebitIO; ACC_t_TransCreditIO; ACC_t_UKEC; ACC_t_TransTaxCode; ->ACC_R_TransAmount; ->ACC_R_TransTaxAmt; ->ACC_R_TransTotal; ACC_t_TransDebitAcc; ACC_t_TransCreditAcc)
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
								
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
									ACC_R_TransTaxAmtDebit:=0
									ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								End if 
								
							Else 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								
						End case 
					Else 
						ACC_R_TransAmount:=ACC_R_TransAmountOLD
						GOTO OBJECT:C206($2->)
					End if 
					
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Amount:6))
					RESOLVE POINTER:C394($2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					//Check_SecTrB(->[TRANS IN_TRANS SUB]Amount)
					If (OK=1)
						Case of 
							: ($_t_VariableName="ACC_R_TransAmountDebit")
								Case of 
									: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
										ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtDebit; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
										ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
											ACC_R_TransTaxAmtCredit:=0
											ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
										End if 
									: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
										ACC_R_TransTaxAmtDebit:=0
										ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
										ACC_R_TransTotal:=ACC_R_TransAmountDebit
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
											ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
											ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										End if 
										
									Else 
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
										ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtDebit; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
										ACC_R_TransTotal:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
										If (ACC_t_TransCreditAcc#"")
											ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
											ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
											ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
										End if 
										
										
										
								End case 
							: ($_t_VariableName="ACC_R_TransAmountCredit")
								Case of 
									: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
										QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=ACC_t_TransTaxCode)
										$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
										//Inverse tax calculation- amount/tax%+100 then multiply by 100 to get amount before tax
										$_r_TaxAmount:=(ACC_R_TransAmountCredit-((ACC_R_TransAmountCredit/(100+$_r_TaxRate))*100))
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountCredit-$_r_TaxAmount; 2; 2)  //Note for display this is a postive amount
										ACC_R_TransTaxAmtCredit:=0
										ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
										ACC_R_TransTotal:=ACC_R_TransTotalCredit
										If (ACC_t_TransDebitAcc#"")
											ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
											ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTotal-ACC_R_TransAmount; 2; 2)
											ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
											ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
										End if 
										
									: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountCredit; 2; 2)  //Note for display a positive amount
										ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtCredit; 2; 2)  //Note for display a positive amount
										ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)
										ACC_R_TransTotal:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=0
										ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
										
										
										
									Else 
										ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountCredit; 2; 2)  //Note for display a positive amount
										ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtCredit; 2; 2)  //Note for display a positive amount
										ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
										ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalCredit; 2; 2)  //Note for display a positive amount
										ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
										ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
										ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
										
										
										
										
										
										
								End case 
								
						End case 
						ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmount; 2; 2)
						Trans_SubLPVAT(ACC_t_TransDebitIO; ACC_t_TransCreditIO; ACC_t_UKEC; ACC_t_TransTaxCode; ->ACC_R_TransAmount; ->ACC_R_TransTaxAmt; ->ACC_R_TransTotal; ACC_t_TransDebitAcc; ACC_t_TransCreditAcc)
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
								
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
									ACC_R_TransTaxAmtDebit:=0
									ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								End if 
								
							Else 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								
						End case 
					Else 
						ACC_R_TransAmount:=ACC_R_TransAmountOLD
						GOTO OBJECT:C206($2->)
					End if 
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7))
					//Check_SecTrB (->[TRANS IN_TRANS SUB]Tax Code)
					If (OK=1)
						Check_MinorNC($2; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"); "-1"; True:C214; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
						
						
						If (ACC_t_TransTaxCode="")
							ACC_t_TransTaxCode:=DB_GetLedgerDefaultSalesTax
							QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=ACC_t_TransTaxCode)
						End if 
						Trans_SubLPVAT(ACC_t_TransDebitIO; ACC_t_TransCreditIO; ACC_t_UKEC; ACC_t_TransTaxCode; ->ACC_R_TransAmount; ->ACC_R_TransTaxAmt; ->ACC_R_TransTotal; ACC_t_TransDebitAcc; ACC_t_TransCreditAcc)
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
								
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
									ACC_R_TransTaxAmtDebit:=0
									ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								End if 
								
							Else 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								
						End case 
					Else 
						ACC_t_TransTaxCode:=ACC_t_TransTaxCodeOLD
						GOTO OBJECT:C206($2->)
					End if 
					
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]UK_EC:18))
					//Check_SecTrB (->[TRANS IN_TRANS SUB]UK EC)
					If (OK=1)
						ACC_t_UKEC:=Uppercase:C13(ACC_t_UKEC)
						If ((ACC_t_UKEC#"U") & (ACC_t_UKEC#"E"))
							UKEC_Alert
							ACC_t_UKEC:="U"
						End if 
						Trans_SubLPVAT(ACC_t_TransDebitIO; ACC_t_TransCreditIO; ACC_t_UKEC; ACC_t_TransTaxCode; ->ACC_R_TransAmount; ->ACC_R_TransTaxAmt; ->ACC_R_TransTotal; ACC_t_TransDebitAcc; ACC_t_TransCreditAcc)
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
								
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
									ACC_R_TransTaxAmtDebit:=0
									ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								End if 
								
							Else 
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								If (ACC_t_TransDebitAcc#"")
									ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								End if 
								
						End case 
					Else 
						ACC_t_UKEC:=ACC_t_UKECOLD
						GOTO OBJECT:C206($2->)
					End if 
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8))
					//Check_SecTrB (->[TRANS IN_TRANS SUB]Tax Amount)
					
					If (OK=1)
						RESOLVE POINTER:C394($2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						Case of 
							: ($_t_VariableName="ACC_R_TransTaxAmtDebit")
								If (((ACC_t_TransDebitIO="I@") | (ACC_t_TransCreditIO="I@")) & (ACC_t_UKEC="E"))
									Gen_Alert("You cannot allocate VAT to an EC Input Transaction")
									ACC_R_TransTaxAmtDebit:=0
								Else 
									ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmtDebit; 2; 2)
									ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
								End if 
							Else 
								ACC_R_TransTaxAmtDebit:=ACC_R_TransTaxAmtDebitOLD
								GOTO OBJECT:C206($2->)
						End case 
						
						Case of 
							: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
								ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
								ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtDebit; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round((ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit); 2; 2)
								ACC_R_TransTotal:=Gen_Round(ACC_R_TransTotalDebit; 2; 2)
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
									ACC_R_TransTaxAmtCredit:=0
									ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
								End if 
							: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
								ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
								ACC_R_TransTaxAmtDebit:=0
								ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
								ACC_R_TransTotal:=ACC_R_TransAmountDebit
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransAmount+ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								End if 
								
							Else 
								ACC_R_TransAmount:=Gen_Round(ACC_R_TransAmountDebit; 2; 2)
								ACC_R_TransTaxAmt:=Gen_Round(ACC_R_TransTaxAmtDebit; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
								ACC_R_TransTotal:=Gen_Round(ACC_R_TransAmountDebit+ACC_R_TransTaxAmtDebit; 2; 2)
								If (ACC_t_TransCreditAcc#"")
									ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
									ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
									ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
								End if 
								
								
								
						End case 
					End if 
					
				: ($1=(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12))
					
					//Check_SecTrB (->ACC_at_BatchItemCreditAcc{$Row2})
					If (OK=1)
						Check_MinorNC(->ACC_t_TransCreditAcc; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; ""; "-1"; True:C214; $_l_OLeft; $_l_OTop)  //10
						
						
						If (ACC_t_TransCreditAcc#"")
							If ([ACCOUNTS:32]No_NL_Postings:9)
								Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
								ACC_t_TransCreditAcc:=ACC_t_TransCreditAccOLD
								GOTO OBJECT:C206($2->)
								If (ACC_t_TransCreditAcc#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
									ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
									ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransCreditIO:=""
									ACC_t_CreditAccountName:=""
								End if 
								
							Else 
								ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
								ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
							End if 
						Else 
							ACC_t_TransCreditIO:=""
							ACC_t_CreditAccountName:=""
							ACC_t_TransCreditAcc:=ACC_t_TransCreditAccOLD
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
							ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
							
						End if 
						
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=ACC_t_TransTransCode)
						ACC_l_NextColumn:=0
						$_bo_Applicable:=True:C214
						If (ACC_t_TransCreditAcc#"")
							$_bo_Applicable:=Trans_SubLPLayerCode(->ACC_t_TransCreditAcc; ->ACC_t_TransLayerCode; -1; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								Gen_Alert("The account "+ACC_t_CreditAccountName+" may not be used with layer+"+ACC_t_TransLayerCode)
								$2->:=ACC_t_TransCreditAccOLD
								GOTO OBJECT:C206($2->)
								If ($2->#"")
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
									ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransCreditIO:=""
									ACC_t_CreditAccountName:=""
								End if 
							End if 
						End if 
						If (ACC_t_TransCreditAcc#"")
							$_bo_Applicable:=Check_AnalAcc(->ACC_t_TransCreditAcc; ->ACC_t_BatchItemAnalysisCode; -1; True:C214; ->ACC_l_NextColumn)
							If (Not:C34($_bo_Applicable))
								$2->:=ACC_t_TransCreditAccOLD
								GOTO OBJECT:C206($2->)
								If ($2->#"")
									Gen_Alert("The account "+ACC_t_CreditAccountName+" may not be used with analysis+"+ACC_t_BatchItemAnalysisCode)
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
									ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
									ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
								Else 
									ACC_t_TransCreditIO:=""
									ACC_t_CreditAccountName:=""
								End if 
							End if 
						End if 
						
						If ((ACC_t_TransCreditAcc#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
							If ((ACC_t_TransCreditAcc<[TRANSACTION_TYPES:31]C_Range_F:11) | (ACC_t_TransCreditAcc>[TRANSACTION_TYPES:31]C_Range_T:12))
								If ([TRANSACTION_TYPES:31]C_Enforce:14)
									Gen_Alert("This Account does not fall within the Transaction Type's required range of Credi"+"t Accounts."; "Try again")
									$_bo_Applicable:=False:C215
									ACC_t_TransCreditAcc:=[TRANSACTION_TYPES:31]Credit_Account:5
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
									ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
									ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
									
								Else 
									Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Credit"+" Accounts."; "Allow"; "Try again")
									If (OK=0)
										$_bo_Applicable:=False:C215
										ACC_t_TransCreditAcc:=[TRANSACTION_TYPES:31]Credit_Account:5
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
										ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
										ACC_t_CreditAccountName:=[ACCOUNTS:32]Account_Name:3
									End if 
								End if 
							End if 
						End if 
						If ($_bo_Applicable)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_TransCreditAcc)
							ACC_t_TransCreditIO:=[ACCOUNTS:32]IO:5
							If (ACC_t_TransCreditIO="")
								ACC_t_TransCreditIO:="N"
							End if 
							
						End if 
					End if 
					Case of 
						: ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display this is a postive amount
								ACC_R_TransTaxAmtCredit:=0
								ACC_R_TransTotalCredit:=ACC_R_TransAmountCredit
							End if 
							
						: ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
								ACC_R_TransTaxAmtDebit:=0
								ACC_R_TransTotalDebit:=ACC_R_TransAmountDebit
							End if 
							
						Else 
							If (ACC_t_TransCreditAcc#"")
								ACC_R_TransAmountCredit:=Gen_Round(ACC_R_TransAmount; 2; 2)  //Note for display a positive amount
								ACC_R_TransTaxAmtCredit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)  //Note for display a positive amount
								ACC_R_TransTotalCredit:=Gen_Round(ACC_R_TransTotal; 2; 2)  //Note for display a positive amount
							End if 
							
							If (ACC_t_TransDebitAcc#"")
								ACC_R_TransAmountDebit:=Gen_Round(ACC_R_TransAmount; 2; 2)
								ACC_R_TransTaxAmtDebit:=Gen_Round(ACC_R_TransTaxAmt; 2; 2)
								ACC_R_TransTotalDebit:=Gen_Round(ACC_R_TransTotal; 2; 2)
							End if 
							
					End case 
			End case 
			//These copies for the credit side are only so we can control this display
			ACC_t_TransCurrencyCodeCred:=ACC_t_TransCurrencyCode
			ACC_t_TransTaxCodeCred:=ACC_t_TransTaxCode
			ACC_t_UKECCred:=ACC_t_UKEC
			If (ACC_t_DebitAccountName#"")
				OBJECT SET ENTERABLE:C238(ACC_t_DebitAccountName; False:C215)
			Else 
				OBJECT SET ENTERABLE:C238(ACC_t_DebitAccountName; True:C214)
			End if 
			If (ACC_t_CreditAccountName#"")
				OBJECT SET ENTERABLE:C238(ACC_t_CreditAccountName; False:C215)
			Else 
				OBJECT SET ENTERABLE:C238(ACC_t_CreditAccountName; True:C214)
			End if 
			
			If (ACC_t_TransCreditAcc="")
				ACC_t_CreditAccountName:=""
				
				OBJECT SET VISIBLE:C603(ACC_t_TransCreditIO; False:C215)
				OBJECT SET VISIBLE:C603(ACC_at_IOValuesCred; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCodeCred; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_UKECCred; False:C215)
				OBJECT SET VISIBLE:C603(ACC_R_TransAmountCredit; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_TransTaxCodeCred; False:C215)
				OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtCredit; False:C215)
				
				OBJECT SET VISIBLE:C603(ACC_R_TransTotalCredit; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(ACC_t_TransCreditIO; True:C214)
				OBJECT SET VISIBLE:C603(ACC_at_IOValuesCred; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCodeCred; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_UKECCred; True:C214)
				OBJECT SET VISIBLE:C603(ACC_R_TransAmountCredit; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_TransTaxCodeCred; True:C214)
				OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtCredit; True:C214)
				OBJECT SET VISIBLE:C603(ACC_R_TransTotalCredit; True:C214)
			End if 
			If (ACC_t_TransDebitAcc="")
				ACC_t_DebitAccountName:=""
				OBJECT SET VISIBLE:C603(ACC_t_TransDebitIO; False:C215)
				OBJECT SET VISIBLE:C603(ACC_at_IOValues; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCode; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_UKEC; False:C215)
				OBJECT SET VISIBLE:C603(ACC_R_TransAmountDebit; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_TransTaxCode; False:C215)
				OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtDebit; False:C215)
				
				OBJECT SET VISIBLE:C603(ACC_R_TransTotalDebit; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(ACC_t_TransDebitIO; True:C214)
				OBJECT SET VISIBLE:C603(ACC_at_IOValues; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_TransCurrencyCode; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_UKEC; True:C214)
				OBJECT SET VISIBLE:C603(ACC_R_TransAmountDebit; True:C214)
				OBJECT SET VISIBLE:C603(ACC_t_TransTaxCode; True:C214)
				OBJECT SET VISIBLE:C603(ACC_R_TransTaxAmtDebit; True:C214)
				
				OBJECT SET VISIBLE:C603(ACC_R_TransTotalDebit; True:C214)
			End if 
			
			
			
			
		End if 
		If (ACC_t_TransTransCode="")
			GOTO OBJECT:C206(ACC_t_TransTransCode)
		Else 
			If (ACC_D_TransDate=!00-00-00!)
				GOTO OBJECT:C206(ACC_D_TransDate)
			Else 
				If (ACC_t_TransPeriodCode="")
					GOTO OBJECT:C206(ACC_t_TransPeriodCode)
				Else 
					If (ACC_t_TransDebitAcc="")
						GOTO OBJECT:C206(ACC_t_TransDebitAcc)
					Else 
						If (ACC_t_TransCurrencyCode="") & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2) & ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
							GOTO OBJECT:C206(ACC_t_TransCurrencyCode)
						Else 
							If (ACC_R_TransAmountDebit=0)
								GOTO OBJECT:C206(ACC_R_TransAmountDebit)
							Else 
								If (ACC_t_TransTaxCode="")
									GOTO OBJECT:C206(ACC_t_TransTaxCode)
								Else 
									QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=ACC_t_TransTaxCode)
									$_r_TaxRate:=[TAX_CODES:35]Tax_Rate:3
									If (ACC_t_UKEC="")
										GOTO OBJECT:C206(ACC_t_UKEC)
									Else 
										If (ACC_R_TransTaxAmtDebit=0) & ($_r_TaxRate#0) & ((ACC_t_TransDebitIO#"N") & (ACC_t_TransCreditIO="N"))
											
											GOTO OBJECT:C206(ACC_R_TransTaxAmtDebit)
										Else 
											If (ACC_t_TransCreditAcc="")
												GOTO OBJECT:C206(ACC_t_TransCreditAcc)
											Else 
												If (ACC_t_TransCurrencyCodeCred="") & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)
													
													GOTO OBJECT:C206(ACC_t_TransCreditAcc)
												Else 
													If (ACC_R_TransAmountCredit=0)
														GOTO OBJECT:C206(ACC_R_TransAmountCredit)
													Else 
														If (ACC_t_TransTaxCodeCred="")
															GOTO OBJECT:C206(ACC_t_TransTaxCodeCred)
														Else 
															If (ACC_t_UKECCred="")
																GOTO OBJECT:C206(ACC_t_UKECCred)
															Else 
																If (ACC_R_TransAmountCredit#0) & ($_r_TaxRate#0) & ((ACC_t_TransDebitIO="N") & (ACC_t_TransCreditIO#"N"))
																	GOTO OBJECT:C206(ACC_R_TransAmountCredit)
																End if 
															End if 
															
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
				End if 
			End if 
		End if 
		
		WS_KeepFocus
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_ValidateSubiems"; $_t_oldMethodName)
