If (False:C215)
	//object Name: [INVOICES]dPayment.Variable13
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
	C_BOOLEAN:C305($_bo_Continue)
	C_TEXT:C284($_t_oldMethodName; vAccount; vAnalysis; vBank; vLayer; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPayment.Variable13"; Form event code:C388)



Check_MinorNC(->vBank; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
If (vBank#"")
	$_bo_Continue:=Trans_SubLPLayerCode(->vBank; ->vLayer; 1)
End if 
If (vBank#"")
	$_bo_Continue:=Check_AnalAcc(->vBank; ->vAnalysis; 1)
End if 
//Gen_PaySelBank
If (vAccount#"")
	If (vTitle="Payment")
		If ((vBank#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
			If ((vBank<[TRANSACTION_TYPES:31]C_Range_F:11) | (vBank>[TRANSACTION_TYPES:31]C_Range_T:12))
				If ([TRANSACTION_TYPES:31]C_Enforce:14)
					Gen_Alert("This Account does not fall within an Invoice's required range of Bank"+" Accounts."; "Try again")
					vBank:=[TRANSACTION_TYPES:31]Credit_Account:5
					GOTO OBJECT:C206(vBank)
					Gen_PaySelBank
				Else 
					Gen_Confirm("This Account does not fall within an Invoice's advised range of Bank"+" Accounts."; "Allow"; "Try again")
					If (OK=0)
						vBank:=[TRANSACTION_TYPES:31]Credit_Account:5
						GOTO OBJECT:C206(vBank)
						Gen_PaySelBank
					End if 
				End if 
			End if 
		End if 
	Else 
		If ((vBank#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
			If ((vBank<[TRANSACTION_TYPES:31]D_Range_F:9) | (vBank>[TRANSACTION_TYPES:31]D_Range_T:10))
				If ([TRANSACTION_TYPES:31]D_Enforce:13)
					Gen_Alert("This Account does not fall within an Invoice's required range of Bank"+" Accounts."; "Try again")
					vBank:=[TRANSACTION_TYPES:31]Debit_Account:4
					GOTO OBJECT:C206(vBank)
					Gen_PaySelBank
				Else 
					Gen_Confirm("This Account does not fall within an Invoice's advised range of Bank"+" Accounts."; "Allow"; "Try again")
					If (OK=0)
						vBank:=[TRANSACTION_TYPES:31]Debit_Account:4
						GOTO OBJECT:C206(vBank)
						Gen_PaySelBank
					End if 
				End if 
			End if 
		End if 
		
	End if 
Else 
	GOTO OBJECT:C206(vBank)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dPayment.Variable13"; $_t_oldMethodName)
