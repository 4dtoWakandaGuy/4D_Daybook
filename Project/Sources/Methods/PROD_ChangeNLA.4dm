//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_ChangeNLA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/09/2011 14:48 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_NoLongerAvailable; $1; PRD_l_FilterNLA)
	C_REAL:C285(DB_l_Setting)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_ChangeNLA")
If (Count parameters:C259>=1)
	$_l_NoLongerAvailable:=$1
Else 
	$_l_NoLongerAvailable:=DB_l_Setting
End if 
PRD_l_FilterNLA:=$_l_NoLongerAvailable
ERR_MethodTrackerReturn("PROD_ChangeNLA"; $_t_oldMethodName)
