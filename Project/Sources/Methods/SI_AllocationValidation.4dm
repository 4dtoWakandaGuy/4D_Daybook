//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_AllocationValidation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/06/2010 21:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllocationDates; 0)
	ARRAY INTEGER:C220($_ai_InvoicesStates; 0)
	ARRAY LONGINT:C221($_al_SubRecordsReferredState; 0)
	ARRAY LONGINT:C221($_al_Updated; 0)
	ARRAY REAL:C219($_ar_AllocationsAmounts; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_ReferredInvoices; 0)
	C_BOOLEAN:C305($_bo_IsCredit; $_bo_PeriodisClosed; $_bo_Recalculate; $_bo_Save; $2)
	C_LONGINT:C283($_l_CurrentRow; $_l_index; $_l_recordsinSelection; $_l_ReferredRow; $_l_UpdateCount)
	C_TEXT:C284($_t_First2Characters; $_t_InvoiceNumber; $_t_InvoiceNumbers; $_t_InvoicePeriodCode; $_t_oldMethodName; $_t_ThisInvoiceNumber; $1)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SI_AllocationValidation")
If (Count parameters:C259>=1)
	READ ONLY:C145([INVOICES:39])
	If ([INVOICES:39]Invoice_Number:1#$1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
	End if 
	
End if 
READ WRITE:C146([XInvoiceAllocation:126])
ARRAY REAL:C219($_ar_AllocationsAmounts; 0)
ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
ARRAY DATE:C224($_ad_AllocationDates; 0)
ARRAY LONGINT:C221($_al_Updated; 0)
$_bo_Recalculate:=False:C215
$_bo_Save:=False:C215


If ([INVOICES:39]Invoice_Number:1#"")
	$_t_InvoicePeriodCode:=[INVOICES:39]Period_Code:13
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_InvoicePeriodCode)
	$_bo_PeriodisClosed:=False:C215
	//if the period is close dont do any creation or clever validation..just make the cross referring record
	
	If ([PERIODS:33]SL_Closed:7)
		$_bo_PeriodisClosed:=True:C214
	End if 
	$_l_UpdateCount:=0
	$_t_ThisInvoiceNumber:=[INVOICES:39]Invoice_Number:1
	$_bo_Recalculate:=SI_CheckSubrecords
	If ($_t_ThisInvoiceNumber#[INVOICES:39]Invoice_Number:1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ThisInvoiceNumber)
	End if 
	ARRAY LONGINT:C221($_al_Updated; 0)
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	ARRAY REAL:C219($_ar_AllocationsAmounts; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	ARRAY TEXT:C222($_at_InvoiceNumbers; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	ARRAY DATE:C224($_ad_AllocationDates; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
	FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
	$_l_CurrentRow:=0
	
	For ($_l_index; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
		If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1#"")
			$_l_CurrentRow:=$_l_CurrentRow+1
			$_ar_AllocationsAmounts{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Amount:2
			$_at_InvoiceNumbers{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			$_ad_AllocationDates{$_l_CurrentRow}:=[INVOICES_ALLOCATIONS:162]Date:3
			
		End if 
		NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
	End for 
	QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
	SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_ReferredInvoices; [INVOICES:39]State:10; $_ai_InvoicesStates)
	ARRAY LONGINT:C221($_al_SubRecordsReferredState; 0)
	ARRAY LONGINT:C221($_al_SubRecordsReferredState; Size of array:C274($_at_InvoiceNumbers))
	//-2=Deposit
	//-3=receipt
	//-1=proforma
	//2=credit or invoice
	For ($_l_index; 1; Size of array:C274($_at_InvoiceNumbers))
		$_l_ReferredRow:=Find in array:C230($_at_ReferredInvoices; $_at_InvoiceNumbers{$_l_index})
		If ($_l_ReferredRow>0)
			$_al_SubRecordsReferredState{$_l_index}:=$_ai_InvoicesStates{$_l_ReferredRow}
		Else 
			//The referred to invoice does not exist?
			Case of 
				: ($_at_InvoiceNumbers{$_l_index}="*R@") | ($_at_InvoiceNumbers{$_l_index}="@*R@") | ($_at_InvoiceNumbers{$_l_index}="@*-R@")
					$_al_SubRecordsReferredState{$_l_index}:=-3
				: ($_at_InvoiceNumbers{$_l_index}="*D@") | ($_at_InvoiceNumbers{$_l_index}="@*D@") | ($_at_InvoiceNumbers{$_l_index}="@*-D@")
					$_al_SubRecordsReferredState{$_l_index}:=-2
				Else 
					$_al_SubRecordsReferredState{$_l_index}:=2
			End case 
		End if 
	End for 
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ThisInvoiceNumber)
	ARRAY REAL:C219($_ar_AllocationsAmounts; $_l_CurrentRow)
	ARRAY TEXT:C222($_at_InvoiceNumbers; $_l_CurrentRow)
	ARRAY DATE:C224($_ad_AllocationDates; $_l_CurrentRow)
	ARRAY LONGINT:C221($_al_Updated; $_l_CurrentRow)
	
	
	Case of 
		: ([INVOICES:39]Invoice_Number:1="@*C@") | ([INVOICES:39]Invoice_Number:1="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
			//Credit
			If (Size of array:C274($_ar_AllocationsAmounts)>0)
				For ($_l_index; 1; Size of array:C274($_ar_AllocationsAmounts))
					//  $_t_First2Characters:=$_at_InvoiceNumbers{$_l_index}≤1≥
					//  $Second2:=$_at_InvoiceNumbers{$_l_index}≤2≥
					If ($_at_InvoiceNumbers{$_l_index}="@*@") | ($_at_InvoiceNumbers{$_l_index}="C@")
						Case of 
							: ($_at_InvoiceNumbers{$_l_index}="@*C@") | ($_at_InvoiceNumbers{$_l_index}="C@")
								//A CREDIT
								//TRACE
								If ($_ar_AllocationsAmounts{$_l_index}>0)
									//Find any inversed
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_ar_AllocationsAmounts{$_l_index})
									
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index}; "XC")
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
									
								Else 
									//Find any inversed
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCrossCreditNumber:12=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_ar_AllocationsAmounts{$_l_index})
									
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}); "XC")
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
									
								End if 
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
									
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								Else 
									If (Records in selection:C76([XInvoiceAllocation:126])>1)
										$_l_recordsinSelection:=Records in selection:C76([XInvoiceAllocation:126])-1
										REDUCE SELECTION:C351([XInvoiceAllocation:126]; $_l_recordsinSelection)
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											//TRACE
											DELETE SELECTION:C66([XInvoiceAllocation:126])
										End if 
									End if 
									
								End if 
								
							: ($_at_InvoiceNumbers{$_l_index}="@*D@") | ($_al_SubRecordsReferredState{$_l_index}=-2)
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									If ($_ar_AllocationsAmounts{$_l_index}<0)
										INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									Else 
										INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; -($_ar_AllocationsAmounts{$_l_index}))
									End if 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
								
							: ($_at_InvoiceNumbers{$_l_index}="@*R@") | ($_al_SubRecordsReferredState{$_l_index}=-3)
								If ($_ar_AllocationsAmounts{$_l_index}>0)
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index}; "C")
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								Else 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}); "C")
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								End if 
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									If ($_ar_AllocationsAmounts{$_l_index}<0)
										INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									Else 
										INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; -($_ar_AllocationsAmounts{$_l_index}))
										
									End if 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										If ($_ar_AllocationsAmounts{$_l_index}<0)
											INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
										Else 
											INV_CheckMultiAllocations(""; [INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; -($_ar_AllocationsAmounts{$_l_index}))
											
										End if 
										
										
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
								
								
						End case 
					Else 
						//its a credit of an invoice
						$_bo_IsCredit:=False:C215
						$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_index})
						//Check it does refer to an invoice
						If (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
							$_bo_IsCredit:=True:C214
						End if 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
						
						If ($_bo_IsCredit)
							//A CREDIT
							//TRACE
							
							//A CREDIT
							//TRACE
							If ($_ar_AllocationsAmounts{$_l_index}>0)
								//Find any inversed
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index}; "XC")
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
								
							Else 
								//Find any inversed
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}); "XC")
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
								
							End if 
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XC")
								
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							Else 
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									$_l_recordsinSelection:=Records in selection:C76([XInvoiceAllocation:126])-1
									REDUCE SELECTION:C351([XInvoiceAllocation:126]; $_l_recordsinSelection)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								End if 
								
							End if 
							
							
							
						Else 
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index})
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_ar_AllocationsAmounts{$_l_index})
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							
							INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
							If (Records in selection:C76([XInvoiceAllocation:126])>1)
								INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								
							End if 
							$_al_Updated{$_l_index}:=1
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
								End if 
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							End if 
						End if 
						
					End if 
					
					
				End for 
			Else 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
		: ([INVOICES:39]Invoice_Number:1="@*D@") | ([INVOICES:39]State:10=-2)
			
			//Deposit
			If (Size of array:C274($_ar_AllocationsAmounts)>0)
				For ($_l_index; 1; Size of array:C274($_ar_AllocationsAmounts))
					$_t_First2Characters:=$_at_InvoiceNumbers{$_l_index}[[1]]
					// $Second2:=$_at_InvoiceNumbers{$_l_index}≤2≥
					If ($_at_InvoiceNumbers{$_l_index}="@*@") | ($_at_InvoiceNumbers{$_l_index}="C@")
						Case of 
							: ($_at_InvoiceNumbers{$_l_index}="@*D@") | ($_al_SubRecordsReferredState{$_l_index}=-2)
								//well it might sound strange but these do exist
								If ($_ar_AllocationsAmounts{$_l_index}>0)
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XD")
								Else 
									INV_AllocationFind($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XD")
								End if 
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									If ($_ar_AllocationsAmounts{$_l_index}>0)
										INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XD")
									Else 
										INV_AllocationCreate($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XD")
									End if 
									
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
									
								End if 
								
								
							: ($_at_InvoiceNumbers{$_l_index}="@*C@") | ($_at_InvoiceNumbers{$_l_index}="C@")
								If ($_ar_AllocationsAmounts{$_l_index}<0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								Else 
									//BEEP
									
								End if 
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
								
								//TRACE
							: ($_at_InvoiceNumbers{$_l_index}="@*R@") | ($_al_SubRecordsReferredState{$_l_index}=-3)
								If ($_ar_AllocationsAmounts{$_l_index}<0)
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								Else 
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -($_ar_AllocationsAmounts{$_l_index}))
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations(""; ""; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations(""; ""; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
						End case 
						
					Else 
						//its a Deposit against invoice-or it could be a credit
						$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_index})
						$_bo_IsCredit:=False:C215
						If ([INVOICES:39]Total_Invoiced:5<0) & (Records in selection:C76([INVOICES:39])>0)
							$_bo_IsCredit:=True:C214
						End if 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
						If ($_bo_IsCredit)
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=-($_ar_AllocationsAmounts{$_l_index}))
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							
							
							INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
							
							If (Records in selection:C76([XInvoiceAllocation:126])>1)
								INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								
							End if 
							$_al_Updated{$_l_index}:=1
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
								End if 
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							End if 
							
						Else 
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=-$_ar_AllocationsAmounts{$_l_index})
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
							
							If (Records in selection:C76([XInvoiceAllocation:126])>1)
								INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								
								
							End if 
							$_al_Updated{$_l_index}:=1
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; ""; $_ar_AllocationsAmounts{$_l_index})
								End if 
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							End if 
						End if 
						
					End if 
					
					
				End for 
				
			Else 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1)
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
			
		: ([INVOICES:39]Invoice_Number:1="@*R@") | ([INVOICES:39]State:10=-3)
			
			//receipt
			If (Size of array:C274($_ar_AllocationsAmounts)>0)
				For ($_l_index; 1; Size of array:C274($_ar_AllocationsAmounts))
					//$_t_First2Characters:=$_at_InvoiceNumbers{$_l_index}≤1≥
					//$Second2:=$_at_InvoiceNumbers{$_l_index}≤2≥
					If ($_at_InvoiceNumbers{$_l_index}="@*@") | ($_at_InvoiceNumbers{$_l_index}="C@")
						Case of 
							: ($_at_InvoiceNumbers{$_l_index}="@*C@") | ($_at_InvoiceNumbers{$_l_index}="C@")
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									
								End if 
								
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
							: ($_at_InvoiceNumbers{$_l_index}="@*D@") | ($_al_SubRecordsReferredState{$_l_index}=-2)
								//This little section to clear any previous ills
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_InvoiceNumbers{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								If ($_ar_AllocationsAmounts{$_l_index}<0)
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations(""; ""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations(""; ""; $_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
							: ($_at_InvoiceNumbers{$_l_index}="@*R@") | ($_al_SubRecordsReferredState{$_l_index}=-3)
								//TRACE
						End case 
						
					Else 
						//its a receiptt against invoice
						$_bo_IsCredit:=False:C215
						
						$_t_InvoiceNumbers:=[INVOICES:39]Invoice_Number:1
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_index})
						If ([INVOICES:39]Total_Invoiced:5<0) & (Records in selection:C76([INVOICES:39])>0)
							$_bo_IsCredit:=True:C214
						End if 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumbers)
						If ($_bo_IsCredit)
							//ACTUALLY IT COULD BE AGAINST A CREDIT
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
							
							If (Records in selection:C76([XInvoiceAllocation:126])>1)
								INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								
							End if 
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									INV_CheckMultiAllocations(""; $_at_InvoiceNumbers{$_l_index}; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
								End if 
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							End if 
							
						End if 
						
						If (Not:C34($_bo_IsCredit))
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
							QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
							If (Records in selection:C76([XInvoiceAllocation:126])>0)
								//TRACE
								DELETE SELECTION:C66([XInvoiceAllocation:126])
							End if 
							
							INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
							If (Records in selection:C76([XInvoiceAllocation:126])>1)
								INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; ""; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								
							End if 
							$_al_Updated{$_l_index}:=1
							If (Records in selection:C76([XInvoiceAllocation:126])=0)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; ""; ""; [INVOICES:39]Invoice_Number:1; $_ar_AllocationsAmounts{$_l_index})
								End if 
								INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								SI_SetTaxPoint
								DB_SaveRecord(->[XInvoiceAllocation:126])
								AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
							End if 
							
						End if 
						
					End if 
					
					
				End for 
				//TRACE
			Else 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
		Else 
			//it is an invoice
			If ([INVOICES:39]Total_Invoiced:5>=0)
				//it is an invoice
				If (Size of array:C274($_ar_AllocationsAmounts)>0)
					For ($_l_index; 1; Size of array:C274($_ar_AllocationsAmounts))
						//$_t_First2Characters:=$_at_InvoiceNumbers{$_l_index}≤1≥
						//$Second2:=$_at_InvoiceNumbers{$_l_index}≤2≥
						
						Case of 
							: (($_at_InvoiceNumbers{$_l_index}="*C@") | ($_at_InvoiceNumbers{$_l_index}="C@"))  // | (($_al_SubRecordsReferredState{$_l_index}=2) & (AllocationAmount{$_l_index}<0
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=-$_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
							: ($_at_InvoiceNumbers{$_l_index}="@*D@") | ($_al_SubRecordsReferredState{$_l_index}=-2)
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								
								QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$_at_InvoiceNumbers{$_l_index}; *)
								QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=-$_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>0)
									//TRACE
									DELETE SELECTION:C66([XInvoiceAllocation:126])
								End if 
								
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; ""; $_at_InvoiceNumbers{$_l_index}; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
								
							: ($_at_InvoiceNumbers{$_l_index}="@*R@") | ($_al_SubRecordsReferredState{$_l_index}=-3)
								If ($_ar_AllocationsAmounts{$_l_index}<0)
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									
								End if 
								INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
								If (Records in selection:C76([XInvoiceAllocation:126])>1)
									INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; ""; ""; $_at_InvoiceNumbers{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									
								End if 
								$_al_Updated{$_l_index}:=1
								If (Records in selection:C76([XInvoiceAllocation:126])=0)
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; ""; ""; $_at_InvoiceNumbers{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									End if 
									INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
									SI_SetTaxPoint
									DB_SaveRecord(->[XInvoiceAllocation:126])
									AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
								End if 
								
							Else 
								//its a INVOICE maybe not
								//TRACE
								
								If ([INVOICES:39]Total_Invoiced:5>0)
									$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
									$_bo_IsCredit:=False:C215
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_index})
									If (Records in selection:C76([INVOICES:39])>0) & ([INVOICES:39]Total_Invoiced:5<0)
										$_bo_IsCredit:=True:C214
									End if 
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
									
									
									If ($_bo_IsCredit)
										//this is the invoice tha allocation is against a credit
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											//TRACE
											DELETE SELECTION:C66([XInvoiceAllocation:126])
										End if 
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_ar_AllocationsAmounts{$_l_index})
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											//TRACE
											DELETE SELECTION:C66([XInvoiceAllocation:126])
										End if 
										
										INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -($_ar_AllocationsAmounts{$_l_index}); "C")
										
										If (Records in selection:C76([XInvoiceAllocation:126])>1)
											INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
											INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
											
										End if 
										$_al_Updated{$_l_index}:=1
										If (Records in selection:C76([XInvoiceAllocation:126])=0)
											QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
											QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index})
											If (Records in selection:C76([XInvoiceAllocation:126])>0)
												INV_CheckMultiAllocations([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
											End if 
											INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
											SI_SetTaxPoint
											DB_SaveRecord(->[XInvoiceAllocation:126])
											AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
										End if 
									Else 
										//Allocation is also against an invoice!
										//A CREDIT
										//
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											//TRACE
											DELETE SELECTION:C66([XInvoiceAllocation:126])
										End if 
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index})
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											//TRACE
											DELETE SELECTION:C66([XInvoiceAllocation:126])
										End if 
										
										If ($_ar_AllocationsAmounts{$_l_index}>0)
											//Find any inversed
											INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; -$_ar_AllocationsAmounts{$_l_index}; "XI")
											If (Records in selection:C76([XInvoiceAllocation:126])>0)
												//TRACE
												DELETE SELECTION:C66([XInvoiceAllocation:126])
											End if 
											INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XI")
											
										Else 
											//Find any inversed
											INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; Abs:C99($_ar_AllocationsAmounts{$_l_index}); "XI")
											If (Records in selection:C76([XInvoiceAllocation:126])>0)
												//TRACE
												DELETE SELECTION:C66([XInvoiceAllocation:126])
											End if 
											
											INV_AllocationFind([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XI")
											
										End if 
										If (Records in selection:C76([XInvoiceAllocation:126])=0)
											INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers{$_l_index}; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "XI")
											
											SI_SetTaxPoint
											DB_SaveRecord(->[XInvoiceAllocation:126])
											AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
										Else 
											If (Records in selection:C76([XInvoiceAllocation:126])>1)
												$_l_recordsinSelection:=Records in selection:C76([XInvoiceAllocation:126])-1
												REDUCE SELECTION:C351([XInvoiceAllocation:126]; $_l_recordsinSelection)
												If (Records in selection:C76([XInvoiceAllocation:126])>0)
													//TRACE
													DELETE SELECTION:C66([XInvoiceAllocation:126])
												End if 
											End if 
											
										End if 
										//````
									End if 
									
								Else 
									//this is a credit the allocation is against an invoice
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1; *)
									QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_ar_AllocationsAmounts{$_l_index})
									If (Records in selection:C76([XInvoiceAllocation:126])>0)
										//TRACE
										DELETE SELECTION:C66([XInvoiceAllocation:126])
									End if 
									INV_AllocationFind($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
									If (Records in selection:C76([XInvoiceAllocation:126])>1)
										INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
										INV_AllocationFind($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index})
										
									End if 
									$_al_Updated{$_l_index}:=1
									If (Records in selection:C76([XInvoiceAllocation:126])=0)
										QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_at_InvoiceNumbers{$_l_index}; *)
										QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=[INVOICES:39]Invoice_Number:1)
										If (Records in selection:C76([XInvoiceAllocation:126])>0)
											INV_CheckMultiAllocations($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; ""; ""; Abs:C99($_ar_AllocationsAmounts{$_l_index}))
										End if 
										INV_AllocationCreate($_at_InvoiceNumbers{$_l_index}; [INVOICES:39]Invoice_Number:1; $_ad_AllocationDates{$_l_index}; $_ar_AllocationsAmounts{$_l_index}; "C")
										
										SI_SetTaxPoint
										DB_SaveRecord(->[XInvoiceAllocation:126])
										AA_CheckFileUnlocked(->[XInvoiceAllocation:126]x_ID:1)
									End if 
								End if 
						End case 
					End for 
				Else 
					//its a negative invoice so it is a credit
				End if 
			Else 
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=[INVOICES:39]Invoice_Number:1)
				DELETE SELECTION:C66([XInvoiceAllocation:126])
			End if 
	End case 
End if 

UNLOAD RECORD:C212([XInvoiceAllocation:126])
If (Count parameters:C259>=2)
	$_bo_Save:=$2
Else 
	$_bo_Save:=False:C215
End if 

If (Not:C34(Read only state:C362([INVOICES:39])))
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	
	
	For ($_l_index; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
		If (Size of array:C274($_al_Updated)>=$_l_index)
			If ($_al_Updated{$_l_index}=1)
				[INVOICES_ALLOCATIONS:162]xTransferred:4:=1
			End if 
			DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
			NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
		Else 
			$_l_index:=9999999
		End if 
		
	End for 
	If ($_bo_Recalculate)
		INV_CheckRemainder([INVOICES:39]Invoice_Number:1; False:C215)
	End if 
	
	If ($_bo_Save)
		DB_SaveRecord(->[INVOICES:39])
	End if 
	
End if 
ERR_MethodTrackerReturn("SI_AllocationValidation"; $_t_oldMethodName)
