//%attributes = {}
If (False:C215)
	//Project Method Name:      DEMO_UpdateData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:03:12If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEMO_UpdateData")

QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1="9"+"@")
If (Records in selection:C76([PERIODS:33])>0)
	READ WRITE:C146([PERIODS:33])
	FIRST RECORD:C50([PERIODS:33])
	For ($_l_Index; 1; Records in selection:C76([PERIODS:33]))
		LOAD RECORD:C52([PERIODS:33])
		[PERIODS:33]Period_Code:1:="19"+[PERIODS:33]Period_Code:1
		DB_SaveRecord(->[PERIODS:33])
		AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
		NEXT RECORD:C51([PERIODS:33])
		
	End for 
End if 



//this method set the data to a recent date.
READ WRITE:C146([TRANSACTION_BATCHES:30])
ALL RECORDS:C47([TRANSACTION_BATCHES:30])
FIRST RECORD:C50([TRANSACTION_BATCHES:30])
For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	
	For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[TRANSACTION_BATCHES:30]Batch_Date:1
		vDate:=[TRANSACTION_BATCHES:30]Batch_Date:1
		$_l_PeriodID:=Check_Period
		[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
		
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End for 
	DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
End for 
ERR_MethodTrackerReturn("DEMO_UpdateData"; $_t_oldMethodName)