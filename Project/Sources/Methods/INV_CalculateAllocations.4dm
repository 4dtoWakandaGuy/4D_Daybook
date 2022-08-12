//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CalculateAllocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllocationDate; 0)
	ARRAY REAL:C219($_ar_ABSAllocationAmount; 0)
	ARRAY REAL:C219($_ar_DisplayAllocationAmount; 0)
	ARRAY TEXT:C222($_at_Credit; 0)
	ARRAY TEXT:C222($_at_CrossCredit; 0)
	ARRAY TEXT:C222($_at_CrossDeposit; 0)
	ARRAY TEXT:C222($_at_CrossInvoice; 0)
	ARRAY TEXT:C222($_at_Deposit; 0)
	ARRAY TEXT:C222($_at_DisplayAllocSOurce; 0)
	ARRAY TEXT:C222($_at_Invoice; 0)
	ARRAY TEXT:C222($_at_Receipt; 0)
	C_BOOLEAN:C305($_bo_Find; $2)
	C_LONGINT:C283($_l_Index)
	C_REAL:C285($_r_TotalAmount; $0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CalculateAllocations")
//this method will calcualte the value of some allocations
$0:=0
ARRAY TEXT:C222($_at_Invoice; 0)
ARRAY TEXT:C222($_at_Credit; 0)
ARRAY TEXT:C222($_at_Receipt; 0)
ARRAY TEXT:C222($_at_Deposit; 0)
ARRAY TEXT:C222($_at_CrossCredit; 0)
ARRAY TEXT:C222($_at_CrossInvoice; 0)
ARRAY DATE:C224($_ad_AllocationDate; 0)
ARRAY REAL:C219($_ar_ABSAllocationAmount; 0)

If (Count parameters:C259>=1)
	If ($1#"")
		If (Count parameters:C259>=2)
			$_bo_Find:=$2
		Else 
			$_bo_Find:=True:C214
		End if 
		If ($_bo_Find)
			INV_GetAllocations($1)
		End if 
		
		SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xInvoiceNumber:2; $_at_Invoice; [XInvoiceAllocation:126]xCreditNumber:3; $_at_Credit; [XInvoiceAllocation:126]xReceiptNumber:4; $_at_Receipt; [XInvoiceAllocation:126]xDepositNumber:5; $_at_Deposit; [XInvoiceAllocation:126]xAllocationDate:6; $_ad_AllocationDate; [XInvoiceAllocation:126]xAmount:7; $_ar_ABSAllocationAmount; [XInvoiceAllocation:126]xCrossCreditNumber:12; $_at_CrossCredit; [XInvoiceAllocation:126]xCrossInvoiceNumber:11; $_at_CrossInvoice; [XInvoiceAllocation:126]xNegativeDepositNumber:10; $_at_CrossDeposit)
		
		ARRAY REAL:C219($_ar_DisplayAllocationAmount; Size of array:C274($_at_Invoice))
		ARRAY TEXT:C222($_at_DisplayAllocSOurce; Size of array:C274($_at_Invoice))
		$0:=0
		$_r_TotalAmount:=0
		For ($_l_Index; 1; Size of array:C274($_at_Invoice))
			Case of 
				: ($1="*R@")
					Case of 
						: ($_at_Invoice{$_l_Index}#"")  //²
							//the invoice
							$_at_DisplayAllocSOurce{$_l_Index}:="Invoice:"+$_at_Invoice{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							
						: ($_at_Credit{$_l_Index}#"")  //²
							//theCredit
							$_at_DisplayAllocSOurce{$_l_Index}:="Credit:"+$_at_Credit{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
						: ($_at_Deposit{$_l_Index}#"")  //²
							//theDeposit
							$_at_DisplayAllocSOurce{$_l_Index}:="Deposit:"+$_at_Deposit{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							
							
							
					End case 
					
				: ($1="*D@")
					Case of 
						: ($_at_Invoice{$_l_Index}#"")
							//the invoice
							$_at_DisplayAllocSOurce{$_l_Index}:="Invoice:"+$_at_Invoice{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
						: ($_at_Credit{$_l_Index}#"")  //SHOULD NOT  HAPPEN
							//theCredit
							$_at_DisplayAllocSOurce{$_l_Index}:="Credit:"+$_at_Credit{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
						: ($_at_Receipt{$_l_Index}#"")  //²
							//theReceipt
							$_at_DisplayAllocSOurce{$_l_Index}:="Receipt:"+$_at_Receipt{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
						: ($_at_CrossDeposit{$_l_Index}#"")
							If ($_at_CrossDeposit{$_l_Index}=$1)
								$_at_DisplayAllocSOurce{$_l_Index}:="Reverse Deposit:"+$1
								$_ar_DisplayAllocationAmount{$_l_Index}:=-$_ar_ABSAllocationAmount{$_l_Index}
							Else 
								$_at_DisplayAllocSOurce{$_l_Index}:="Deposit:"+$1
								$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							End if 
							
					End case 
				: ($1="*C@") | ($1="C@")
					Case of 
						: ($_at_Invoice{$_l_Index}#"")
							//the invoice
							$_at_DisplayAllocSOurce{$_l_Index}:="Invoice:"+$_at_Invoice{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=-($_ar_ABSAllocationAmount{$_l_Index})
						: ($_at_Deposit{$_l_Index}#"")
							//theCredit
							$_at_DisplayAllocSOurce{$_l_Index}:="Deposit:"+$_at_Deposit{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							
							
							
						: ($_at_Receipt{$_l_Index}#"")  //²
							//theReceipt
							$_at_DisplayAllocSOurce{$_l_Index}:="Receipt:"+$_at_Receipt{$_l_Index}
							$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							
						: ($_at_CrossCredit{$_l_Index}#"")
							If ($_at_CrossCredit{$_l_Index}=$1)
								$_at_DisplayAllocSOurce{$_l_Index}:="Credit:"+$_at_Receipt{$_l_Index}
								If ($_ar_ABSAllocationAmount{$_l_Index}>0)
									$_ar_DisplayAllocationAmount{$_l_Index}:=-($_ar_ABSAllocationAmount{$_l_Index})
								Else 
									$_ar_DisplayAllocationAmount{$_l_Index}:=($_ar_ABSAllocationAmount{$_l_Index})
								End if 
								
							Else 
								$_at_DisplayAllocSOurce{$_l_Index}:="Reverse Credit:"+$_at_Receipt{$_l_Index}
								$_ar_DisplayAllocationAmount{$_l_Index}:=-($_ar_ABSAllocationAmount{$_l_Index})
							End if 
							
					End case 
				Else 
					If ([INVOICES:39]Total_Invoiced:5>0)
						Case of 
							: ($_at_Credit{$_l_Index}#"") & ($_at_Credit{$_l_Index}#"")
								//the Credit
								$_at_DisplayAllocSOurce{$_l_Index}:="Credit:"+$_at_Credit{$_l_Index}
								If (False:C215)
									If ($_ar_ABSAllocationAmount{$_l_Index}>=0)
										$_ar_DisplayAllocationAmount{$_l_Index}:=-($_ar_ABSAllocationAmount{$_l_Index})
									Else 
										
										$_ar_DisplayAllocationAmount{$_l_Index}:=Abs:C99($_ar_ABSAllocationAmount{$_l_Index})
									End if 
								End if 
								$_ar_DisplayAllocationAmount{$_l_Index}:=($_ar_ABSAllocationAmount{$_l_Index})
							: ($_at_Deposit{$_l_Index}#"")  //SHOULD NOT  HAPPEN
								//theCredit
								$_at_DisplayAllocSOurce{$_l_Index}:="Deposit:"+$_at_Deposit{$_l_Index}
								$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
							: ($_at_Receipt{$_l_Index}#"")  //²
								//theReceipt
								$_at_DisplayAllocSOurce{$_l_Index}:="Receipt:"+$_at_Receipt{$_l_Index}
								$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
								
						End case 
					Else   // it is a credit
						Case of 
							: ($_at_Invoice{$_l_Index}#"") & ($_at_Credit{$_l_Index}#"")
								//the invoice
								$_at_DisplayAllocSOurce{$_l_Index}:="Invoice:"+$_at_Invoice{$_l_Index}
								$_ar_DisplayAllocationAmount{$_l_Index}:=-$_ar_ABSAllocationAmount{$_l_Index}
							: ($_at_Deposit{$_l_Index}#"")  //SHOULD NOT  HAPPEN
								//thedeposit
								$_at_DisplayAllocSOurce{$_l_Index}:="Deposit:"+$_at_Deposit{$_l_Index}
								
								$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
								
								
							: ($_at_Receipt{$_l_Index}#"")  //²
								//theReceipt
								$_at_DisplayAllocSOurce{$_l_Index}:="Receipt:"+$_at_Receipt{$_l_Index}
								$_ar_DisplayAllocationAmount{$_l_Index}:=$_ar_ABSAllocationAmount{$_l_Index}
								
								
						End case 
					End if 
			End case 
			$_r_TotalAmount:=$_r_TotalAmount+$_ar_DisplayAllocationAmount{$_l_Index}
		End for 
		$0:=$_r_TotalAmount
		
	End if 
End if 
ERR_MethodTrackerReturn("INV_CalculateAllocations"; $_t_oldMethodName)