//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_VATPERIODCODE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Messages; $2)
	C_LONGINT:C283($_l_index)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_VATPERIODCODE")

If (Count parameters:C259>1)
	$_bo_Messages:=$2
Else 
	$_bo_Messages:=False:C215
End if 
If ($_bo_Messages)
	ERASE WINDOW:C160
	MESSAGE:C88("Looking for faulty TRANSACTION TAX PERIODS")
End if 

QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27>$1)
//these are probably up the creek
ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27)
For ($_l_index; 1; Records in selection:C76([TRANSACTIONS:29]))
	If ($_bo_Messages)
		ERASE WINDOW:C160
		MESSAGE:C88("(TRANSACTION TAX PERIODS)Fixing record "+String:C10($_l_index)+" of "+String:C10(Records in selection:C76([TRANSACTIONS:29]))+" TAX PERIOD "+[TRANSACTIONS:29]Tax_Period:27)
	End if 
	
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[TRANSACTIONS:29]Tax_Period:27)
	If (Records in selection:C76([PERIODS:33])=0)
		//Then it is probably wrong!
		$_t_PeriodCode:="19"+[TRANSACTIONS:29]Tax_Period:27
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
		
		If (Records in selection:C76([PERIODS:33])=0)
			//maybe its a 2000....
			$_t_PeriodCode:="20"+[TRANSACTIONS:29]Tax_Period:27
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
		End if 
	End if 
	
	If (Records in selection:C76([PERIODS:33])=1)
		//yes it exists
		
		[TRANSACTIONS:29]Tax_Period:27:=[PERIODS:33]Period_Code:1
		If ($_bo_Messages)
			GOTO XY:C161(2; 2)
			MESSAGE:C88("Fixed record-TAX PERIOD"+[TRANSACTIONS:29]Tax_Period:27)
		End if 
		DB_SaveRecord(->[TRANSACTIONS:29])
		AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
		
	End if 
	NEXT RECORD:C51([TRANSACTIONS:29])
End for 
ERR_MethodTrackerReturn("FIX_VATPERIODCODE"; $_t_oldMethodName)