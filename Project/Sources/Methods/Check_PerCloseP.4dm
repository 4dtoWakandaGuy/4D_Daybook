//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_PerCloseP
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
	C_TEXT:C284($_t_oldMethodName; vPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_PerCloseP")
//Check_PerClose Purchases
OK:=1
If (([PERIODS:33]Period_Code:1="") | ([PERIODS:33]NL_Closed:5) | ([PERIODS:33]PL_Closed:8))
	Period_Find2P
	If (OK=1)
		[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
		vPeriod:=[PERIODS:33]Period_Name:2
	Else 
		[PURCHASE_INVOICES:37]Period_Code:3:=""
		[PURCHASE_INVOICES:37]Invoice_Date:5:=!00-00-00!
		vPeriod:=""
	End if 
End if 
ERR_MethodTrackerReturn("Check_PerCloseP"; $_t_oldMethodName)