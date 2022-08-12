If (False:C215)
	//object Name: [USER]User_In.Field119
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Field119"; Form event code:C388)
If ([USER:15]VAT Cash:212)
	If ([USER:15]VAT CashAcc:211="")
		Gen_Alert("Please create a Cash VAT Suspense Account and allocate "+"it before selecting this option")
		[USER:15]VAT Cash:212:=False:C215
	Else 
		Gen_Confirm("Are you want to start using the Cash VAT scheme? "+" You should only do so at the beginning of a VAT Quarter, "+"once all Invoices have been processed"+" for the former Quarter."; "Cash VAT"; "Cancel")
		If (OK=0)
			[USER:15]VAT Cash:212:=False:C215
		End if 
	End if 
Else 
	Gen_Confirm("Are you sure you want to stop using the Cash VAT scheme? "+" You should only do so at the beginning of a VAT Quarter, "+"once all Invoices have been processed"+" for the former Quarter."; "Accrual VAT"; "Cancel")
	If (OK=0)
		[USER:15]VAT Cash:212:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Field119"; $_t_oldMethodName)
