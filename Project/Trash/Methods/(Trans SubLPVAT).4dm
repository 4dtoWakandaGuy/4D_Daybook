//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SubLPVAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($5; $6; $7)
	C_REAL:C285($_r_Vat; vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $8; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPVAT")
If (Count parameters:C259=0)
	
	If ((([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="I@") | ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="I@")) & ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="E"))
		[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
	Else 
		If ([TAX_CODES:35]Tax_Code:1#[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
		End if 
		$_r_Vat:=[TAX_CODES:35]Tax_Rate:3/100
		[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6*$_r_Vat); 2; 2)
	End if 
	[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
	vTot:=1
	If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=""))
		vTot2:=1
	End if 
Else 
	//NG added May 2004 to work with area list area
	If ((($1="I@") | ($2="I@")) & ($3="E"))
		$6->:=0
	Else 
		If ([TAX_CODES:35]Tax_Code:1#$4)
			QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=$4)
			
		End if 
		$_r_Vat:=[TAX_CODES:35]Tax_Rate:3/100
		$6->:=Gen_Round(($5->*$_r_Vat); 2; 2)
	End if 
	$7->:=Gen_Round(($5->+$6->); 2; 2)
	vTot:=1
	If (($8="") | ($9=""))
		vTot2:=1
	End if 
End if 
ERR_MethodTrackerReturn("Trans_SubLPVAT"; $_t_oldMethodName)
