//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintBalanceSheet
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
	C_LONGINT:C283($_l_Process; DB_l_CurrentDisplayedForm; vAB)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintBalanceSheet")



$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
	vAB:=1
	If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
		Gen_Confirm("Use selection on screen?"; "No"; "Yes")
		
		If (OK=1)
			AccBal_BSMC
		Else 
			AccBal_BSMC(False:C215)
		End if 
	Else 
		AccBal_BSMC
	End if 
	
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		
		$_l_Process:=New process:C317("ACC_PrintBalanceSheet"; 256000; "Balance Sheet"; "NoCurrentSelection2")
	Else 
		Start_Process
		vAB:=1
		AccBal_BSMC
		Process_End
	End if 
End if 
ERR_MethodTrackerReturn("ACC_PrintBalanceSheet"; $_t_oldMethodName)