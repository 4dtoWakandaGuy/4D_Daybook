//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_PostToWIP
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
	C_DATE:C307($_d_CurrentDate; $_d_TransactionDate; vDate)
	C_LONGINT:C283($_l_BatchTransactionXID; $_l_PeriodID; $_l_RecordXID; $_l_TransPostStatus; $1; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_TransactionAmount)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; $_t_TransactionPeriodCode; $_t_TransTypeCode; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_PostToWIP")
//added 08/03/07 -kmw

If (Count parameters:C259>=2)
	$_l_RecordXID:=$1
	$_t_TransTypeCode:=$2
	
	
	$_l_BatchTransactionXID:=0
	$_l_BatchTransactionXID:=0
	
	Case of 
		: ($_t_TransTypeCode=<>WIP_t_TRPTrans) | ($_t_TransTypeCode=<>WIP_t_TRWTrans)
			QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_RecordXID)
			If (Records in selection:C76([DIARY:12])=0)
				//TRACE
				//shouldn't happen - unless i guess this could happen if someone add a Diary then quickly delete it - e.g...via time and cost entry screen adding a line and then changing mind
			End if 
			$_d_TransactionDate:=[DIARY:12]Date_Done_From:5
			vDate:=$_d_TransactionDate  //added 09/03/07 -kmw (vDate is used by Check_Period)
			$_l_PeriodID:=Check_Period  //modified 09/03/07 -kmw  (no longer pass $_d_TransactionDate as parameter)
			$_t_TransactionPeriodCode:=[PERIODS:33]Period_Code:1
			$_r_TransactionAmount:=[DIARY:12]Cost_Value:75  //WIP accounts only keep track of Cost amounts
			
		: ($_t_TransTypeCode=<>WIP_t_CIPTRANS) | ($_t_TransTypeCode=<>WIP_t_CIWTrans)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_RecordXID)
			If (Records in selection:C76([ORDER_ITEMS:25])=0)
				//TRACE
				//shouldn't happen - unless i guess this could happen if someone add an Order Item then quickly delete it - e.g...via time and cost entry screen adding a line and then changing mind
			End if 
			QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[ORDER_ITEMS:25]Order_Code:1)
			Case of 
				: ([ORDERS:24]Order_Date:4#!00-00-00!)
					$_d_TransactionDate:=[ORDERS:24]Order_Date:4
				: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
					$_d_TransactionDate:=[ORDERS:24]Quotation_Date:26
				Else 
					$_d_TransactionDate:=[ORDERS:24]Enquiry_Date:25
			End case 
			
			If ($_d_TransactionDate=!00-00-00!)  //if this  order item not attached to an order (eg is a cost) or if all else fails anyway just use the current date for working out which period to post to
				$_d_TransactionDate:=Current date:C33(*)
			End if 
			
			vDate:=$_d_TransactionDate  //added 09/03/07 -kmw (vDate is used by Check_Period)
			$_l_PeriodID:=Check_Period  //modified 09/03/07 -kmw  (no longer pass $_d_TransactionDate as parameter)
			$_t_TransactionPeriodCode:=[PERIODS:33]Period_Code:1
			//$_r_TransactionAmount:=[ORDER ITEMS]Sales Amount
			$_r_TransactionAmount:=[ORDER_ITEMS:25]Cost_Amount:15  //changed to cost amount 14/03/07 -kmw
			
		Else 
			//SHOULDN'T HAPPEN!
	End case 
	
	If ($_r_TransactionAmount>0)  //added 03/04/07 -kmw (no sense creating transactions for 0 values).
		
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$_t_TransTypeCode)
		
		If (Records in selection:C76([TRANSACTION_TYPES:31])>0)
			StartTransaction
			$_l_TransPostStatus:=0
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			CREATE RECORD:C68([TRANSACTION_BATCHES:30])
			BatchNo
			[TRANSACTION_BATCHES:30]Batch_Date:1:=$_d_CurrentDate
			[TRANSACTION_BATCHES:30]Entry_Date:6:=$_d_CurrentDate
			[TRANSACTION_BATCHES:30]Description:12:=$_t_TransTypeCode+" WIP Posting"  //altered to show tran Type 03/04/07 -kmw
			
			CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
			[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			$_l_BatchTransactionXID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25  //added 09/02/07 -kmw
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
			[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
			[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[JOBS:26]Analysis_Code:24
			[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
			TransB_DC
			[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[JOBS:26]Job_Code:1
			[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[JOBS:26]Company_Code:3
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_TransactionDate
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_TransactionPeriodCode
			[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_TransactionAmount
			[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_r_TransactionAmount
			[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
			[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[JOBS:26]Currency_Code:25
			[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[JOBS:26]Layer_Code:26
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			
			If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
				
				$_l_BatchTransactionXID:=[TRANSACTION_BATCHES:30]Batch_Number:10  //added 09/02/07 -kmw
				If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
					OK:=0
				Else 
					[TRANSACTION_BATCHES:30]Batch_Amount:3:=$_r_TransactionAmount
					[TRANSACTION_BATCHES:30]Batch_Tax:4:=0
					[TRANSACTION_BATCHES:30]Batch_Total:5:=$_r_TransactionAmount
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					If (OK=1)
						$_l_TransPostStatus:=TransactionBatch_Post
					End if 
				End if 
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
				If ($_l_TransPostStatus>=0)
					//VALIDATE TRANSACTION
					Transact_End(True:C214)
				Else 
					//CANCEL TRANSACTION
					Transact_End(False:C215)
				End if 
				//
				If ($_l_RecordXID#0) & ($_l_BatchTransactionXID#0) & ($_l_BatchTransactionXID#0)
					If ($_l_TransPostStatus>=0)
						Case of 
							: ($_t_TransTypeCode=<>WIP_t_TRPTrans) | ($_t_TransTypeCode=<>WIP_t_TRWTrans)
								JC_AddDiaryTimeBatchItemRel($_l_RecordXID; $_l_BatchTransactionXID; $_l_BatchTransactionXID; "WIP Tran to Time Diary")
								
							: ($_t_TransTypeCode=<>WIP_t_CIPTRANS) | ($_t_TransTypeCode=<>WIP_t_CIWTrans)
								JC_AddBatchItemOrderItemRel($_l_RecordXID; $_l_BatchTransactionXID; "WIP Tran to Order Item")
							Else 
								//shouldn't happen
								//TRACE
						End case 
					Else 
						Gen_Alert("This posting has been cancelled")
					End if 
				Else 
					//shouldn't happen
					//TRACE
				End if 
			Else 
				//TRACE
				//shouldn't happen
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("JC_PostToWIP"; $_t_oldMethodName)