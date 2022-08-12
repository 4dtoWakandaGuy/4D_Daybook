//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_ImpAT2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_TelephoneMatch; $_d_IncludeTax; WIN_bo_TrackerInited)
	C_DATE:C307($_d_ImportDate; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_IsUnique; $_l_PeriodID; $_l_PRsc; $_l_WindowReferenceRow; $_r_Calc; vAdd; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Comments; $_t_CompanyCode; $_t_DebtorsAccount; $_t_ErrorLog; $_t_EventOLD; $_t_FieldDelimiter; $_t_ImportTitle; $_t_invoiceNumber; $_t_Issue; $_t_oldMethodName)
	C_TEXT:C284($_t_PRIssue; $_t_ProductCode; $_t_PrsMessage; $_t_QuantitySTR; $_t_RecordDelimiter; $_t_TelephoneCode; $_t_TotalinvoiceSTR; vT; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ImpAT2")
//`Project Method Invoices_ImpAT2/3/2(ID 10696-11310)

//Invoices_Import AutoTrader2
//PRS 11/9/95 & RJBC 15/9/95!!!!!
//Modified 14/11/95 PRS!!!!!!!!
//Modified 23/11/95 PRS!!!!!!!!!!!
//Modified by RJBC again 14/3/96
$_d_ImportDate:=Current date:C33
$_t_ImportTitle:="Import Invoices"
Start_Process
If (Invoices_File)
	QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
	If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1))
		vAdd:=1
		Gen_Confirm("Have you created an Invoice File in the correct Text format?"; "Yes"; "No")
		If (OK=1)
			Gen_Confirm3("Does the Price in the File Include or Exclude Tax?"; "Including"; "Cancel"; "Excluding")
			If (OK=1)
				If (xNext=1)
					$_d_IncludeTax:=False:C215
				Else 
					$_d_IncludeTax:=True:C214
				End if 
				Gen_Confirm("Do you want to match Telephone numbers or Account codes?"; "Telephone"; "Account")
				If (OK=1)
					$_bo_TelephoneMatch:=True:C214
				Else 
					$_bo_TelephoneMatch:=False:C215
				End if 
				SET CHANNEL:C77(10; "")
				If (OK=1)
					//  START TRANSACTION
					StartTransaction  // 13/05/02 pb
					
					$_t_ErrorLog:=""
					$_l_PRsc:=1
					$_t_RecordDelimiter:=Char:C90(13)
					$_t_FieldDelimiter:=Char:C90(9)
					$_t_EventOLD:=""
					$_t_PRIssue:=""
					vText:="sdfsdf"
					<>SYS_l_CancelProcess:=0
					Open_PrD_Window($_t_ImportTitle+": Command-. to Cancel")
					While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
						IDLE:C311  // 03/04/03 pb
						RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
						vT:=vText
						$_t_TelephoneCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_QuantitySTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_Comments:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_TotalinvoiceSTR:=First_Field(->vT; $_t_FieldDelimiter)
						$_t_DebtorsAccount:=[TRANSACTION_TYPES:31]Debit_Account:4
						$_r_Calc:=0
						If ($_t_PRIssue="")
							If ($_t_Issue#"")
								$_t_PRIssue:=$_t_Issue
							End if 
						End if 
						If (Length:C16($_t_TelephoneCode)>1)
							If ($_bo_TelephoneMatch)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_TelephoneCode)
							Else 
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_TelephoneCode)
							End if 
							If (Records in selection:C76([COMPANIES:2])=1)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
								
								If (Records in selection:C76([INVOICES:39])=0)
									MESSAGE:C88("Creating Record "+String:C10($_l_PRsc)+Char:C90(13))
									CREATE RECORD:C68([INVOICES:39])
									Repeat 
										$_t_invoiceNumber:=Gen_CodePref(4; ->[INVOICES:39]Invoice_Number:1)
										SET QUERY DESTINATION:C396(3; $_l_IsUnique)
										QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
										SET QUERY DESTINATION:C396(0)
									Until ($_l_IsUnique=0)
									[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
									[INVOICES:39]Company_Code:2:=[COMPANIES:2]Company_Code:1
									[INVOICES:39]Invoice_Date:4:=$_d_ImportDate
									[INVOICES:39]Posted_Date:8:=!00-00-00!
									[INVOICES:39]State:10:=0
									[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
									[INVOICES:39]Analysis_Code:17:=[PRODUCTS:9]Analysis_Code:18
									[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
									Invoices_DueDat
									vDate:=$_d_ImportDate
									$_l_PeriodID:=Check_Period
									[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
									[INVOICES:39]Debtors_Account:15:=$_t_DebtorsAccount
									
								Else 
									MESSAGE:C88("Modifying Invoice "+[INVOICES:39]Invoice_Number:1+" with Record "+String:C10($_l_PRsc)+Char:C90(13))
									$_r_Calc:=1
								End if 
								
								//Items
								If ($_t_ProductCode#"")
									CREATE RECORD:C68([INVOICES_ITEMS:161])
									[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
									[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
									$_t_ProductCode:=Substring:C12($_t_ProductCode; 1; 1)
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Model_Code:5=$_t_ProductCode)
									[INVOICES_ITEMS:161]Product_Code:1:=$_t_ProductCode
									[INVOICES_ITEMS:161]Product_Name:2:=[PRODUCTS:9]Product_Name:2
									[INVOICES_ITEMS:161]Quantity:3:=Num:C11($_t_QuantitySTR)
									If ([PRODUCTS:9]Default_Tax:23="")
										[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
									Else 
										[INVOICES_ITEMS:161]Tax_Code:6:=[PRODUCTS:9]Default_Tax:23
									End if 
									If ($_d_IncludeTax)
										[INVOICES_ITEMS:161]Total_Amount:8:=Num:C11($_t_TotalinvoiceSTR)
										[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round([INVOICES_ITEMS:161]Total_Amount:8; 2; 2)
										RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
										If ([TAX_CODES:35]Use_Areas:4)
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round((([INVOICES_ITEMS:161]Total_Amount:8/(100+[INVOICES:39]Tax_Rate:28))*100); 2; 2)
										Else 
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round((([INVOICES_ITEMS:161]Total_Amount:8/(100+[TAX_CODES:35]Tax_Rate:3))*100); 2; 2)
										End if 
										[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Total_Amount:8-[INVOICES_ITEMS:161]Amount:5); 2; 5)
										//   [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/
										//[INVOICES_ITEMS]Quantity);2;1)
										[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; [INVOICES_ITEMS:161]Quantity:3); 2; 1)  // 17/02/04 pb
									Else 
										[INVOICES_ITEMS:161]Amount:5:=Num:C11($_t_TotalinvoiceSTR)
										If ([TAX_CODES:35]Tax_Code:1#[INVOICES_ITEMS:161]Tax_Code:6)
											RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
										End if 
										If ([TAX_CODES:35]Use_Areas:4)
											[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Amount:5*([INVOICES:39]Tax_Rate:28/100)); 2; 5)
										Else 
											[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Amount:5*([TAX_CODES:35]Tax_Rate:3/100)); 2; 5)
										End if 
										//    [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/  `
										//[INVOICES_ITEMS]Quantity);2;1)
										[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; [INVOICES_ITEMS:161]Quantity:3); 2; 1)  // 17/02/04 pb
										[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round(([INVOICES_ITEMS:161]Amount:5+[INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
									End if 
									[INVOICES_ITEMS:161]Sales_Account:9:=[PRODUCTS:9]Sales_Account:7
									[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
									QUERY:C277([TYPES:5]; [TYPES:5]Type_Name:2=$_t_Comments)
									[INVOICES_ITEMS:161]Description:13:=[TYPES:5]Type_Code:1
									[INVOICES_ITEMS:161]Print_Description:14:=True:C214
									[INVOICES_ITEMS:161]Analysis_Code:10:=[PRODUCTS:9]Analysis_Code:18
									DB_SaveRecord(->[INVOICES_ITEMS:161])
									
									QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
									[INVOICES:39]Total_Invoiced:5:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Total_Amount:8)); 2; 2)
									[INVOICES:39]Total_Paid:6:=0
									[INVOICES:39]Total_Due:7:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Total_Amount:8)); 2; 2)
									[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Amount:5)); 2; 2)
									[INVOICES:39]Total_Tax:35:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7)); 2; 2)
									DB_SaveRecord(->[INVOICES:39])
									
								End if 
								$_l_PRsc:=$_l_PRsc+1
							Else 
								If (Records in selection:C76([COMPANIES:2])=0)
									If ($_bo_TelephoneMatch)
										$_t_ErrorLog:=$_t_ErrorLog+"Telephone number "+$_t_TelephoneCode+" was not found.  Account "+$_t_CompanyCode+".  Import record number "+String:C10($_l_PRsc)+"."+Char:C90(13)
									Else 
										$_t_ErrorLog:=$_t_ErrorLog+"Account code "+$_t_TelephoneCode+" was not found.  Import record number "+String:C10($_l_PRsc)+"."+Char:C90(13)
									End if 
								Else 
									If ($_bo_TelephoneMatch)
										$_t_ErrorLog:=$_t_ErrorLog+"Telephone number "+$_t_TelephoneCode+" was found more than once.  Account "+$_t_CompanyCode+".  Import record number "+String:C10($_l_PRsc)+"."+Char:C90(13)
									Else 
										$_t_ErrorLog:=$_t_ErrorLog+"Account code "+$_t_TelephoneCode+" was found more than once.  Import record number "+String:C10($_l_PRsc)+"."+Char:C90(13)
									End if 
								End if 
								$_l_PRsc:=$_l_PRsc+1
							End if 
						End if 
					End while 
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					SET CHANNEL:C77(11)
					If (<>SYS_l_CancelProcess=Current process:C322)
						Gen_Alert("The whole import has been cancelled"; "OK")
						//         CANCEL TRANSACTION
						OK:=0
						Transact_End  // 13/05/02 pb
					Else 
						Gen_Confirm("The importing has completed.  "+"Please confirm that you want the records to be saved permanently."; "Save"; "Cancel")
						Transact_End
					End if 
				End if 
			End if 
			If ($_t_ErrorLog#"")
				Gen_Alert("Errors were created.  Please name the file to save."; "OK")
				SET CHANNEL:C77(12; "")
				If (OK=1)
					SEND PACKET:C103("Import Log for "+String:C10($_d_ImportDate)+".")
					SEND PACKET:C103(Char:C90(13)+Char:C90(13))
					SEND VARIABLE:C80($_t_ErrorLog)
					SET CHANNEL:C77(11)
				Else 
					$_t_PrsMessage:="You canceled saving the error file.  This is not advised.  If you really do wish"
					$_t_PrsMessage:=$_t_PrsMessage+" to cancel the error file press cancel, else press OK"
					Gen_Confirm($_t_PrsMessage)
					If (OK=1)
						SET CHANNEL:C77(12; "")
						If (OK=1)
							SEND PACKET:C103("Import Log for "+String:C10($_d_ImportDate)+".")
							SEND PACKET:C103(Char:C90(13)+Char:C90(13))
							SEND VARIABLE:C80($_t_ErrorLog)
							SET CHANNEL:C77(11)
						End if 
					End if 
				End if 
			End if 
		End if 
	Else 
		Gen_Alert("Required Setups have not been completed"; "")
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices_ImpAT2"; $_t_oldMethodName)