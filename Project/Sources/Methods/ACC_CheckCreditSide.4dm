//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_CheckCreditSide
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TransactionDisableValidation; $_bo_CheckAll; $_bo_CheckAll2; $_bo_DoSaves; $_bo_OK; $_bo_Update; $5; $6)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchNumber; $_l_Delay; $_l_Index; $_l_ParentID; $_l_Repeats; $_l_ThisSideID; $0; $1; $2; DS_l_BATCHITEMRef)
	C_POINTER:C301($7)
	C_REAL:C285($_r_ParentTaxTotal; $_r_ParentTotal; $_r_SubAmount; $_r_SubTaxAmount; $_r_SubTaxTotal; $_r_SubTotal; $3; $4)
	C_TEXT:C284($_t_analysis; $_t_CurrencyCode; $_t_Layer; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_CheckCreditSide")

//$1=The id of the side we were checking
//$2=The ID of this side
//$3=The amount
//$4=The vat amount
$_t_oldMethodName:=ERR_MethodTracker("ACC_CheckCreditSide")

If (Count parameters:C259>=5)
	$_bo_CheckAll:=$5
Else 
	$_bo_CheckAll:=True:C214
End if 
If (Count parameters:C259>=7)
	$_bo_DoSaves:=$6
Else 
	$_bo_DoSaves:=True:C214
End if 

$0:=0
If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
	[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
	DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
End if 

$_l_ThisSideID:=0
If ($2>0)
	If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$2)
		$_l_Repeats:=0
		$_l_Delay:=180
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 180)
			If (Not:C34($_bo_OK))
				//IDLE
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
				End if 
				DelayTicks(2*$_l_Delay)
				
			End if 
			
		Until ($_bo_OK=True:C214)
		$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10) & ([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12) & ([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Tax_Amount:16=$4)
		If ($_bo_OK)
			$0:=[TRANSACTIONS:29]Transaction_ID:31
			$_l_ThisSideID:=[TRANSACTIONS:29]Transaction_ID:31
			$_l_BatchItemID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
			If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#$2)
				[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=$2
				If ($_bo_DoSaves)
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
				Else 
					$7->:=True:C214
				End if 
				
			End if 
			ACC_PutOtherSide($2; $1; $_l_BatchItemID)
			
		Else 
			If ([TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28=1) & ([TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
				$_bo_OK:=True:C214
			End if 
			If ($_bo_OK)
				$0:=[TRANSACTIONS:29]Transaction_ID:31
			Else 
				$0:=[TRANSACTIONS:29]Transaction_ID:31
				$_l_ThisSideID:=[TRANSACTIONS:29]Transaction_ID:31
				$_l_BatchItemID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
				If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26#$_l_ThisSideID)
					[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=$_l_ThisSideID
					$_bo_Update:=True:C214
				Else 
					$_bo_Update:=False:C215
				End if 
				
				If (Count parameters:C259<6)
					ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $3; $4)
				Else 
					ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $3; $4; $6; $7)
					
				End if 
				If ($_bo_Update)
					[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=$_l_ThisSideID
					If ($_bo_DoSaves)
						If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
							[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						DB_SaveRecord(->[TRANSACTION_BATCHES:30])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
					Else 
						$7->:=True:C214
					End if 
				End if 
				If ($1>0) & ($_l_ThisSideID>0)
					ACC_PutOtherSide($1; $_l_ThisSideID; $_l_BatchItemID)
					ACC_PutOtherSide($_l_ThisSideID; $1; $_l_BatchItemID)
				Else 
					If ($1>0)
						READ WRITE:C146([TRANSACTIONS:29])
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$1)
						[TRANSACTIONS:29]Transaction_OtherSideID:32:=$_l_ThisSideID
						[TRANSACTIONS:29]BatchItem_X_ID:30:=$_l_BatchItemID
						While (Semaphore:C143("TRANSACTIONUPDATE"))
							DelayTicks
						End while 
						<>TransactionDisableValidation:=True:C214
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						DB_SaveRecord(->[TRANSACTIONS:29])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
						<>TransactionDisableValidation:=False:C215
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
					End if 
					If ($_l_ThisSideID>0)
						READ WRITE:C146([TRANSACTIONS:29])
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ThisSideID)
						[TRANSACTIONS:29]Transaction_OtherSideID:32:=$1
						[TRANSACTIONS:29]BatchItem_X_ID:30:=$_l_BatchItemID
						While (Semaphore:C143("TRANSACTIONUPDATE"))
							DelayTicks
						End while 
						<>TransactionDisableValidation:=True:C214
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						DB_SaveRecord(->[TRANSACTIONS:29])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
						<>TransactionDisableValidation:=False:C215
						SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
						
					End if 
					
				End if 
			End if 
		End if 
	Else 
		$0:=0
		QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$1)
		$_r_SubAmount:=0
		$_r_SubTaxAmount:=0
		$_bo_CheckAll2:=False:C215
		If (Records in selection:C76([TRANS_MULTI:128])>0)  //9
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$1)
			$_t_analysis:=[TRANSACTIONS:29]Analysis_Code:2
			$_t_Layer:=[TRANSACTIONS:29]Layer_Code:23
			$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
			$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
			//this is the ONE transaction of a multi
			//We can now validate those instead of the whole batch
			$_bo_OK:=False:C215
			For ($_l_Index; 1; Records in selection:C76([TRANS_MULTI:128]))  //10
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANS_MULTI:128]x_ManyTransID:5)
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat   //11
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
					If (Not:C34($_bo_OK))
						IDLE:C311
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
						
					End if 
				Until ($_bo_OK=True:C214)  //11
				$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber) & ([TRANSACTIONS:29]Analysis_Code:2=$_t_analysis) & ([TRANSACTIONS:29]Layer_Code:23=$_t_Layer) & ([TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
				If (Not:C34($_bo_OK))  //12
					$_l_Index:=Records in selection:C76([TRANS_MULTI:128])
				Else   //12
					$_r_SubAmount:=$_r_SubAmount+[TRANSACTIONS:29]Amount:6
					$_r_SubTaxAmount:=$_r_SubTaxAmount+[TRANSACTIONS:29]Tax_Amount:16
				End if   //12
				NEXT RECORD:C51([TRANS_MULTI:128])
			End for   //10
			If ($_bo_OK)  //13
				$_bo_OK:=$_bo_OK & (Abs:C99(Round:C94($_r_SubAmount; 2))=Abs:C99(Round:C94($3; 2))) & (Abs:C99(Round:C94($_r_SubTaxAmount; 2))=Abs:C99(Round:C94($4; 2)))
			End if   //13
			If ($_bo_OK)  //14
				$0:=0
			Else   //14
				//have to validate all
				$_bo_CheckAll2:=True:C214
			End if   //14
			
		Else   //9
			QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_ManyTransID:5=$1)
			If (Records in selection:C76([TRANS_MULTI:128])>0)  //15
				//this is one of many related to another side
				$_l_ParentID:=[TRANS_MULTI:128]X_OneTransID:2
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
				$_t_analysis:=[TRANSACTIONS:29]Analysis_Code:2
				$_t_Layer:=[TRANSACTIONS:29]Layer_Code:23
				$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
				$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
				$_r_ParentTotal:=[TRANSACTIONS:29]Amount:6
				$_r_ParentTaxTotal:=[TRANSACTIONS:29]Tax_Amount:16
				$_r_ParentTotal:=[TRANSACTIONS:29]Amount:6
				$_r_ParentTaxTotal:=[TRANSACTIONS:29]Tax_Amount:16
				QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$_l_ParentID)
				$_r_SubTotal:=0
				$_r_SubTaxTotal:=0
				$_bo_OK:=False:C215
				For ($_l_Index; 1; Records in selection:C76([TRANS_MULTI:128]))  //16
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANS_MULTI:128]x_ManyTransID:5)
					$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber) & ([TRANSACTIONS:29]Analysis_Code:2=$_t_analysis) & ([TRANSACTIONS:29]Layer_Code:23=$_t_Layer) & ([TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
					If (Not:C34($_bo_OK))  //17
						$_l_Index:=Records in selection:C76([TRANS_MULTI:128])
					Else   //17
						$_r_SubAmount:=$_r_SubAmount+[TRANSACTIONS:29]Amount:6
						$_r_SubTaxAmount:=$_r_SubTaxAmount+[TRANSACTIONS:29]Tax_Amount:16
					End if   //17
					NEXT RECORD:C51([TRANS_MULTI:128])
				End for   //16
				If ($_bo_OK)  //17
					
					$_bo_OK:=$_bo_OK & (Abs:C99(Round:C94($_r_SubAmount; 2))=Abs:C99(Round:C94($_r_ParentTotal; 2))) & (Abs:C99(Round:C94($_r_ParentTaxTotal; 2))=Abs:C99(Round:C94($_r_SubTaxAmount; 2)))
					
				End if   //17
				If ($_bo_OK)  //18
					$0:=0
				Else   //18
					$_bo_CheckAll2:=True:C214
				End if   //18
			Else   //15
				$_bo_CheckAll2:=True:C214
			End if   //15
		End if   //9
		
		If ($_bo_CheckAll) & ($_bo_CheckAll2)
			ACC_TransValidateALL([TRANSACTION_BATCHES:30]Batch_Number:10)
		End if 
		
	End if 
Else 
	If ([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26>0)
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26)
		$_l_Repeats:=0
		$_l_Delay:=1
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
			If (Not:C34($_bo_OK))
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
				End if 
				DelayTicks(2*$_l_Delay)
				
			End if 
		Until ($_bo_OK=True:C214)
		$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10) & ([TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12) & ([TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2) & ([TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20) & ([TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19) & ([TRANSACTIONS:29]Amount:6=$3) & ([TRANSACTIONS:29]Tax_Amount:16=$4)
		If ($_bo_OK)
			$0:=[TRANSACTIONS:29]Transaction_ID:31
			$_l_ThisSideID:=[TRANSACTIONS:29]Transaction_ID:31
			
			ACC_PutOtherSide([TRANSACTION_BATCH_ITEMS:155]CreditTransID:26; $1; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
		Else 
			$0:=[TRANSACTIONS:29]Transaction_ID:31
			$_l_ThisSideID:=[TRANSACTIONS:29]Transaction_ID:31
			If (Count parameters:C259<6)
				ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $3; $4)
			Else 
				ACC_ModifyTransaction([TRANSACTIONS:29]Transaction_ID:31; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; "C"; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; [TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; $3; $4; $6; $7)
				
			End if 
			ACC_PutOtherSide($2; $1; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
		End if 
	Else 
		//we dont know the transaction
		//so find it
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$3; *)
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$4)
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30=0; *)
			QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
			If (Records in selection:C76([TRANSACTIONS:29])>1)
				REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				
				If ([TRANSACTIONS:29]Transaction_ID:31=0)
					[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
				End if 
				$0:=[TRANSACTIONS:29]Transaction_ID:31
				$_l_ThisSideID:=[TRANSACTIONS:29]Transaction_ID:31
				[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=[TRANSACTIONS:29]Transaction_ID:31
				$_l_BatchItemID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
				If ($_bo_DoSaves)
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
				Else 
					$7->:=True:C214
					
				End if 
				ACC_PutOtherSide([TRANSACTIONS:29]Transaction_ID:31; $1; $_l_BatchItemID)
				
			Else 
				$0:=0
				$_l_ThisSideID:=0
				[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
				If ($_bo_DoSaves)
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
				Else 
					$7->:=True:C214
				End if 
			End if 
		Else 
			//this does not have a single other side it must be multi
			QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$1)
			$_r_SubAmount:=0
			$_r_SubTaxAmount:=0
			$_bo_CheckAll2:=False:C215
			If (Records in selection:C76([TRANS_MULTI:128])>0)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANS_MULTI:128]X_OneTransID:2)
				$_t_analysis:=[TRANSACTIONS:29]Analysis_Code:2
				$_t_Layer:=[TRANSACTIONS:29]Layer_Code:23
				$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
				$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
				$_r_ParentTotal:=[TRANSACTIONS:29]Amount:6
				$_r_ParentTaxTotal:=[TRANSACTIONS:29]Tax_Amount:16
				//this is the ONE transaction of a multi
				//We can now validate those instead of the whole batch
				$_bo_OK:=False:C215
				For ($_l_Index; 1; Records in selection:C76([TRANS_MULTI:128]))
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANS_MULTI:128]x_ManyTransID:5)
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[TRANSACTIONS:29]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber) & ([TRANSACTIONS:29]Analysis_Code:2=$_t_analysis) & ([TRANSACTIONS:29]Layer_Code:23=$_t_Layer) & ([TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
					If (Not:C34($_bo_OK))
						$_l_Index:=Records in selection:C76([TRANS_MULTI:128])
					Else 
						$_r_SubAmount:=$_r_SubAmount+[TRANSACTIONS:29]Amount:6
						$_r_SubTaxAmount:=$_r_SubTaxAmount+[TRANSACTIONS:29]Tax_Amount:16
					End if 
					NEXT RECORD:C51([TRANS_MULTI:128])
				End for 
				If ($_bo_OK)
					
					$_bo_OK:=$_bo_OK & (Abs:C99(Round:C94($_r_SubAmount; 2))=Abs:C99(Round:C94($3; 2))) & (Abs:C99(Round:C94($_r_SubTaxAmount; 2))=Abs:C99(Round:C94($4; 2)))
					
				End if 
				If ($_bo_OK)
					$0:=0
				Else 
					//have to validate all
					$_bo_CheckAll2:=True:C214
				End if 
				
			Else 
				QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_ManyTransID:5=$1)
				If (Records in selection:C76([TRANS_MULTI:128])>0)
					//this is one of many related to another side
					$_l_ParentID:=[TRANS_MULTI:128]X_OneTransID:2
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_l_ParentID)
					$_t_analysis:=[TRANSACTIONS:29]Analysis_Code:2
					$_t_Layer:=[TRANSACTIONS:29]Layer_Code:23
					$_t_CurrencyCode:=[TRANSACTIONS:29]Currency_Code:22
					$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
					$_r_ParentTotal:=[TRANSACTIONS:29]Amount:6
					$_r_ParentTaxTotal:=[TRANSACTIONS:29]Tax_Amount:16
					QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]X_OneTransID:2=$_l_ParentID)
					$_r_SubTotal:=0
					$_r_SubTaxTotal:=0
					$_bo_OK:=False:C215
					For ($_l_Index; 1; Records in selection:C76([TRANS_MULTI:128]))
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=[TRANS_MULTI:128]x_ManyTransID:5)
						$_bo_OK:=([TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber) & ([TRANSACTIONS:29]Analysis_Code:2=$_t_analysis) & ([TRANSACTIONS:29]Layer_Code:23=$_t_Layer) & ([TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
						If (Not:C34($_bo_OK))
							$_l_Index:=Records in selection:C76([TRANS_MULTI:128])
						Else 
							$_r_SubAmount:=$_r_SubAmount+[TRANSACTIONS:29]Amount:6
							$_r_SubTaxAmount:=$_r_SubTaxAmount+[TRANSACTIONS:29]Tax_Amount:16
						End if 
						NEXT RECORD:C51([TRANS_MULTI:128])
					End for 
					If ($_bo_OK)
						$_bo_OK:=$_bo_OK & (Abs:C99(Round:C94($_r_SubAmount; 2))=Abs:C99(Round:C94($_r_ParentTotal; 2))) & (Abs:C99(Round:C94($_r_ParentTaxTotal; 2))=Abs:C99(Round:C94($_r_SubTaxAmount; 2)))
						
						
					End if 
					If ($_bo_OK)
						$0:=0
					Else 
						$_bo_CheckAll2:=True:C214
					End if 
				Else 
					$_bo_CheckAll2:=True:C214
				End if 
			End if 
			
			//``
			$0:=0
			
			If ($_bo_CheckAll) & ($_bo_CheckAll2)
				ACC_TransValidateALL([TRANSACTION_BATCHES:30]Batch_Number:10)
			End if 
			
		End if 
	End if 
End if 

If ($_l_ThisSideID#$1) & ($_l_ThisSideID>0)  //this side
	$_l_BatchItemID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
	If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27#$1)
		[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=$1
		If ($_bo_DoSaves)
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
		Else 
			$7->:=True:C214
			
		End if 
	End if 
	ACC_PutOtherSide($1; $_l_ThisSideID; $_l_BatchItemID)
End if 
If ($_l_ThisSideID#0) & ($1#0)
	If ([TRANSACTION_BATCH_ITEMS:155]DebitTransID:27>0) & ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25>0)
		READ WRITE:C146([TRANSACTIONS:29])
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_ID:31#$_l_ThisSideID; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]BatchItem_X_ID:30=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
		If (Records in selection:C76([TRANSACTIONS:29])>0)
			While (Semaphore:C143("TRANSACTIONUPDATE"))
				DelayTicks
			End while 
			<>TransactionDisableValidation:=True:C214
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[TRANSACTIONS:29])
				APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]BatchItem_X_ID:30:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
			Else 
				FIRST RECORD:C50([TRANSACTIONS:29])
				For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
					
					[TRANSACTIONS:29]BatchItem_X_ID:30:=0
					DB_SaveRecord(->[TRANSACTIONS:29])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					
					AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
					NEXT RECORD:C51([TRANSACTIONS:29])
				End for 
			End if 
			
			
			<>TransactionDisableValidation:=False:C215
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			
			CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
		End if 
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_OtherSideID:32=$_l_ThisSideID)
		If (Records in selection:C76([TRANSACTIONS:29])>0)
			While (Semaphore:C143("TRANSACTIONUPDATE"))
				DelayTicks
			End while 
			<>TransactionDisableValidation:=True:C214
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[TRANSACTIONS:29])
				APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_OtherSideID:32:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
			Else 
				FIRST RECORD:C50([TRANSACTIONS:29])
				For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
					[TRANSACTIONS:29]Transaction_OtherSideID:32:=0
					DB_SaveRecord(->[TRANSACTIONS:29])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					
					AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
					NEXT RECORD:C51([TRANSACTIONS:29])
				End for 
			End if 
			
			<>TransactionDisableValidation:=False:C215
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			
			CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
		End if 
		
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31#$_l_ThisSideID; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Transaction_OtherSideID:32=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27)
		If (Records in selection:C76([TRANSACTIONS:29])>0)
			While (Semaphore:C143("TRANSACTIONUPDATE"))
				DelayTicks
			End while 
			<>TransactionDisableValidation:=True:C214
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[TRANSACTIONS:29])
				APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_OtherSideID:32:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
			Else 
				FIRST RECORD:C50([TRANSACTIONS:29])
				For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
					[TRANSACTIONS:29]Transaction_OtherSideID:32:=0
					DB_SaveRecord(->[TRANSACTIONS:29])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					AA_CheckFileUnlocked(->[TRANSACTIONS:29]BatchItem_X_ID:30)
					NEXT RECORD:C51([TRANSACTIONS:29])
				End for 
			End if 
			
			<>TransactionDisableValidation:=False:C215
			SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
			
			CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
		End if 
		
		UNLOAD RECORD:C212([TRANSACTIONS:29])
		READ ONLY:C145([TRANSACTIONS:29])
	End if 
End if 
ERR_MethodTrackerReturn("ACC_CheckCreditSide"; $_t_oldMethodName)
