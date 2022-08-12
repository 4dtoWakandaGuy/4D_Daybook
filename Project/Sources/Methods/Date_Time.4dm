//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_Time
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284(<>CurrPeriod; $_t_oldMethodName)
	C_TIME:C306(<>CTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_Time")
<>DB_d_CurrentDate:=Current date:C33
<>CTime:=Current time:C178
//Copied to AAAA & AAAA Process
vDate:=<>DB_d_CurrentDate
READ ONLY:C145([PERIODS:33])
$_l_PeriodID:=Check_Period
<>CurrPeriod:=[PERIODS:33]Period_Code:1
UNLOAD RECORD:C212([PERIODS:33])
ERR_MethodTrackerReturn("Date_Time"; $_t_oldMethodName)