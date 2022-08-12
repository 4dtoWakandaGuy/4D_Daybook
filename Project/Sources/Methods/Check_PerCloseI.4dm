//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_PerCloseI
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

$_t_oldMethodName:=ERR_MethodTracker("Check_PerCloseI")
//Check_PerClose Invoices
OK:=1
If (([PERIODS:33]Period_Code:1="") | ([PERIODS:33]NL_Closed:5) | ([PERIODS:33]SL_Closed:7))
	Period_Find2I
	If (OK=1)
		[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
		vPeriod:=[PERIODS:33]Period_Name:2
	Else 
		[INVOICES:39]Period_Code:13:=""
		[INVOICES:39]Invoice_Date:4:=!00-00-00!
		vPeriod:=""
	End if 
End if 
ERR_MethodTrackerReturn("Check_PerCloseI"; $_t_oldMethodName)