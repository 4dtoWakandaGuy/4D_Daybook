//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing_Check2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 13:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_Check2")
If ([RECURRING_JOURNALS:38]Transaction_Period:12)
	vDate:=[REC_JOURNALS_DATES:160]Posting_Date:1
	$_l_PeriodID:=Check_Period
	Check_PerClose
	vDate:=<>DB_d_CurrentDate
Else 
	vDate:=<>DB_d_CurrentDate
	$_l_PeriodID:=Check_Period
	Check_PerClose
	vDate:=<>DB_d_CurrentDate
End if 
ERR_MethodTrackerReturn("Standing_Check2"; $_t_oldMethodName)