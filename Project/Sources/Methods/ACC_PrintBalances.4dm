//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/11/2010 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAccName)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vTotal)
	C_LONGINT:C283(vNo; $_l_OK)
	C_REAL:C285(vTotal; vBalance)
	C_TEXT:C284(vAccName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintBalances")
CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")


//USE SET("ListboxSet0")
//The above does not work when viewing account balances because we view them on an array
If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	If (Not:C34(SR_ReportOK("AccBalList")))
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "PL_Detail")
		If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
			If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
				PRINT SETTINGS:C106
				$_l_OK:=OK
			Else 
				$_l_OK:=1
			End if 
			If ($_l_OK=1)
				vNo:=Records in selection:C76([ACCOUNT_BALANCES:34])
				ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Period_Code:4; >)
				ACC_BalPrintHeader
				ACC_CalculateBalance("P")
				ACC_BalPrintBlank
				vAccName:="TOTAL"
				vBalance:=vTotal
				Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
				PAGE BREAK:C6
				PRT_SetPrinterPaperOptions("PL_Detail")
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ACC_PrintBalances"; $_t_oldMethodName)
