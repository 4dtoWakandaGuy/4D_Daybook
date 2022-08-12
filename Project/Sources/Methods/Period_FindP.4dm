//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_FindP
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
	C_DATE:C307(<>DB_d_CurrentDate; $DATEF; $DATET; vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_FindP")
//Period_Find Purchases
$DateF:=[PERIODS:33]From_Date:3
$DateT:=[PERIODS:33]To_Date:4
vDate:=$DateT+1
$_l_PeriodID:=Check_Period
If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]PL_Closed:8))
	vDate:=$DateF-1
	$_l_PeriodID:=Check_Period
	If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]PL_Closed:8))
		vDate:=$DateT+32
		$_l_PeriodID:=Check_Period
		If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]PL_Closed:8))
			vDate:=$DateF-32
			$_l_PeriodID:=Check_Period
			If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]PL_Closed:8))
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=<>DB_d_CurrentDate; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]NL_Closed:5=False:C215; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]PL_Closed:8=False:C215)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Period_FindP"; $_t_oldMethodName)