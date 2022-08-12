//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InvWIP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($4)
	C_LONGINT:C283(DS_l_BATCHITEMRef)
	C_REAL:C285($3; vTotal)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InvWIP2")

If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>0)
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$1)
	End if 
	
	CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
	[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
	[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
	
	[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
	[TRANSACTION_BATCH_ITEMS:155]Description:10:=$2
	[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Credit_Account:5
	[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Debit_Account:4
	[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[JOBS:26]Analysis_Code:24
	If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
	End if 
	TransB_DC
	[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[JOBS:26]Job_Code:1
	[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[JOBS:26]Company_Code:3
	[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$4
	[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$5
	[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
	RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
	[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Round:C94(($3); 2)
	[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
	[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94(($3); 2)
	[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
	[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[JOBS:26]Currency_Code:25
	[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[JOBS:26]Layer_Code:26
	If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
		[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
	End if 
	DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
	
	vTotal:=Round:C94((vTotal+$3); 2)
End if 
ERR_MethodTrackerReturn("Jobs_InvWIP2"; $_t_oldMethodName)