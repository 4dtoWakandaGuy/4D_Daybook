//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB_InLPTot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 17:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	C_BOOLEAN:C305($1)
	C_REAL:C285($_r_BatchAmount; $_r_BatchTax; $_r_BatchTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InLPTot")
//Modified NG July 2004 to work with area list area

If (Count parameters:C259=0)
	[TRANSACTION_BATCHES:30]Batch_Amount:3:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
	[TRANSACTION_BATCHES:30]Batch_Tax:4:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
	[TRANSACTION_BATCHES:30]Batch_Total:5:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
Else 
	Case of 
		: ($1)  //using area list
			$_r_BatchAmount:=0
			$_r_BatchTax:=0
			$_r_BatchTotal:=0
			$_r_BatchAmount:=Sum:C1(ACC_ar_BatchItemAmounts)
			$_r_BatchTax:=Sum:C1(ACC_ar_BatchItemTaxAmt)
			$_r_BatchTotal:=Sum:C1(ACC_ar_BatchItemTotal)
			
			//For ($i;1;Size of array(ACC_al_BatchItemID))
			//$_r_BatchAmount:=$_r_BatchAmount+ACC_ar_BatchItemAmounts{$i}
			//$_r_BatchTax:=$_r_BatchTax+ACC_ar_BatchItemTaxAmt{$i}
			//$_r_BatchTotal:=$_r_BatchTotal+ACC_ar_BatchItemTotal{$i}
			
			//End for 
			
			[TRANSACTION_BATCHES:30]Batch_Amount:3:=Gen_Round($_r_BatchAmount; 2; 2)
			[TRANSACTION_BATCHES:30]Batch_Tax:4:=Gen_Round($_r_BatchTax; 2; 2)
			[TRANSACTION_BATCHES:30]Batch_Total:5:=Gen_Round($_r_BatchTotal; 2; 2)
			
		Else 
			[TRANSACTION_BATCHES:30]Batch_Amount:3:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
			[TRANSACTION_BATCHES:30]Batch_Tax:4:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
			[TRANSACTION_BATCHES:30]Batch_Total:5:=Gen_Round(Sum:C1([TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
	End case 
End if 
ERR_MethodTrackerReturn("TransB_InLPTot"; $_t_oldMethodName)
