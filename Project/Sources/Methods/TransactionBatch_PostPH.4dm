//%attributes = {}
If (False:C215)
	//Project Method Name:      TransactionBatch_PostPH
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_PhantomNoZero; $_bo_PhantomReverse; $_bo_PhantomStandard; $_bo_PhantomTied; $_bo_PhantomView)
	C_LONGINT:C283($_l_AddMode; $_l_BatchNumberOLD; $_l_DuplicateIndex; $_l_RecordsinSelection; $_l_TransPostStatus; DS_l_BATCHITEMRef; Vadd; vCM)
	C_REAL:C285($_r_Tax)
	C_TEXT:C284($_t_DebitAccount; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransactionBatch_PostPH")
//START TRANSACTION
StartTransaction
$_l_TransPostStatus:=0
READ WRITE:C146([TRANSACTION_BATCHES:30])
READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
DUPLICATE RECORD:C225([TRANSACTION_BATCHES:30])
//BatchNo
//If ([TRANS IN]Batch No=0)
//OK:=0
//Else
$_l_BatchNumberOLD:=[TRANSACTION_BATCHES:30]Batch_Number:10
[TRANSACTION_BATCHES:30]Batch_Number:10:=0
BatchNo

$_bo_PhantomTied:=False:C215
$_bo_PhantomView:=False:C215
$_bo_PhantomStandard:=False:C215
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_BatchNumberOLD)
CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$DupSet")
$_l_RecordsinSelection:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
For ($_l_DuplicateIndex; 1; $_l_RecordsinSelection)
	USE SET:C118("$SupSet")
	GOTO SELECTED RECORD:C245([TRANSACTION_BATCH_ITEMS:155]; $_l_DuplicateIndex)
	DUPLICATE RECORD:C225([TRANSACTION_BATCH_ITEMS:155])
	[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
	[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
	[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
	[TRANSACTION_BATCH_ITEMS:155]ID:30:=0
	[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=0
	[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
	[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
	RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
	If (([TRANSACTION_TYPES:31]Phantom_Same_Layer:19) & ([TRANSACTION_TYPES:31]Layer_Code:16#[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20))
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=""
	Else 
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Phantom_Transaction:18
		If ([TRANSACTION_BATCH_ITEMS:155]Description:10=[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
			[TRANSACTION_TYPES:31]Transaction_Type_Name:2:=""
		End if 
		If ([TRANSACTION_TYPES:31]Phantom_Transaction:18#"")
			$_bo_PhantomTied:=[TRANSACTION_TYPES:31]Phantom_Tied:21
			$_bo_PhantomView:=[TRANSACTION_TYPES:31]Phantom_View:20
			$_bo_PhantomStandard:=[TRANSACTION_TYPES:31]Phantom_Standard:22
			$_bo_PhantomNoZero:=[TRANSACTION_TYPES:31]Phantom_No_Zero:24
			$_bo_PhantomReverse:=[TRANSACTION_TYPES:31]Phantom_Reverse:25
		End if 
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
		If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=""
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
			If ([TRANSACTION_BATCH_ITEMS:155]Description:10="")
				[TRANSACTION_BATCH_ITEMS:155]Description:10:="PH: "+[TRANSACTION_TYPES:31]Transaction_Type_Name:2
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Description:10:="PH: "+[TRANSACTION_BATCH_ITEMS:155]Description:10
			End if 
			//the new IO method made this reversal option impossible
			//  If ([Trans_Types]DC#[TRANS IN_TRANS SUB]Debit IO)
			//but now there is  Reverse check box
			If ($_bo_PhantomReverse)
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[TRANSACTION_TYPES:31]DC:3
				$_t_DebitAccount:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
				[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
				[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_DebitAccount
			End if 
			If (([TRANSACTION_TYPES:31]Debit_Account:4#"") | ([TRANSACTION_TYPES:31]Credit_Account:5#""))
				If ([TRANSACTION_TYPES:31]Debit_Account:4#"")
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
				End if 
				If ([TRANSACTION_TYPES:31]Credit_Account:5#"")
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
				End if 
				TransB_DC
			End if 
			If ($_bo_PhantomStandard)  // & ([TRANS IN_TRANS SUB]Second Amt#0))
				[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
				[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=0
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
				$_r_Tax:=[TAX_CODES:35]Tax_Rate:3/100
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6*$_r_Tax); 2)
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2)
			End if 
			If (([TRANSACTION_TYPES:31]Tax_Code:6#"") & ([TRANSACTION_TYPES:31]Tax_Code:6#[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7))
				[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
				$_r_Tax:=[TAX_CODES:35]Tax_Rate:3/100
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6*$_r_Tax); 2)
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2)
			End if 
			If (([TRANSACTION_TYPES:31]Analysis_Code:7#"") & ([TRANSACTION_TYPES:31]Analysis_Code:7#[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2))
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
			End if 
			//Insert clever Currency Transfer - recalculate figures a/c the 2 types
			//At moment, it doesn't change the Currency
			If (([TRANSACTION_TYPES:31]Layer_Code:16#"") & ([TRANSACTION_TYPES:31]Layer_Code:16#[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20))
				[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[TRANSACTION_TYPES:31]Layer_Code:16
			End if 
			If (($_bo_PhantomNoZero) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=0) & ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8=0) & ([TRANSACTION_BATCH_ITEMS:155]Total:9=0))
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=""
			End if 
			
		End if 
	End if 
	DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
	
	
	
	
End for 

//Change to the Phantom Trans & load in other changed data

//Delete the others
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="")
DELETE SELECTION:C66([TRANSACTION_BATCH_ITEMS:155])
If (($_bo_PhantomView=False:C215) | (vCM#99))
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		BatchNo
	End if 
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		OK:=0
	End if 
End if 
If (OK=1)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	TransB_InLPTot
	[TRANSACTION_BATCHES:30]Control_Amount:7:=0
	[TRANSACTION_BATCHES:30]Control_Tax:8:=0
	[TRANSACTION_BATCHES:30]Control_Total:9:=0
	[TRANSACTION_BATCHES:30]Description:12:="PH: "+[TRANSACTION_BATCHES:30]Description:12
	DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	If (OK=1)
		If (($_bo_PhantomView) & (vCM=99)) & (Application type:C494#4D Server:K5:6)
			$_l_AddMode:=Vadd
			vAdd:=1
			DBI_DisplayRecord(-Current process:C322; Table:C252(->[TRANSACTION_BATCHES:30]); "Secondary Trans Batch")
			If (OK=0)
				DELETE RECORD:C58([TRANSACTION_BATCHES:30])
				OK:=0
				$_l_TransPostStatus:=-1
			End if 
			Vadd:=$_l_AddMode
		End if 
		If (OK=1)
			$_l_TransPostStatus:=TransactionBatch_Post
		End if 
	End if 
End if 
If ((OK=0) & ($_bo_PhantomTied=False:C215))
	OK:=1
End if 
If ($_l_TransPostStatus>=0)
	//VALIDATE TRANSACTION
	Transact_End(True:C214)
Else 
	//CANCEL TRANSACTION
	Transact_End(False:C215)
End if 
ERR_MethodTrackerReturn("TransactionBatch_PostPH"; $_t_oldMethodName)
