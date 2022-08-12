//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintTaxReturn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/04/2011 12:41 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; VaB)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintTaxReturn")
$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
If ($_t_MenuItemParameter="NoCurrentSelection")
	$_l_Process:=New process:C317("ACC_PrintTaxReturn"; 256000; "Tax Report")
Else 
	Start_Process
	VaB:=1
	ACC_PrintTaxReturnPart2
	Process_End
End if 
ERR_MethodTrackerReturn("ACC_PrintTaxReturn"; $_t_oldMethodName)