//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_GetCurrentperiod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_CurrentPeriodSet)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName; $0; ACC_t_CurrPeriod)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ACC_GetCurrentperiod")

//Current Period needs to be set this replaces something that was done in AAAA Process
If (Not:C34(ACC_bo_CurrentPeriodSet))
	vDate:=<>DB_d_CurrentDate
	READ ONLY:C145([PERIODS:33])
	$_l_PeriodID:=Check_Period
	ACC_t_CurrPeriod:=[PERIODS:33]Period_Code:1
	ACC_bo_CurrentPeriodSet:=True:C214
	UNLOAD RECORD:C212([PERIODS:33])
End if 
$0:=ACC_t_CurrPeriod
ERR_MethodTrackerReturn("ACC_GetCurrentperiod"; $_t_oldMethodName)