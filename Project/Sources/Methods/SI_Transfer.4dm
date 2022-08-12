//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_Transfer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_StoredUpdates; 0)
	ARRAY REAL:C219($_ar_SubRefersInvoicesAmounts; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
	ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
	C_BOOLEAN:C305(<>DB_bo_Exit; <>SI_bo_AllocationValidationDisab; <>SYS_bo_SkipDateUpdates; $_bo_Messages; $_bo_Run; $_bo_Start; $_bo_TotalsError; $_bo_TotalsError2; $_bo_Validation; $_bo_ValidationReport; $1)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_CharacterPosition; $_l_CountRecordsAllocations; $_l_CurrentRevision; $_l_Element; $_l_Invoice2Row; $_l_ItemID; $_l_NextRevision; $_l_offset; $_l_RecordCount; $_l_RecordsToUpdate)
	C_LONGINT:C283($_l_RefersIndex; $_l_UpdateIndex; $2; $3)
	C_REAL:C285($_r_ReportAmount; $_r_TotalDue; $_r_TotalDue2; $_r_TotalPaid; $_r_TotalPaid2; $_r_TotalPaid3; $_r_TotalSum)
	C_TEXT:C284($_t_InvoiceNumber; $_t_InvoiceNumberC; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_Transfer")
//This method will check if any invoices have not had the allocation transferred t
//to the new tables.
//invoice state
//-1=Proforma
//-2=deposit?
//-3=Receipt
//0=unposted invoice
//1=Posted invoice?
//Credit notes are 0 or 1 as well BUT the amount<0
//NG
If (True:C214)
	READ ONLY:C145([IDENTIFIERS:16])
	REDUCE SELECTION:C351([IDENTIFIERS:16]; 0)
	
	If (Count parameters:C259>=3)
		$_bo_Validation:=$1
		$_l_NextRevision:=$2
		$_l_Element:=$3
		While (Semaphore:C143("LoadingValidationPrefs"))
			DelayTicks(2)
		End while 
		READ ONLY:C145([PREFERENCES:116])
		$_l_ItemID:=PREF_GetPreferenceID("Validation Settings")
		$_l_offset:=0
		ARRAY LONGINT:C221($_al_StoredUpdates; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_StoredUpdates; $_l_offset)
			UNLOAD RECORD:C212([PREFERENCES:116])
			If (Size of array:C274($_al_StoredUpdates)>=$_l_Element)
				$_l_CurrentRevision:=$_al_StoredUpdates{$_l_Element}
			Else 
				$_l_CurrentRevision:=0
			End if 
			
		Else 
			$_l_CurrentRevision:=0
		End if 
		CLEAR SEMAPHORE:C144("LoadingValidationPrefs")
		
	Else 
		$_bo_Validation:=False:C215
	End if 
	If ($_bo_Validation)
		If ($_l_CurrentRevision<$_l_NextRevision)
			StartTransaction
			$_bo_Run:=True:C214
		End if 
		
	Else 
		$_bo_Run:=True:C214
	End if 
	If ($_bo_Run)
		If (Not:C34(<>SYS_bo_SkipDateUpdates))
			
			$_bo_Messages:=False:C215
			$_bo_ValidationReport:=False:C215
			<>DB_bo_Exit:=False:C215
			ALL RECORDS:C47([INVOICES:39])
			ALL RECORDS:C47([INVOICES:39])
			If (Not:C34($_bo_Validation))
				//   `QUERY([INVOICES];[INVOICES]ALLOCATIONS'xTransferred#1)
			End if 
			//QUERY([INVOICES];[INVOICES]Invoice No="*R@")
			//CREATE SET([INVOICES];"C_A")
			If (False:C215)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Invoiced:5<0; *)
				QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10>=0)
				CREATE SET:C116([INVOICES:39]; "C_B")
				UNION:C120("C_B"; "C_A"; "C_A")
				USE SET:C118("C_A")
				
			End if 
			CREATE SET:C116([INVOICES:39]; "ToUpdate")
			If ($_bo_ValidationReport)
				$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
			End if 
			
			If ($_bo_Messages)
				Open window:C153(40; 40; 300; 150; -1984)
			End if 
			$_l_RecordsToUpdate:=Records in selection:C76([INVOICES:39])
			READ WRITE:C146([INVOICES:39])
			$_l_RecordCount:=0
			$_bo_Start:=False:C215
			If (In transaction:C397)
				Transact_End
				$_bo_Start:=True:C214
			End if 
			
			SI_AllocationDeleteDuplicates
			If ($_bo_Start)
				StartTransaction
			End if 
			
			For ($_l_UpdateIndex; 1; $_l_RecordsToUpdate)
				$_l_RecordCount:=$_l_RecordCount+1
				
				If ($_bo_Messages)
					ERASE WINDOW:C160
					MESSAGE:C88("Record "+String:C10($_l_UpdateIndex)+" of "+String:C10($_l_RecordsToUpdate))
				End if 
				If (<>DB_bo_Exit)
					$_l_UpdateIndex:=$_l_RecordsToUpdate
				Else 
					USE SET:C118("ToUpdate")
					GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_UpdateIndex)
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; True:C214)
					SI_AllocationValidation([INVOICES:39]Invoice_Number:1; True:C214)
					SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; False:C215)
					If ($_bo_ValidationReport)
						QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
						
						$_l_CountRecordsAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
						
						$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
						$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
						//   `here validate the total
						$_l_CharacterPosition:=Position:C15("*"; [INVOICES:39]Invoice_Number:1)
						Case of 
							: ([INVOICES:39]Total_Invoiced:5>0)
								Case of 
									: ([INVOICES:39]Total_Due:7#$_r_TotalDue)
										If ([INVOICES:39]State:10#-1)
											$_r_TotalPaid:=Gen_Round(($_r_TotalPaid); 2; 2)
											$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
										Else 
											If ($_r_TotalPaid#0)
												$_r_TotalPaid:=Gen_Round(($_r_TotalPaid); 2; 2)
												$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
											Else 
												
												$_r_TotalDue:=0
											End if 
										End if 
									Else 
										$_r_TotalPaid:=Gen_Round(($_r_TotalPaid); 2; 2)
										$_r_TotalDue:=[INVOICES:39]Total_Due:7
								End case 
							: ($_l_CharacterPosition=0)
								If ([INVOICES:39]Total_Due:7#$_r_TotalDue)
									
									If ($_r_TotalPaid<0)
										$_r_TotalDue:=([INVOICES:39]Total_Invoiced:5)+($_r_TotalPaid)
									Else 
										$_r_TotalDue:=([INVOICES:39]Total_Invoiced:5)-($_r_TotalPaid)
									End if 
									
									
									
								Else 
									$_r_TotalPaid:=Gen_Round(($_r_TotalPaid); 2; 2)
									$_r_TotalDue:=[INVOICES:39]Total_Due:7
								End if 
							Else 
								If ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))>0)
									If ([INVOICES:39]Invoice_Number:1="*D@")
										If ($_r_TotalPaid<0)
											$_r_TotalPaid:=Abs:C99($_r_TotalPaid)
										Else 
											$_r_TotalPaid:=-($_r_TotalPaid)
										End if 
										$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid); 2; 2)
									Else 
										$_r_TotalPaid:=Gen_Round(($_r_TotalPaid); 2; 2)
										$_r_TotalDue:=([INVOICES:39]Total_Paid:6-$_r_TotalPaid)
										
									End if 
									
								End if 
								
						End case 
						//`   ` <<  << $_bo_TotalsError:=False\
							
						$_bo_TotalsError2:=False:C215
						
						$_l_CharacterPosition:=Position:C15("*"; [INVOICES:39]Invoice_Number:1)
						$_r_TotalPaid2:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214)
						$_r_TotalDue2:=[INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2
						$_r_TotalPaid3:=$_r_TotalPaid2
						$_l_CharacterPosition:=Position:C15("*"; [INVOICES:39]Invoice_Number:1)
						Case of 
							: ([INVOICES:39]Total_Invoiced:5>0)
								$_r_TotalPaid2:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214)
								$_r_TotalDue2:=[INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2
								$_r_TotalPaid3:=$_r_TotalPaid2
								
								Case of 
									: ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
										$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
										$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
									Else 
										$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
										$_r_TotalDue2:=[INVOICES:39]Total_Due:7
								End case 
								
							: ($_l_CharacterPosition=0)
								If ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
									If ($_r_TotalPaid2<0)
										$_r_TotalDue2:=([INVOICES:39]Total_Invoiced:5)+($_r_TotalPaid2)
									Else 
										$_r_TotalDue2:=([INVOICES:39]Total_Invoiced:5)-($_r_TotalPaid2)
									End if 
									
								Else 
									$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
									$_r_TotalDue2:=[INVOICES:39]Total_Due:7
								End if 
								
							Else 
								If ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))>0)
									If ([INVOICES:39]Invoice_Number:1="*D@")
										If ($_r_TotalPaid2<0)
											$_r_TotalPaid2:=Abs:C99($_r_TotalPaid2)
											$_r_TotalPaid3:=$_r_TotalPaid2
										Else 
											$_r_TotalPaid2:=-($_r_TotalPaid2)
											$_r_TotalPaid3:=$_r_TotalPaid2
											
										End if 
										$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
									Else 
										$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
										$_r_TotalDue2:=([INVOICES:39]Total_Paid:6-$_r_TotalPaid2)
										
									End if 
									
								End if 
								
								
						End case 
						If ([INVOICES:39]Invoice_Number:1="*@") | ([INVOICES:39]Invoice_Number:1="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
							
							Case of 
								: ([INVOICES:39]Invoice_Number:1="*C@") | ([INVOICES:39]Invoice_Number:1="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
									If (Abs:C99($_r_TotalPaid)>Abs:C99([INVOICES:39]Total_Invoiced:5))
										$_bo_TotalsError:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Invoiced:5)
									End if 
									If (Abs:C99($_r_TotalPaid2)>Abs:C99([INVOICES:39]Total_Invoiced:5))
										$_bo_TotalsError2:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Invoiced:5)
									End if 
								: ([INVOICES:39]Invoice_Number:1="*D@")
									If (Abs:C99($_r_TotalPaid)>Abs:C99([INVOICES:39]Total_Paid:6))
										$_bo_TotalsError:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Paid:6)
									End if 
									//$_r_TotalPaid:=-$_r_TotalPaid
									If (Abs:C99($_r_TotalPaid2)>Abs:C99([INVOICES:39]Total_Paid:6))
										$_bo_TotalsError2:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Paid:6)
									End if 
									
								: ([INVOICES:39]Invoice_Number:1="*R@")
									If (Abs:C99($_r_TotalPaid)>Abs:C99([INVOICES:39]Total_Paid:6))
										$_bo_TotalsError:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Paid:6)
									End if 
									If (Abs:C99($_r_TotalPaid2)>Abs:C99([INVOICES:39]Total_Paid:6))
										$_bo_TotalsError2:=True:C214
										$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Paid:6)
									End if 
							End case 
						Else 
							If (Abs:C99($_r_TotalPaid)>Abs:C99([INVOICES:39]Total_Invoiced:5))
								$_bo_TotalsError:=True:C214
								$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Invoiced:5)
							End if 
							If (Abs:C99($_r_TotalPaid2)>Abs:C99([INVOICES:39]Total_Invoiced:5))
								$_bo_TotalsError2:=True:C214
								$_r_ReportAmount:=Abs:C99([INVOICES:39]Total_Invoiced:5)
							End if 
						End if 
						
						USE SET:C118("ToUpdate")
						GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_UpdateIndex)
						
						If ($_r_TotalPaid#$_r_TotalPaid2) | ($_r_TotalDue#$_r_TotalDue2) | ($_bo_TotalsError) | ($_bo_TotalsError2) | ($_r_TotalPaid3#[INVOICES:39]Total_Paid:6) | ($_r_TotalDue2#[INVOICES:39]Total_Due:7)
							SEND PACKET:C103($_ti_DocumentRef; "-------------------------------------"+Char:C90(13))
							SEND PACKET:C103($_ti_DocumentRef; [INVOICES:39]Invoice_Number:1+Char:C90(13)+"Subrecords"+Char:C90(13))
							SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
							ARRAY TEXT:C222($_at_SubRefersInvoices; 0)
							$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
							QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
							
							$_l_CountRecordsAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
							ARRAY TEXT:C222($_at_SubRefersInvoices; $_l_CountRecordsAllocations)
							FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
							For ($_l_RefersIndex; 1; $_l_CountRecordsAllocations)
								SEND PACKET:C103($_ti_DocumentRef; String:C10([INVOICES_ALLOCATIONS:162]Amount:2)+Char:C90(9)+[INVOICES_ALLOCATIONS:162]Invoice_Number:1+Char:C90(13)+Char:C90(9))
								$_at_SubRefersInvoices{$_l_RefersIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
								NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
							End for 
							SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
							If ($_bo_TotalsError) | ($_bo_TotalsError2) | ($_r_TotalPaid3#[INVOICES:39]Total_Paid:6) | ($_r_TotalDue2#[INVOICES:39]Total_Due:7)
								If ($_bo_TotalsError)
									SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Sum of allocation subrecords "+String:C10(Abs:C99($_r_TotalPaid))+"Total Should be? "+String:C10($_r_ReportAmount)+Char:C90(13))
									
									
									If ($_bo_TotalsError2)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Sum of allocation Records"+String:C10(Abs:C99($_r_TotalPaid2))+"Total Should be? "+String:C10($_r_ReportAmount)+Char:C90(13))
										If ($_r_TotalPaid3#[INVOICES:39]Total_Paid:6)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total paid would change from "+String:C10([INVOICES:39]Total_Paid:6)+" To "+String:C10($_r_TotalPaid3)+Char:C90(13))
										End if 
										If ($_r_TotalDue2#[INVOICES:39]Total_Due:7)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total Due would change from "+String:C10([INVOICES:39]Total_Due:7)+" To "+String:C10($_r_TotalDue2)+Char:C90(13))
										End if 
									End if 
									
								Else 
									If ($_bo_TotalsError2)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Sum of allocation Records"+String:C10(Abs:C99($_r_TotalPaid2))+"Total Should be? "+String:C10($_r_ReportAmount)+Char:C90(13))
										If ($_r_TotalPaid3#[INVOICES:39]Total_Paid:6)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total paid would change from "+String:C10([INVOICES:39]Total_Paid:6)+" To "+String:C10($_r_TotalPaid3)+Char:C90(13))
										End if 
										If ($_r_TotalDue2#[INVOICES:39]Total_Due:7)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total Due would change from "+String:C10([INVOICES:39]Total_Due:7)+" To "+String:C10($_r_TotalDue2)+Char:C90(13))
										End if 
									Else 
										If ($_r_TotalPaid3#[INVOICES:39]Total_Paid:6)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total paid would change from "+String:C10([INVOICES:39]Total_Paid:6)+" To "+String:C10($_r_TotalPaid3)+Char:C90(13))
											
										End if 
										If ($_r_TotalDue2#[INVOICES:39]Total_Due:7)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"Invoice total Due would change from "+String:C10([INVOICES:39]Total_Due:7)+" To "+String:C10($_r_TotalDue2)+Char:C90(13))
										End if 
									End if 
								End if 
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+[INVOICES:39]Invoice_Number:1+Char:C90(13)+"Cross Checked Invoices(referring back)"+Char:C90(13))
								
								For ($_l_RefersIndex; 1; Size of array:C274($_at_SubRefersInvoices))
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_SubRefersInvoices{$_l_RefersIndex})
									If (Records in selection:C76([INVOICES:39])>0)
										QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
										
										ARRAY TEXT:C222($_at_SubRefersInvoices2; 0)
										ARRAY REAL:C219($_ar_SubRefersInvoicesAmounts; 0)
										$_l_CountRecordsAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
										ARRAY TEXT:C222($_at_SubRefersInvoices2; $_l_CountRecordsAllocations)
										ARRAY REAL:C219($_ar_SubRefersInvoicesAmounts; $_l_CountRecordsAllocations)
										
										FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
										For ($_l_AllocationsIndex; 1; $_l_CountRecordsAllocations)
											$_ar_SubRefersInvoicesAmounts{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Amount:2
											$_at_SubRefersInvoices2{$_l_AllocationsIndex}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
											NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
										End for 
										$_l_Invoice2Row:=Find in array:C230($_at_SubRefersInvoices2; $_t_InvoiceNumber)
										If ($_l_Invoice2Row>0)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
											SEND PACKET:C103($_ti_DocumentRef; [INVOICES:39]Invoice_Number:1+Char:C90(9))
											
											SEND PACKET:C103($_ti_DocumentRef; String:C10($_ar_SubRefersInvoicesAmounts{$_l_Invoice2Row})+Char:C90(9)+$_at_SubRefersInvoices2{$_l_Invoice2Row}+Char:C90(13)+Char:C90(9))
											
										Else 
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
											SEND PACKET:C103($_ti_DocumentRef; [INVOICES:39]Invoice_Number:1+Char:C90(9)+"Does not cross refer back to"+$_t_InvoiceNumber+Char:C90(13)+Char:C90(9))
										End if 
										
									Else 
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
										SEND PACKET:C103($_ti_DocumentRef; $_at_SubRefersInvoices{$_l_RefersIndex}+Char:C90(9)+"is not found so cannot be Cross checked"+Char:C90(13)+Char:C90(9))
										
									End if 
									
								End for 
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
							Else 
								//   `
								
							End if 
							
							INV_GetAllocations([INVOICES:39]Invoice_Number:1)
							$_t_InvoiceNumberC:=[INVOICES:39]Invoice_Number:1
							SEND PACKET:C103($_ti_DocumentRef; ((Char:C90(9))*2)+"Allocations"+Char:C90(13))
							
							
							For ($_l_RefersIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
								SEND PACKET:C103($_ti_DocumentRef; (Char:C90(9))*2)
								Case of 
									: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumberC)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xInvoiceNumber:2+Char:C90(13))
									: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#$_t_InvoiceNumberC)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xCreditNumber:3+Char:C90(13))
									: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#$_t_InvoiceNumberC)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xReceiptNumber:4+Char:C90(13))
									: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#$_t_InvoiceNumberC)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xDepositNumber:5+Char:C90(13))
									: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCrossCreditNumber:12#"")
										If ([XInvoiceAllocation:126]xCrossCreditNumber:12=$_t_InvoiceNumberC)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+"-"+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xCreditNumber:3+Char:C90(13))
										Else 
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10(-[XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xCrossCreditNumber:12+Char:C90(13))
											
										End if 
									: ([XInvoiceAllocation:126]xNegativeDepositNumber:10#"") & ([XInvoiceAllocation:126]xDepositNumber:5#"")
										If ([XInvoiceAllocation:126]xNegativeDepositNumber:10=$_t_InvoiceNumberC)
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+"-"+String:C10([XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xDepositNumber:5+Char:C90(13))
										Else 
											SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+String:C10(-[XInvoiceAllocation:126]xAmount:7)+Char:C90(9)+[XInvoiceAllocation:126]xNegativeDepositNumber:10+Char:C90(13))
											
										End if 
										
								End case 
								
								NEXT RECORD:C51([XInvoiceAllocation:126])
							End for 
							SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
						Else 
							
							
						End if 
						
					End if 
				End if 
				If ($_l_RecordCount>1000)
					If ($_bo_Validation)
						Transact_End
						StartTransaction
					End if 
					$_l_RecordCount:=0
				End if 
			End for 
			If ($_bo_Messages)
				CLOSE WINDOW:C154
			End if 
		End if 
		If ($_bo_Validation)
			VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
			Transact_End
		End if 
		
	End if 
	ERR_MethodTrackerReturn("SI_Transfer"; $_t_oldMethodName)
End if 
ERR_MethodTrackerReturn("SI_Transfer"; $_t_oldMethodName)
