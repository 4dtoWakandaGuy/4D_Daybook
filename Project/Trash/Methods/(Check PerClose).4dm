//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check PerClose
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate; vInvDate)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check PerClose")
//NG modified May 2004
//for use with area list this uses parameters
//Check PerClose
OK:=1
If (Count parameters:C259=0)
	
	If (([PERIODS:33]Period_Code:1="") | ([PERIODS:33]NL_Closed:5=True:C214))
		Period_Find2
		
		If (OK=0)
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=""
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=!00-00-00!
			vDate:=!00-00-00!
			vInvDate:=!00-00-00!
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
		End if 
	End if 
Else 
	If (([PERIODS:33]Period_Code:1="") | ([PERIODS:33]NL_Closed:5=True:C214))
		Period_Find2($1; $2)
		If (OK=0)
			$1->:=""
			$2->:=!00-00-00!
			vDate:=!00-00-00!
			vInvDate:=!00-00-00!
		Else 
			$1->:=[PERIODS:33]Period_Code:1
		End if 
	Else 
		$1->:=[PERIODS:33]Period_Code:1
		
	End if 
End if 
ERR_MethodTrackerReturn("Check PerClose"; $_t_oldMethodName)