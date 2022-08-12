//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_Find2I
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; $_t_PeriodCodeEntered)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_Find2I")
//Period_Find2 Invoices
$_t_PeriodCode:=[PERIODS:33]Period_Code:1
Period_FindI
$_t_PeriodCodeEntered:=[PERIODS:33]Period_Code:1
$_t_PeriodCodeEntered:=Gen_Request("Period "+$_t_PeriodCode+" is closed. Post to period:"; $_t_PeriodCodeEntered)
If (OK=1)
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCodeEntered)
	Check_PerCloseI
End if 
ERR_MethodTrackerReturn("Period_Find2I"; $_t_oldMethodName)
