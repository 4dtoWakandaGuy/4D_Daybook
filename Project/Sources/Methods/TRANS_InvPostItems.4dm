//%attributes = {}
If (False:C215)
	//Project Method Name:      TRANS_InvPostItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2010 20:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(INV_ar_ItemAmounts;0)
	//ARRAY REAL(INV_ar_ItemCostAmounts;0)
	//ARRAY REAL(INV_ar_ItemTax;0)
	//ARRAY REAL(INV_ar_ItemTotals;0)
	//ARRAY TEXT(INV_at_AnalCodes;0)
	//ARRAY TEXT(INV_at_ItemProductCodes;0)
	//ARRAY TEXT(INV_at_ItemProductNames;0)
	//ARRAY TEXT(INV_at_itemsSalesAcc;0)
	//ARRAY TEXT(INV_at_ItemsTaxCode;0)
	C_BOOLEAN:C305($0)
	C_DATE:C307($9)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_Index; $_l_PostIndex; $_l_SizeofArray; $_l_SizeofArrayAnalsys; $_l_VerifyMatch; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_TotalCost; $2; $3; $4; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $_t_SalesAccount; $_t_SalesAnalysis; $1; $10; $11; $12; $5; $6; $7; $8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRANS_InvPostItems")

//Inv_InvPostP
Inv_InvCalc($1; ->INV_ar_ItemAmounts; ->INV_ar_ItemTax; ->INV_ar_ItemTotals)

If (($4#vTotal) | ($3#vVAT) | ($2#vSubtotal))
	If (Application type:C494#4D Server:K5:6)
		Gen_Alert("Invoice "+[INVOICES:39]Invoice_Number:1+" was not posted because the Total figures at its base did not equal "+"the sum of its Items.  This may indicate a data corruption."; "Cancel")
	End if 
	//OK:=0
	$0:=False:C215
Else 
	$0:=True:C214
	$_t_SalesAccount:=INV_at_itemsSalesAcc{1}
	$_t_SalesAnalysis:=INV_at_AnalCodes{1}
	$_l_SizeofArrayAnalsys:=Size of array:C274(INV_at_AnalCodes)
	$_l_VerifyMatch:=0
	For ($_l_Index; 1; Size of array:C274(INV_at_AnalCodes))
		If (INV_at_AnalCodes{$_l_Index}=$_t_SalesAnalysis) & (INV_at_itemsSalesAcc{$_l_Index}=$_t_SalesAccount)
			$_l_VerifyMatch:=$_l_VerifyMatch+1
		End if 
	End for 
	
	If (($_l_SizeofArrayAnalsys>1) & ($_l_SizeofArrayAnalsys=$_l_VerifyMatch))
		CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
		[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
		[TRANSACTION_BATCH_ITEMS:155]Description:10:="All Invoice Items"
		If ($5#"")
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$5
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
		End if 
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
		[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_SalesAccount
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_t_SalesAnalysis
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
			If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
			End if 
		End if 
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
		If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
			[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16+"S"
		End if 
		[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$6
		[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$7
		[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$8
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$9
		[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$10
		[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=INV_at_ItemsTaxCode{1}
		//  RELATE ONE([TRANS IN_TRANS SUB]Tax Code)
		[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vSubtotal
		[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=vVAT
		[TRANSACTION_BATCH_ITEMS:155]Total:9:=vTotal
		[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$11
		[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$1
		[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$12
		$_r_TotalCost:=0
		For ($_l_Index; 1; Size of array:C274(INV_ar_ItemCostAmounts))
			$_r_TotalCost:=$_r_TotalCost+INV_ar_ItemCostAmounts{$_l_Index}
		End for 
		[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=Gen_Round($_r_TotalCost; 2; 2)
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
		End if 
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
	Else 
		$_l_BatchItemReference:=0
		$_l_BatchItemID:=0
		$_l_SizeofArray:=Size of array:C274(INV_at_itemsSalesAcc)
		$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_SizeofArray))-$_l_SizeofArray
		$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_SizeofArray))-$_l_SizeofArray
		For ($_l_PostIndex; 1; $_l_SizeofArray)
			
			If ((INV_ar_ItemAmounts{$_l_PostIndex}#0) | (INV_ar_ItemTax{$_l_PostIndex}#0) | (INV_ar_ItemTotals{$_l_PostIndex}#0))
				CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
				If ($_l_BatchItemID>0)
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
					$_l_BatchItemID:=$_l_BatchItemID+1
				Else 
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
				End if 
				
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSINVpost
				If (INV_at_ItemProductCodes{$_l_PostIndex}#"")
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=INV_at_ItemProductCodes{$_l_PostIndex}+" :"+INV_at_ItemProductNames{$_l_PostIndex}
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=INV_at_ItemProductNames{$_l_PostIndex}
				End if 
				If ($5#"")
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$5
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
				End if 
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
				[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=INV_at_itemsSalesAcc{$_l_PostIndex}
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=INV_at_AnalCodes{$_l_PostIndex}
				If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
					End if 
				End if 
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
				[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
				If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16+"S"
				End if 
				[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$6
				[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$7
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$8
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$9
				[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$10
				[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=INV_at_ItemsTaxCode{$_l_PostIndex}
				//  RELATE ONE([TRANS IN_TRANS SUB]Tax Code)
				[TRANSACTION_BATCH_ITEMS:155]Amount:6:=INV_ar_ItemAmounts{$_l_PostIndex}
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=INV_ar_ItemTax{$_l_PostIndex}
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=INV_ar_ItemTotals{$_l_PostIndex}
				[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$11
				[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$1
				[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$12
				[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=INV_ar_ItemCostAmounts{$_l_PostIndex}
				If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
					If ($_l_BatchItemReference>0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
						$_l_BatchItemReference:=$_l_BatchItemReference+1
					Else 
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
				End if 
				DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			End if 
			
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("TRANS_InvPostItems"; $_t_oldMethodName)
