//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintProfitLossoneyear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/04/2011 12:02 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; DB_l_CurrentDisplayedForm; vAB)
	C_TEXT:C284($_t_MenuParameter; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintProfitLossoneyear")




$_t_MenuParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuParameter:=Get selected menu item parameter:C1005
End if 
If ($_t_MenuParameter#"NoCurrentSelection@")
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
	vAB:=1
	If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
		Gen_Confirm("Use on screen selection"; "No"; "Yes")
		
		If (OK=1)
			ACC_BalPL12
		Else 
			ACC_BalPL12(False:C215)
		End if 
	Else 
		ACC_BalPL12
	End if 
	
	
Else 
	If ($_t_MenuParameter="NoCurrentSelection")
		
		$_l_Process:=New process:C317("ACC_PrintProfitLossoneyear"; 256000; "Profit & Loss One Year"; "NoCurrentSelection2")
	Else 
		vAB:=1
		Start_Process
		ACC_BalPL12
		Process_End
	End if 
End if 
ERR_MethodTrackerReturn("ACC_PrintProfitLossoneyear"; $_t_oldMethodName)