//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_Find2
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
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Period; $_t_PeriodOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_Find2")
//Period_Find2
$_t_PeriodOLD:=[PERIODS:33]Period_Code:1
Period_Find
$_t_Period:=[PERIODS:33]Period_Code:1
$_t_Period:=Gen_Request("Period "+$_t_PeriodOLD+" is closed. Post to period:"; $_t_Period)
If (OK=1)
	
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_Period)
	If (Count parameters:C259=0)
		Check_PerClose
	Else 
		//NG modified May 2004 for use with area list in batch entry
		Check_PerClose($1; $2)
	End if 
	
End if 
ERR_MethodTrackerReturn("Period_Find2"; $_t_oldMethodName)
