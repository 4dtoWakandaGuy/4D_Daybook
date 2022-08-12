//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_Clear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($Set; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_PeriodFrom; ACC_t_PeriodTo; vAnalCodeT; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_Clear")
//Accounts_Clear
Start_Process
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))

If (MOD_l_CurrentModuleAccess#2)
	Gen_Alert("You do not have full access to the General Ledger Module"; "Cancel")
	OK:=0
	vD:=0
Else 
	Gen_Confirm("This function deletes all Transactions in the selected Period(s)"; ""; "")
	If (OK=1)
		Start_Process
		ACC_BalFile
		vTitle:="Accounts_Clear"
		ACC_BalSelect
		If (OK=1)
			$Set:=0
			Gen_Confirm("Do you want to set Invoices as not posted?"; "Yes"; "No")
			If (OK=1)
				$Set:=1
			End if 
			Are_You_Sure
			If (OK=1)
				READ WRITE:C146([TRANSACTIONS:29])
				
				DELETE SELECTION:C66([ACCOUNT_BALANCES:34])
				
				
				ALL RECORDS:C47([TRANSACTIONS:29])
				
				CREATE SET:C116([TRANSACTIONS:29]; "Master")
				
				Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Account_Code:3; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo)
				Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Analysis_Code:2; ACC_t_AnalysisCodeFrom; vAnalCodeT)
				Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Period_Code:12; ACC_t_PeriodFrom; ACC_t_PeriodTo)
				USE SET:C118("Master")
				
				If ($Set=1)
					READ WRITE:C146([INVOICES:39])
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"")
					FIRST RECORD:C50([TRANSACTIONS:29])
					While (Not:C34(End selection:C36([TRANSACTIONS:29])))
						RELATE ONE:C42([TRANSACTIONS:29]Invoice_Number:4)
						If (Records in selection:C76([INVOICES:39])=1)
							[INVOICES:39]State:10:=0
							[INVOICES:39]Total_Invoiced:5:=0
							[INVOICES:39]Invoice_Date:4:=!00-00-00!
							DB_SaveRecord(->[INVOICES:39])
							
						End if 
						NEXT RECORD:C51([TRANSACTIONS:29])
					End while 
				End if 
				USE SET:C118("Master")
				DELETE SELECTION:C66([TRANSACTIONS:29])
				
			End if 
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Accounts_Clear"; $_t_oldMethodName)
