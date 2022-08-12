//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_SetTaxPoint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 11:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; $_t_PeriodCode20thc; $_t_PeriodCodeOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_SetTaxPoint")
MESSAGES OFF:C175
$_t_PeriodCodeOLD:=""
If ([PERIODS:33]Period_Code:1#"")  //NG added this june 2004 to make sure current records in period dont move
	$_t_PeriodCodeOLD:=[PERIODS:33]Period_Code:1
End if 

$_t_PeriodCode:=""
If ([XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!) | ([XInvoiceAllocation:126]XPeriodCode:9="")
	If ([XInvoiceAllocation:126]xAllocationDate:6#!00-00-00!)
		Case of 
			: ([XInvoiceAllocation:126]XPeriodCode:9#"") & ([XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[XInvoiceAllocation:126]XPeriodCode:9)
				Case of 
					: ([PERIODS:33]From_Date:3>[XInvoiceAllocation:126]xAllocationDate:6)
						//allocated to a future period
						[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]From_Date:3
					: ([PERIODS:33]To_Date:4<[XInvoiceAllocation:126]xAllocationDate:6)
						//allocated to a past period
						[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]To_Date:4
					Else 
						[XInvoiceAllocation:126]xTaxPointDate:8:=[XInvoiceAllocation:126]xAllocationDate:6
				End case 
			: ([XInvoiceAllocation:126]XPeriodCode:9="") & ([XInvoiceAllocation:126]xTaxPointDate:8#!00-00-00!)
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[XInvoiceAllocation:126]xTaxPointDate:8; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[XInvoiceAllocation:126]xTaxPointDate:8)
				[XInvoiceAllocation:126]XPeriodCode:9:=[PERIODS:33]Period_Code:1
			Else 
				//neither are set
				Case of 
					: ([XInvoiceAllocation:126]xCreditNumber:3#"")
						//posting a credit against an invoice
						Case of 
							: ([XInvoiceAllocation:126]xReceiptNumber:4#"")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xCreditNumber:3; *)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=-([XInvoiceAllocation:126]xAmount:7))
								
								SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
								QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
								
								Case of 
									: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
										ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
										FIRST RECORD:C50([TRANSACTION_BATCHES:30])
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
										
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
										
									Else 
										// TRACE
										
								End case 
							: ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xInvoiceNumber:2; *)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=([XInvoiceAllocation:126]xAmount:7))
								SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
								QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
								
								Case of 
									: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
										ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
										FIRST RECORD:C50([TRANSACTION_BATCHES:30])
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
										
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
								End case 
								
							Else 
								//TRACE
						End case 
						
					: ([XInvoiceAllocation:126]xReceiptNumber:4#"")
						Case of 
							: ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xInvoiceNumber:2; *)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=([XInvoiceAllocation:126]xAmount:7))
								SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
								QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
								
								Case of 
									: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
										ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
										FIRST RECORD:C50([TRANSACTION_BATCHES:30])
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
										
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
										
									Else 
										// TRACE
										
								End case 
							: ([XInvoiceAllocation:126]xDepositNumber:5#"")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xDepositNumber:5; *)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=[XInvoiceAllocation:126]xAmount:7)
								SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
								QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
								
								Case of 
									: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
										ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
										FIRST RECORD:C50([TRANSACTION_BATCHES:30])
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
										
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									Else 
										//reverse handling
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xDepositNumber:5; *)
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=-([XInvoiceAllocation:126]xAmount:7))
										SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
										QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
										
										Case of 
											: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
												$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
												QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
												If (Records in selection:C76([PERIODS:33])=0)
													$_t_PeriodCode20thc:="19"+$_t_PeriodCode
													QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
													If (Records in selection:C76([PERIODS:33])=0)
														QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
														QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
													End if 
												End if 
												$_t_PeriodCode:=[PERIODS:33]Period_Code:1
												
											: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
												ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
												FIRST RECORD:C50([TRANSACTION_BATCHES:30])
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
												
												FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
												$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
												QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
												If (Records in selection:C76([PERIODS:33])=0)
													$_t_PeriodCode20thc:="19"+$_t_PeriodCode
													QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
													If (Records in selection:C76([PERIODS:33])=0)
														QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
														QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
													End if 
												End if 
												$_t_PeriodCode:=[PERIODS:33]Period_Code:1
											Else 
												//  TRACE
												
										End case 
										
								End case 
								
						End case 
						
					: ([XInvoiceAllocation:126]xDepositNumber:5#"")
						
						Case of 
								
							: ([XInvoiceAllocation:126]xReceiptNumber:4#"")
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[XInvoiceAllocation:126]xDepositNumber:5; *)
								QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=-([XInvoiceAllocation:126]xAmount:7))
								SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
								QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
								
								Case of 
									: (Records in selection:C76([TRANSACTION_BATCHES:30])=1)
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
										
									: (Records in selection:C76([TRANSACTION_BATCHES:30])>1)
										ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; <)
										FIRST RECORD:C50([TRANSACTION_BATCHES:30])
										FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
										$_t_PeriodCode:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
										QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
										If (Records in selection:C76([PERIODS:33])=0)
											$_t_PeriodCode20thc:="19"+$_t_PeriodCode
											QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode20thc)
											If (Records in selection:C76([PERIODS:33])=0)
												QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; *)
												QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
											End if 
										End if 
										$_t_PeriodCode:=[PERIODS:33]Period_Code:1
									Else 
										// TRACE
										
								End case 
							Else 
								//  TRACE
								
						End case 
						
				End case 
				
		End case 
		If ($_t_PeriodCode#"")
			[XInvoiceAllocation:126]XPeriodCode:9:=$_t_PeriodCode
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[XInvoiceAllocation:126]XPeriodCode:9)
			Case of 
				: ([PERIODS:33]From_Date:3>[XInvoiceAllocation:126]xAllocationDate:6)
					//allocated to a future period
					[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]From_Date:3
				: ([PERIODS:33]To_Date:4<[XInvoiceAllocation:126]xAllocationDate:6)
					//allocated to a past period
					[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]To_Date:4
				Else 
					[XInvoiceAllocation:126]xTaxPointDate:8:=[XInvoiceAllocation:126]xAllocationDate:6
			End case 
		Else 
			//the batch item was not found
			[XInvoiceAllocation:126]xTaxPointDate:8:=[XInvoiceAllocation:126]xAllocationDate:6
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[XInvoiceAllocation:126]xTaxPointDate:8; *)
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[XInvoiceAllocation:126]xTaxPointDate:8)
			[XInvoiceAllocation:126]XPeriodCode:9:=[PERIODS:33]Period_Code:1
			
		End if 
		
		
		
		
	End if 
End if 
If ($_t_PeriodCodeOLD#"")
	If ([PERIODS:33]Period_Code:1#$_t_PeriodCodeOLD)
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCodeOLD)
	End if 
Else 
	UNLOAD RECORD:C212([PERIODS:33])
	
End if 

MESSAGES ON:C181
ERR_MethodTrackerReturn("SI_SetTaxPoint"; $_t_oldMethodName)
