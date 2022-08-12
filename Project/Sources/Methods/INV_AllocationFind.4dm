//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_AllocationFind
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 15:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($3)
	C_LONGINT:C283($_l_OK; $_l_Point)
	C_REAL:C285($_r_Amount; $4)
	C_TEXT:C284($_t_CreditNumber; $_t_CrossCredit; $_t_CrossDeposit; $_t_CrossInvoice; $_t_DepositNumber; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumber; $_t_Type; $1; $2)
	C_TEXT:C284($5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_AllocationFind")

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
	UNLOAD RECORD:C212([XInvoiceAllocation:126])
	
	//READ ONLY([XInvoiceAllocation])
	
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
			: ($1="*@") | ($1="C@") | ($1="@*@") | ($1="-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="X@")
				//$1 is credit number
				Case of 
					: ($1="*R@") | ($1="@*R@")
						//Receipt
						$_t_ReceiptNumber:=$1
						$_r_Amount:=$4
					: ($1="*D@") | ($1="@*D@")
						//Deposit
						$_t_DepositNumber:=$1
						If ($_t_Type="XD")
							If ($4<0)
								$_t_DepositNumber:=""
								$_t_CrossDeposit:=$1
								
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_r_Amount:=$4
							End if 
						Else 
							$_r_Amount:=$4
						End if 
						
					: ($1="*C@") | ($1="C@") | ($1="@*C@") | ($1="@-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0))
						If ($_t_Type="XC")
							If ($4>0)
								$_t_CreditNumber:=$1
								
								$_r_Amount:=-$4
							Else 
								$_t_CrossCredit:=$1
								$_r_Amount:=Abs:C99($4)
							End if 
							
						Else 
							$_t_CreditNumber:=$1
							If ($2#"@*R@") & ($2#"@*D@")
								
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
				If ($2#"*R@") & ($2#"C@") & ($2#"*D@") & ($2#"@*R@") & ($2#"@C@") & ($2#"@*D@")
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
		
		If ($2="*@") | ($2="C@") | ($2="-*@") | ($2="-C@") | ($_t_Type#"")
			Case of 
				: ($2="*R@") | ($2="@*R@") | ($_t_Type="R")
					//Receipt
					$_t_ReceiptNumber:=$2
				: ($2="*D@") | ($2="@*D@") | ($_t_Type="D") | ($_t_Type="XD")
					//Deposit
					If ($_t_Type="XD")
						
						If ($_t_CrossDeposit=$1)
							
							$_t_DepositNumber:=$2
							
							
						Else 
							If ($4<0)
								
								$_t_CrossDeposit:=$_t_DepositNumber
								$_t_DepositNumber:=$2
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDeposit:=$2
								
							End if 
							
						End if 
						
					Else 
						$_t_DepositNumber:=$2
						
						
						
					End if 
					
				: ($2="*C@") | ($2="C@") | ($2="-*C@") | ($2="-C@") | ($_t_Type="C") | ($_t_Type="XC")
					//Credit
					If ($_t_CreditNumber="")
						If ($_t_Type="XC")
							If ($4<0)
								$_t_CreditNumber:=$2
							Else 
								$_t_CrossCredit:=$2
								
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
						$_t_CrossCredit:=$2
						
					End if 
				Else 
					If ($_t_Type="XI")
						If ($4<0)
							$_t_CrossInvoice:=$1
							$_t_InvoiceNumber:=$2
							$_r_Amount:=Abs:C99($4)
						Else 
							$_r_Amount:=$4
							$_t_CrossInvoice:=$2
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
			: ($2="*@") | ($2="C@") | ($2="-*@") | ($2="-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="X@")
				//$1 is credit number
				Case of 
					: ($2="*R@") | ($2="@*R@")
						//Receipt
						$_t_ReceiptNumber:=$2
						$_r_Amount:=$4
					: ($2="*D@") | ($2="@*D@")
						//Deposit
						$_t_DepositNumber:=$2
						$_r_Amount:=$4
						If ($_t_Type="XD")
							If ($4<0)
								$_t_DepositNumber:=$1
								$_t_CrossDeposit:=$2
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDeposit:=$1
								$_r_Amount:=$4
							End if 
						Else 
							$_t_DepositNumber:=$2
							$_r_Amount:=$4
						End if 
						
					: ($2="*C@") | ($2="C@") | ($2="-*C@") | ($2="-C@") | (([INVOICES:39]Total_Invoiced:5<0) & ([INVOICES:39]State:10>=0)) | ($_t_Type="XC") | ($_t_Type="C")
						//Credit against a credit?????
						If ($_t_Type="XC")
							If ($4>0)
								$_t_CreditNumber:=$2
								$_r_Amount:=-$4
							Else 
								$_t_CrossCredit:=$2
								$_r_Amount:=Abs:C99($4)
							End if 
							
						Else 
							
							//Credit against a credit?????
							$_t_CreditNumber:=$2
							If ($1#"*R@") & ($1#"*D@") & ($1#"@*R@") & ($1#"@*D@")
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
				If ($1#"*R@") & ($1#"C@") & ($1#"*D@") & ($1#"@*R@") & ($1#"@-C@") & ($1#"@*D@")
					
					If ($_t_Type="C@")
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
		If ($1="*@") | ($1="C@") | ($1="-*@") | ($1="-C@") | ($_t_Type#"")
			Case of 
				: ($1="*R@") | ($_t_Type="R") | ($1="@*R@")
					//Receipt
					$_t_ReceiptNumber:=$1
				: ($1="*D@") | ($1="@*D@") | ($_t_Type="D") | ($_t_Type="XD")
					//Deposit
					If ($_t_Type="XD")
						If ($_t_CrossDeposit=$2)
							
							$_t_DepositNumber:=$1
							
							
						Else 
							If ($4<0)
								
								$_t_CrossDeposit:=$_t_DepositNumber
								$_t_DepositNumber:=$1
								$_r_Amount:=Abs:C99($_r_Amount)
							Else 
								$_t_CrossDeposit:=$1
							End if 
							
						End if 
					Else 
						$_t_DepositNumber:=$1
						
					End if 
					
				: ($1="*C@") | ($1="C@") | ($1="-*C@") | ($1="-C@") | ($_t_Type="C")
					//Credit
					If ($_t_CreditNumber="")
						If ($_t_Type="XC")
							$_t_CrossCredit:=$1
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
							$_t_CrossInvoice:=$1
							$_t_InvoiceNumber:=$2
							$_r_Amount:=Abs:C99($4)
						Else 
							$_r_Amount:=$4
							$_t_CrossInvoice:=$2
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
	If ($_t_CrossCredit#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=$_t_CrossCredit; *)
	End if 
	If ($_t_CrossDeposit#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10=$_t_CrossDeposit; *)
	End if 
	If ($_t_CrossInvoice#"")
		QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=$_t_CrossInvoice; *)
	End if 
	
	QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_r_Amount; *)
	QUERY:C277([XInvoiceAllocation:126])
	
	
	If (Records in selection:C76([XInvoiceAllocation:126])>1)  //only use the date if more than one
		QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6=$3)
	End if 
	If (Records in selection:C76([XInvoiceAllocation:126])=0)
		If ($_t_InvoiceNumber#"") & ($_t_CreditNumber="")  //Find the credit that don't look like a credit
			
			
			If ($_t_InvoiceNumber#"")
				$_l_OK:=1
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber; *)
			End if 
			If ($_t_ReceiptNumber#"")
				$_l_OK:=$_l_OK+1
				
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber; *)  //NG April 2004 error here
			End if 
			If ($_t_DepositNumber#"")
				$_l_OK:=$_l_OK+1
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber; *)
			End if 
			If ($_t_CrossCredit#"")
				$_l_OK:=$_l_OK+1
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=$_t_CrossCredit; *)
			End if 
			If ($_t_CrossDeposit#"")
				
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10=$_t_CrossDeposit; *)
			End if 
			
			If ($_l_OK>=2)
				QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xAmount:7=$_r_Amount)
			Else 
				QUERY:C277([XInvoiceAllocation:126])
				REDUCE SELECTION:C351([XInvoiceAllocation:126]; 0)
			End if 
			
			If (Records in selection:C76([XInvoiceAllocation:126])>1)  //only use the date if more than one
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6=$3)
			End if 
			
		End if 
		
		
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("INV_AllocationFind"; $_t_oldMethodName)