//%attributes = {}

If (False:C215)
	//Project Method Name:      TRNS_CreateBatch
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
	//ARRAY REAL(INV_ar_ItemAmounts;0)
	//ARRAY REAL(INV_ar_ItemCostAmounts;0)
	//ARRAY REAL(INV_ar_ItemTax;0)
	//ARRAY REAL(INV_ar_ItemTotals;0)
	//ARRAY TEXT(INV_at_AnalCodes;0)
	//ARRAY TEXT(INV_at_ItemProductCodes;0)
	//ARRAY TEXT(INV_at_ItemProductNames;0)
	//ARRAY TEXT(INV_at_itemsSalesAcc;0)
	//ARRAY TEXT(INV_at_ItemsTaxCode;0)
	C_BOOLEAN:C305(TRANS_bo_ArraysReady; TRANS_bo_FunctionReady; TRANS_bo_WaitToend)
	C_DATE:C307($2; $3)
	C_LONGINT:C283($_l_AddMode; TRANS_l_Posted; Vadd)
	C_REAL:C285($1; $10; $8; $9; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $11; $12; $13; $14; $15; $16; $4; $5; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRNS_CreateBatch")


TRANS_l_Posted:=0
$_t_oldMethodName:=ERR_MethodTracker("TRNS_CreateBatch")
If ($1#Current process:C322)
	TRANS_bo_ArraysReady:=False:C215
	ARRAY REAL:C219(INV_ar_ItemAmounts; 0)
	ARRAY REAL:C219(INV_ar_ItemTax; 0)
	ARRAY REAL:C219(INV_ar_ItemTotals; 0)
	ARRAY TEXT:C222(INV_at_ItemsTaxCode; 0)
	ARRAY TEXT:C222(INV_at_itemsSalesAcc; 0)
	ARRAY TEXT:C222(INV_at_AnalCodes; 0)
	ARRAY REAL:C219(INV_ar_ItemCostAmounts; 0)
	ARRAY TEXT:C222(INV_at_ItemProductCodes; 0)
	ARRAY TEXT:C222(INV_at_ItemProductNames; 0)
	TRANS_bo_FunctionReady:=True:C214
	TRANS_bo_WaitToend:=True:C214
	
	//we are in a process..wait for the arrays to be passed to this method
	Repeat 
		If (Not:C34(TRANS_bo_ArraysReady))
			DelayTicks(2)
		End if 
	Until (TRANS_bo_ArraysReady)
Else 
	TRANS_bo_WaitToend:=False:C215
End if 
READ WRITE:C146([TRANSACTION_BATCHES:30])
CREATE RECORD:C68([TRANSACTION_BATCHES:30])
BatchNo
If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
	OK:=0
	TRANS_l_Posted:=-1
Else 
	[TRANSACTION_BATCHES:30]Batch_Date:1:=$2
	[TRANSACTION_BATCHES:30]Entry_Date:6:=$3
	[TRANSACTION_BATCHES:30]Description:12:=$4
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$6)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$6)
	End if 
	TRANS_InvPostItems($7; $8; $9; $10; $15; $5; $11; $16; $2; $12; $13; $14)
	
	//Inv_InvPostP
	If (OK=1)
		[TRANSACTION_BATCHES:30]Batch_Amount:3:=vSubtotal
		[TRANSACTION_BATCHES:30]Batch_Tax:4:=vVAT
		[TRANSACTION_BATCHES:30]Batch_Total:5:=vTotal
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		$_l_AddMode:=Vadd
		TRANS_l_Posted:=TransactionBatch_Post
		//TRANS_l_Posted:=1
		Vadd:=$_l_AddMode
	Else 
		TRANS_l_Posted:=-1
		
	End if 
End if 

If (TRANS_bo_WaitToend)
	//wait so calling process can get value of TRANS_l_Posted
	Repeat 
		If (TRANS_bo_WaitToend)
			DelayTicks(2)
		End if 
	Until (TRANS_bo_WaitToend=False:C215)
End if 
ERR_MethodTrackerReturn("TRNS_CreateBatch"; $_t_oldMethodName)