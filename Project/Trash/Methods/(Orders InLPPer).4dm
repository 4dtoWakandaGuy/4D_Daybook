//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPPer
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
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPPer")
vDate:=[ORDERS:24]Order_Date:4
$_l_PeriodID:=Check_Period
[ORDERS:24]Order_Period:42:=[PERIODS:33]Period_Code:1
ERR_MethodTrackerReturn("Orders_InLPPer"; $_t_oldMethodName)