//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sources OutCoun
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
	C_REAL:C285($_r_TotalCostPrice)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources OutCoun")
$_r_TotalCostPrice:=Sum:C1([SOURCES:6]Cost:4)
vText:=vText+"Total Cost: "+String:C10($_r_TotalCostPrice; "|Accounts")
ERR_MethodTrackerReturn("Sources OutCoun"; $_t_oldMethodName)
