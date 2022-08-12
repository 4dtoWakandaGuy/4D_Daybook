//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BatchItemCheckIO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_AllAccounts;0)
	//ARRAY TEXT(ACC_at_AllIO;0)
	C_BOOLEAN:C305(ACC_bo_AccsLoaded)
	C_LONGINT:C283($_l_AccountRow)
	C_REAL:C285($_r_CreditAmount; $_r_CreditAmount2; $_r_CreditTotal; $_r_CreditTotal2; $_r_CreditVAT; $_r_CreditVat2; $_r_DebitAmount; $_r_DebitAmount2; $_r_DebitTotal; $_r_DebitTotal2; $_r_DebitVAT)
	C_REAL:C285($_r_DebitVAT2)
	C_TEXT:C284($_Param; $_t_CreditIO; $_t_DebitIO; $_t_oldMethodName; $_t_Parameter; $0; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchItemCheckIO")
If (Not:C34(ACC_bo_AccsLoaded))
	ALL RECORDS:C47([ACCOUNTS:32])
	ARRAY TEXT:C222(ACC_at_AllAccounts; 0)
	ARRAY TEXT:C222(ACC_at_AllIO; 0)
	ACC_bo_AccsLoaded:=True:C214
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_AllAccounts; [ACCOUNTS:32]IO:5; ACC_at_AllIO)
	
End if 
$_t_Parameter:="X"
$0:=""
If (Count parameters:C259>=3)
	If ($1#"")
		$_l_AccountRow:=Find in array:C230(ACC_at_AllAccounts; $1)
		If ($_l_AccountRow>0)
			//QUERY([ACCOUNTS];[ACCOUNTS]Account Code=$1)
			If (ACC_at_AllIO{$_l_AccountRow}#$2)
				Case of 
					: ($3="D")
						$_t_DebitIO:=ACC_at_AllIO{$_l_AccountRow}  //Checking the debit side
						$_t_CreditIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; [TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; $_t_Parameter)
						Case of   //test based on accounts IO
							: (($_t_DebitIO#"N") & ($_t_CreditIO="N"))
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_CreditVAT:=0
								$_r_CreditTotal:=$_r_CreditAmount
							: (($_t_DebitIO="N") & ($_t_CreditIO#"N"))
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_DebitVAT:=0
								$_r_DebitTotal:=$_r_DebitAmount
							Else 
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						End case 
						Case of 
							: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="N"))
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_CreditVat2:=0
								$_r_CreditTotal2:=$_r_CreditAmount2
							: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"N"))
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVat2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_DebitVAT2:=0
								$_r_DebitTotal2:=$_r_DebitAmount2
							Else 
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVat2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						End case 
						If ($_r_CreditAmount2#$_r_CreditAmount) | ($_r_CreditVat2#$_r_CreditVAT) | ($_r_CreditTotal2#$_r_CreditTotal) | ($_r_DebitAmount2#$_r_DebitAmount) | ($_r_DebitVAT2#$_r_DebitVAT2) | ($_r_DebitTotal2#$_r_DebitTotal)
							//send error
							$0:=$_t_DebitIO
							ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 2; 15; -5; 0)
						Else 
							$0:=$2
						End if 
					: ($3="C")
						//checking the credit side
						$_t_CreditIO:=ACC_at_AllIO{$_l_AccountRow}  //Checking the debit side
						$_t_DebitIO:=ACC_BatchItemCheckIO([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; [TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; "X")
						Case of   //test based on accounts IO
							: (($_t_DebitIO#"N") & ($_t_CreditIO="N"))
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_CreditVAT:=0
								$_r_CreditTotal:=$_r_CreditAmount
							: (($_t_DebitIO="N") & ($_t_CreditIO#"N"))
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_DebitVAT:=0
								$_r_DebitTotal:=$_r_DebitAmount
							Else 
								$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								
								$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						End case 
						Case of 
							: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="N"))
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_CreditVat2:=0
								$_r_CreditTotal2:=$_r_CreditAmount2
							: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"N"))
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVat2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
								$_r_DebitVAT2:=0
								$_r_DebitTotal2:=$_r_DebitAmount2
							Else 
								$_r_CreditAmount2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
								$_r_CreditVat2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
								$_r_CreditTotal2:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
								
								$_r_DebitAmount2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
								$_r_DebitVAT2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
								$_r_DebitTotal2:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						End case 
						If ($_r_CreditAmount2#$_r_CreditAmount) | ($_r_CreditVat2#$_r_CreditVAT) | ($_r_CreditTotal2#$_r_CreditTotal) | ($_r_DebitAmount2#$_r_DebitAmount) | ($_r_DebitVAT2#$_r_DebitVAT2) | ($_r_DebitTotal2#$_r_DebitTotal)
							//send error
							$0:=$_t_CreditIO
							ACC_BATCHREPORTERROR([TRANSACTION_BATCHES:30]Batch_Number:10; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25; 2; 15; -5; 0)
						Else 
							$0:=$2
						End if 
					: ($3="X")  //checking the other side
						$0:=ACC_at_AllIO{$_l_AccountRow}
				End case 
				
			Else 
				$0:=$2
			End if 
		Else 
			$0:=$2
		End if 
		
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("ACC_BatchItemCheckIO"; $_t_oldMethodName)
