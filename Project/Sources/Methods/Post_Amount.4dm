//%attributes = {}
If (False:C215)
	//Project Method Name:      Post_Amount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 19:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN($12)
	//C_UNKNOWN($13)
	//C_UNKNOWN($14)
	//C_UNKNOWN($15)
	//C_UNKNOWN($16)
	//C_UNKNOWN($17)
	//C_UNKNOWN($18)
	//C_UNKNOWN($19)
	//C_UNKNOWN($21)
	//C_UNKNOWN($22)
	C_BOOLEAN:C305(vHideMessages)
	C_DATE:C307($10; $11)
	C_LONGINT:C283($0; $20)
	C_REAL:C285($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $23; $5; $6; $7; $8; $9; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Post_Amount")
//Post_Amount
While (Semaphore:C143("UpdateTransaction"+$1))
	DelayTicks(2)
End while 

CREATE RECORD:C68([TRANSACTIONS:29])
[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextIDinMethod(->[TRANSACTIONS:29]Transaction_ID:31)
$0:=[TRANSACTIONS:29]Transaction_ID:31
If (Count parameters:C259>=6)
	[TRANSACTIONS:29]Transaction_Type_Code:1:=$6
Else 
	[TRANSACTIONS:29]Transaction_Type_Code:1:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
End if 
If (Count parameters:C259>=7)
	[TRANSACTIONS:29]Analysis_Code:2:=$7
Else 
	[TRANSACTIONS:29]Analysis_Code:2:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
End if 
[TRANSACTIONS:29]Account_Code:3:=$1
If (Count parameters:C259>=8)
	[TRANSACTIONS:29]Period_Code:12:=$8
Else 
	[TRANSACTIONS:29]Period_Code:12:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
End if 
If ([TRANSACTIONS:29]Period_Code:12#[PERIODS:33]Period_Code:1)
	RELATE ONE:C42([TRANSACTIONS:29]Period_Code:12)
End if 
If ([PERIODS:33]Profit_Posted:9)
	If ([TRANSACTIONS:29]Account_Code:3#[ACCOUNTS:32]Account_Code:2)
		RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
	End if 
	If ([ACCOUNTS:32]PB:4="P")
		READ WRITE:C146([PERIODS:33])
		LOAD RECORD:C52([PERIODS:33])
		[PERIODS:33]Profit_Posted:9:=False:C215
		DB_SaveRecord(->[PERIODS:33])
		AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
		UNLOAD RECORD:C212([PERIODS:33])
		READ ONLY:C145([PERIODS:33])
		LOAD RECORD:C52([PERIODS:33])
	End if 
End if 
If (Count parameters:C259>=9)
	[TRANSACTIONS:29]Invoice_Number:4:=$9
Else 
	[TRANSACTIONS:29]Invoice_Number:4:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
End if 
If (Count parameters:C259>=10)
	[TRANSACTIONS:29]Trans_Date:5:=$10
Else 
	[TRANSACTIONS:29]Trans_Date:5:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
End if 
If (Count parameters:C259>11)
	[TRANSACTIONS:29]Entry_Date:11:=$11
Else 
	[TRANSACTIONS:29]Entry_Date:11:=[TRANSACTION_BATCHES:30]Entry_Date:6
End if 
[TRANSACTIONS:29]Amount:6:=Gen_Round($2; 2; 2)
If (Count parameters:C259>12)
	[TRANSACTIONS:29]Description:8:=$12
Else 
	[TRANSACTIONS:29]Description:8:=[TRANSACTION_BATCH_ITEMS:155]Description:10
End if 
If (Count parameters:C259>13)
	[TRANSACTIONS:29]Company_Code:9:=$13
	
Else 
	[TRANSACTIONS:29]Company_Code:9:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
End if 
If (Count parameters:C259>14)
	[TRANSACTIONS:29]Cheque_Number:13:=$14
Else 
	[TRANSACTIONS:29]Cheque_Number:13:=[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14
End if 
If (Count parameters:C259>=23)
	[TRANSACTIONS:29]Other_Side:15:=$23
Else 
	
	[TRANSACTIONS:29]Other_Side:15:=vText
End if 
If (Count parameters:C259>15)
	[TRANSACTIONS:29]Purchase_invoice_number:19:=$15
Else 
	[TRANSACTIONS:29]Purchase_invoice_number:19:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
End if 
[TRANSACTIONS:29]Tax_Amount:16:=Gen_Round($3; 2; 2)
[TRANSACTIONS:29]Total:17:=Gen_Round($4; 2; 2)
If (Count parameters:C259>=16)
	[TRANSACTIONS:29]Tax_Code:20:=$16
Else 
	[TRANSACTIONS:29]Tax_Code:20:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
End if 
//[TRANSACTIONS]DC:=[TRANS IN_TRANS SUB]Debit IO
[TRANSACTIONS:29]IO:18:=$5
If (Count parameters:C259>=17)
	[TRANSACTIONS:29]UK_EC:21:=$17
Else 
	[TRANSACTIONS:29]UK_EC:21:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
End if 
If (Count parameters:C259>=18)
	[TRANSACTIONS:29]Currency_Code:22:=$18
Else 
	[TRANSACTIONS:29]Currency_Code:22:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
End if 
If (Count parameters:C259>=19)
	[TRANSACTIONS:29]Layer_Code:23:=$19
Else 
	[TRANSACTIONS:29]Layer_Code:23:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
End if 
If (Count parameters:C259>=20)
	[TRANSACTIONS:29]Batch_Number:7:=$20
Else 
	[TRANSACTIONS:29]Batch_Number:7:=[TRANSACTION_BATCHES:30]Batch_Number:10
End if 
If (Count parameters:C259>=21)
	[TRANSACTIONS:29]Purchase_Code:24:=$21
Else 
	
	[TRANSACTIONS:29]Purchase_Code:24:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
End if 
If (Count parameters:C259>=22)
	[TRANSACTIONS:29]Job_Code:25:=$22
Else 
	[TRANSACTIONS:29]Job_Code:25:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
End if 

//EC VAT box 2 posting
If ([TRANSACTIONS:29]UK_EC:21="E")
	If (([TRANSACTIONS:29]IO:18="I") | ([TRANSACTIONS:29]IO:18="IS"))
		If ([TRANSACTIONS:29]Tax_Amount:16=0)
			If ([TAX_CODES:35]Tax_Code:1#[TRANSACTIONS:29]Tax_Code:20)
				RELATE ONE:C42([TRANSACTIONS:29]Tax_Code:20)
			End if 
			[TRANSACTIONS:29]Tax_Amount:16:=Gen_Round(([TRANSACTIONS:29]Amount:6*([TAX_CODES:35]Tax_Rate:3/100)); 2; 2)
			[TRANSACTIONS:29]Total:17:=Gen_Round(([TRANSACTIONS:29]Total:17+[TRANSACTIONS:29]Tax_Amount:16); 2; 2)
		End if 
	End if 
End if 
DB_SaveRecord(->[TRANSACTIONS:29])
CLEAR SEMAPHORE:C144("UpdateTransaction"+$1)
AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)

If (vHideMessages=False:C215) & (Application type:C494#4D Server:K5:6)  //
	MESSAGE:C88(Char:C90(13)+"      "+[TRANSACTIONS:29]Account_Code:3+"   "+[TRANSACTIONS:29]Layer_Code:23+"   "+[TRANSACTIONS:29]Currency_Code:22+" "+String:C10([TRANSACTIONS:29]Amount:6; "|Accounts"))
	If ([TRANSACTIONS:29]Tax_Amount:16#0)
		If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT) & ([TRANSACTIONS:29]IO:18="@S"))
			MESSAGE:C88(Char:C90(13)+"      "+DB_GetLedgerCashvatACC+"   "+[TRANSACTIONS:29]Layer_Code:23+"   "+[TRANSACTIONS:29]Currency_Code:22+" "+String:C10([TRANSACTIONS:29]Tax_Amount:16; "|Accounts"))
		Else 
			MESSAGE:C88(Char:C90(13)+"      "+DB_GetLedgerVatInputACC+"   "+[TRANSACTIONS:29]Layer_Code:23+"   "+[TRANSACTIONS:29]Currency_Code:22+" "+String:C10([TRANSACTIONS:29]Tax_Amount:16; "|Accounts"))
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Post_Amount"; $_t_oldMethodName)
