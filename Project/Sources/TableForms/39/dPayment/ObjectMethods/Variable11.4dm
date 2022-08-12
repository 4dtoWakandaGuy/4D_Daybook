If (False:C215)
	//object Name: [INVOICES]dPayment.Variable11
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
	C_REAL:C285(vPayment; vTotal)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; vCountry)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPayment.Variable11"; Form event code:C388)
If (vTotal>0)
	If ((vPayment>vTotal) & (vCountry=ACC_t_CurrencyCode))
		Gen_Confirm("That Amount is greater than the Total Due.  Are you sure?"; "Yes"; "As Due")
		If (OK=0)
			vPayment:=vTotal
		End if 
	End if 
	If (vPayment<0)
		Gen_Confirm("That Amount is negative, while the Total Due is positive.  Are you sure?"; "Yes"; "As Due")
		If (OK=0)
			vPayment:=vTotal
		End if 
	End if 
Else 
	If ((vPayment<vTotal) & (vCountry=ACC_t_CurrencyCode))
		Gen_Confirm("That Amount is greater than the Total Due.  Are you sure?"; "Yes"; "As Due")
		If (OK=0)
			vPayment:=vTotal
		End if 
	End if 
	If (vPayment>0)
		Gen_Confirm("That Amount is positive, while the Total Due is negative.  Are you sure?"; "Yes"; "As Due")
		If (OK=0)
			vPayment:=vTotal
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dPayment.Variable11"; $_t_oldMethodName)
