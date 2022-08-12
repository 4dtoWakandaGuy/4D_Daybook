//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_AllocationCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/09/2011 12:57 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($3)
	C_LONGINT:C283($_l_Point)
	C_REAL:C285($_r_Amount; $4)
	C_TEXT:C284($_t_CreditNumber; $_t_CrossCreditNumber; $_t_CrossDepositNumber; $_t_CrossInvoiceNumber; $_t_DepositNumber; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumber; $_t_Type; $1; $2)
	C_TEXT:C284($5; $6)
End if 

//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("INV_AllocationCreate")
If (Count parameters:C259>=4)
	//NG January 2004
	//When creating a deposit agianst credit does not begin with C the system thinks it is an invoice
	//Can't move the current record pointer if it is pointing at something so added optional parameter
	//The define the type of the non current record
	
	If (Count parameters:C259>4)
		$_t_Type:=$5
	Else 
		$_t_Type:=""
	End if 
	
	READ WRITE:C146([XInvoiceAllocation:126])
	//CREATE RECORD([XInvoiceAllocation])
	//$1 is the invoice number
	//$2 is the depost/credit/receipt number
	If ([INVOICES:39]Invoice_Number:1#$1)
		If ([INVOICES:39]Invoice_Number:1#$2)
			$_l_Point:=1
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
		Else 
			$_l_Point:=2
		End if 
		
	Else 
		$_l_Point:=1
		
	End if 
	If ($_l_Point=1)
		Case of 
			: ($1="*@") | ($1="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="X@")
				//$1 is credit number
				Case of 
					: ($1="*R@") | ($1="*-R@")
						//Receipt
						$_t_ReceiptNumber:=$1
						$_r_Amount:=$4
					: ($1="*D@") | ($1="*-D@")
						//Deposit
						$_t_DepositNumber:=$1
						If ($_t_Type="XD")
							If ($4<0)
								$_t_DepositNumber:=""
								$_t_CrossDepositNumber:=$1
								
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_r_Amount:=$4
							End if 
						Else 
							$_r_Amount:=$4
						End if 
						
					: ($1="*C@") | ($1="C@") | ($1="-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
						If ($_t_Type="XC")
							If ($4>0)
								$_t_CreditNumber:=$1
								
								$_r_Amount:=-$4
							Else 
								$_t_CrossCreditNumber:=$1
								$_r_Amount:=Abs:C99($4)
							End if 
							
						Else 
							$_t_CreditNumber:=$1
							If ($2#"*R@") & ($2#"*D@") & ($2#"*-R@") & ($2#"*-D@")
								
								If ($4>0)
									$_r_Amount:=-$4
								Else 
									$_r_Amount:=Abs:C99($4)
								End if 
								
								
							Else 
								$_r_Amount:=$4
							End if 
							
						End if 
					Else 
						If ($_t_Type="XI")
							$_t_InvoiceNumber:=$1
						End if 
						
				End case 
			Else 
				$_t_InvoiceNumber:=$1
				If ($2#"*R@") & ($2#"C@") & ($2#"*D@") & (($2#"*-R@") & ($2#"*-D@") & ($2#"-C@"))
					If ($_t_Type="C@")
						$_r_Amount:=$4
					Else 
						
						If ($4>0)
							$_r_Amount:=-$4
						Else 
							$_r_Amount:=Abs:C99($4)
						End if 
					End if 
					
				Else 
					$_r_Amount:=$4
					
				End if 
				
		End case 
		
		If ($2="*@") | ($2="C@") | ($2="-C@") | ($_t_Type#"")
			Case of 
				: ($2="*R@") | ($2="*-R@") | ($_t_Type="R")
					//Receipt
					$_t_ReceiptNumber:=$2
				: ($2="*D@") | ($_t_Type="D") | ($2="*-D@") | ($_t_Type="XD")
					//Deposit
					If ($_t_Type="XD")
						
						If ($_t_CrossDepositNumber=$1)
							
							$_t_DepositNumber:=$2
							
							
						Else 
							If ($4<0)
								
								$_t_CrossDepositNumber:=$_t_DepositNumber
								$_t_DepositNumber:=$2
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDepositNumber:=$2
								
							End if 
							
						End if 
						
					Else 
						$_t_DepositNumber:=$2
						
						
						
					End if 
					
				: ($2="*C@") | ($2="C@") | ($2="-C@") | ($_t_Type="C") | ($_t_Type="XC")
					//Credit
					If ($_t_CreditNumber="")
						If ($_t_Type="XC")
							If ($4<0)
								$_t_CreditNumber:=$2
							Else 
								$_t_CrossCreditNumber:=$2
								
							End if 
							
						Else 
							$_t_CreditNumber:=$2
						End if 
						
					Else 
						$_t_InvoiceNumber:=$2
						
					End if 
					
				: ($_t_Type="XC")
					If ($4<0)
						$_t_CreditNumber:=$2
					Else 
						$_t_CrossCreditNumber:=$2
						
					End if 
				Else 
					If ($_t_Type="XI")
						If ($4<0)
							$_t_CrossInvoiceNumber:=$1
							$_t_InvoiceNumber:=$2
							$_r_Amount:=Abs:C99($4)
						Else 
							$_r_Amount:=$4
							$_t_CrossInvoiceNumber:=$2
						End if 
					End if 
					
			End case 
			
		Else 
			If ($_t_InvoiceNumber="")
				$_t_InvoiceNumber:=$2
				If ($_t_CreditNumber#"") & ($_t_DepositNumber#"")
					
					$_r_Amount:=-$_r_Amount
				End if 
				
			Else 
				$_t_CreditNumber:=$2
				
			End if 
		End if 
	Else   //Current record is$2
		Case of 
			: ($2="*@") | ($2="C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="X@")
				//$1 is credit number
				Case of 
					: ($2="*R@") | ($2="*-R@")
						//Receipt
						$_t_ReceiptNumber:=$2
						$_r_Amount:=$4
					: ($2="*D@") | ($2="*-D@")
						//Deposit
						$_t_DepositNumber:=$2
						$_r_Amount:=$4
						If ($_t_Type="XD")
							If ($4<0)
								$_t_DepositNumber:=$1
								$_t_CrossDepositNumber:=$2
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDepositNumber:=$1
								$_r_Amount:=$4
							End if 
						Else 
							$_t_DepositNumber:=$2
							$_r_Amount:=$4
						End if 
						
					: ($2="*C@") | ($2="C@") | ($2="-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="XC") | ($_t_Type="C")
						//Credit against a credit?????
						If ($_t_Type="XC")
							If ($4>0)
								$_t_CreditNumber:=$2
								$_r_Amount:=-$4
							Else 
								$_t_CrossCreditNumber:=$2
								$_r_Amount:=Abs:C99($4)
							End if 
							
						Else 
							
							//Credit against a credit?????
							$_t_CreditNumber:=$2
							If ($1#"*R@") & ($1#"*D@") & ($1#"*-R@") & ($1#"*-D@")
								If ($4>0)
									$_r_Amount:=-$4
								Else 
									$_r_Amount:=Abs:C99($4)
								End if 
							Else 
								$_r_Amount:=$4
							End if 
							
						End if 
					Else 
						
						If ($_t_Type="XI")
							$_t_InvoiceNumber:=$2
						End if 
				End case 
			Else 
				$_t_InvoiceNumber:=$2
				If ($1#"*R@") & ($1#"C@") & ($1#"*D@") & ($1#"*-R@") & ($1#"-C@") & ($1#"*-D@")
					
					If ($_t_Type="C@") | ($_t_Type="-C@")
						$_r_Amount:=$_r_Amount
					Else 
						If ($4>0)
							$_r_Amount:=-$4
						Else 
							$_r_Amount:=Abs:C99($4)
						End if 
					End if 
					
				Else 
					$_r_Amount:=$4
				End if 
				
		End case 
		If ($1="*@") | ($1="C@") | ($1="-C@") | ($_t_Type#"")
			Case of 
				: ($1="*R@") | ($1="*-R@") | ($_t_Type="R")
					//Receipt
					$_t_ReceiptNumber:=$1
				: ($1="*D@") | ($1="*-D@") | ($_t_Type="D") | ($_t_Type="XD")
					//Deposit
					If ($_t_Type="XD")
						If ($_t_CrossDepositNumber=$2)
							
							$_t_DepositNumber:=$1
							
							
						Else 
							If ($4<0)
								
								$_t_CrossDepositNumber:=$_t_DepositNumber
								$_t_DepositNumber:=$1
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDepositNumber:=$1
							End if 
							
						End if 
					Else 
						$_t_DepositNumber:=$1
						If ($_t_ReceiptNumber#"")
							If ($_r_Amount>0)
								$_r_Amount:=-$_r_Amount
							Else 
								$_r_Amount:=Abs:C99($_r_Amount)
								
							End if 
						End if 
						
					End if 
					
				: ($1="*C@") | ($1="C@") | ($1="-C@") | ($_t_Type="C")
					//Credit
					If ($_t_CreditNumber="")
						If ($_t_Type="XC")
							$_t_CrossCreditNumber:=$1
						Else 
							$_t_CreditNumber:=$1
						End if 
						If ($_t_InvoiceNumber#"")
							$_r_Amount:=-$_r_Amount
						End if 
					Else 
						$_t_InvoiceNumber:=$2
						
					End if 
					
				Else 
					
					
					If ($_t_Type="XI")
						If ($4<0)
							$_t_CrossInvoiceNumber:=$1
							$_t_InvoiceNumber:=$2
							$_r_Amount:=Abs:C99($4)
						Else 
							$_r_Amount:=$4
							$_t_CrossInvoiceNumber:=$2
						End if 
					End if 
					
			End case 
		Else 
			If ($_t_InvoiceNumber="")
				$_t_InvoiceNumber:=$1
				If ($_t_CreditNumber#"")
					
					
				End if 
				
				
			Else 
				$_t_CreditNumber:=$1
				
			End if 
		End if 
	End if 
	
	
	
	While (Semaphore:C143("CreatingAllocation"))
		DelayTicks(2)
	End while 
	
	
	
	QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber; *)
	If ($_t_CreditNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_t_CreditNumber; *)
	End if 
	If ($_t_ReceiptNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)  //NG April 2004 error here
	End if 
	If ($_t_DepositNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber; *)
	End if 
	If ($_t_CrossCreditNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=$_t_CrossCreditNumber; *)
	End if 
	If ($_t_CrossDepositNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10=$_t_CrossDepositNumber; *)
	End if 
	If ($_t_CrossInvoiceNumber#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=$_t_CrossInvoiceNumber; *)
	End if 
	
	
	QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_r_Amount; *)
	QUERY:C277([XInvoiceAllocation:126])
	
	
	If (Records in selection:C76([XInvoiceAllocation:126])>1)  //only use the date if more than one
		QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6=$3)
	End if 
	
	
	If (Records in selection:C76([XInvoiceAllocation:126])=0)
		CREATE RECORD:C68([XInvoiceAllocation:126])
		If ($_t_ReceiptNumber#"") & ($_t_InvoiceNumber="") & ($_t_CreditNumber="") & ($_t_DepositNumber="")
			//this is only happening with receipts for some reason!
			Gen_Alert("Please advise the development team of a problem in "+$_t_oldMethodName)
		End if 
		
		[XInvoiceAllocation:126]xInvoiceNumber:2:=$_t_InvoiceNumber
		[XInvoiceAllocation:126]xCreditNumber:3:=$_t_CreditNumber
		[XInvoiceAllocation:126]xReceiptNumber:4:=$_t_ReceiptNumber
		[XInvoiceAllocation:126]xDepositNumber:5:=$_t_DepositNumber
		[XInvoiceAllocation:126]xCrossInvoiceNumber:11:=$_t_CrossInvoiceNumber
		[XInvoiceAllocation:126]xCrossCreditNumber:12:=$_t_CrossCreditNumber
		[XInvoiceAllocation:126]xNegativeDepositNumber:10:=$_t_CrossDepositNumber
		[XInvoiceAllocation:126]xAllocationDate:6:=$3
		[XInvoiceAllocation:126]xAmount:7:=$_r_Amount
		
		
		
		
		If (Count parameters:C259>=6)
			If ([PERIODS:33]Period_Code:1#$6)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$6)
				[XInvoiceAllocation:126]XPeriodCode:9:=$6
				If ([PERIODS:33]From_Date:3>[XInvoiceAllocation:126]xAllocationDate:6)
					[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]From_Date:3
				Else 
					If ([PERIODS:33]To_Date:4<[XInvoiceAllocation:126]xAllocationDate:6)
						[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]To_Date:4
					Else 
						[XInvoiceAllocation:126]xTaxPointDate:8:=[XInvoiceAllocation:126]xAllocationDate:6
					End if 
				End if 
			End if 
		Else 
			If ([XInvoiceAllocation:126]XPeriodCode:9="") & ([XInvoiceAllocation:126]xAllocationDate:6#!00-00-00!)
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=[XInvoiceAllocation:126]xAllocationDate:6; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=[XInvoiceAllocation:126]xAllocationDate:6)
				[XInvoiceAllocation:126]XPeriodCode:9:=[PERIODS:33]Period_Code:1
				If ([PERIODS:33]From_Date:3>[XInvoiceAllocation:126]xAllocationDate:6)
					[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]From_Date:3
				Else 
					If ([PERIODS:33]To_Date:4<[XInvoiceAllocation:126]xAllocationDate:6)
						[XInvoiceAllocation:126]xTaxPointDate:8:=[PERIODS:33]To_Date:4
					Else 
						[XInvoiceAllocation:126]xTaxPointDate:8:=[XInvoiceAllocation:126]xAllocationDate:6
					End if 
				End if 
			End if 
		End if 
		
		
		DB_SaveRecord(->[XInvoiceAllocation:126])
	End if 
	CLEAR SEMAPHORE:C144("CreatingAllocation")
End if 
ERR_MethodTrackerReturn("INV_AllocationCreate"; $_t_oldMethodName)