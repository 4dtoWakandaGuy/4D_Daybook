If (False:C215)
	//object Name: [INVOICES]dPayment.Variable10
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
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_EntryDateTo; vDate; vDelDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPayment.Variable10"; Form event code:C388)
If (SRCH_d_EntryDateTo>!00-00-00!)
	If (vDate<=SRCH_d_EntryDateTo)
		Gen_Alert("A Statement has already been printed up to that date - please select one later "+"than "+String:C10(SRCH_d_EntryDateTo); "Try again")
		vDate:=SRCH_d_EntryDateTo+1
	End if 
End if 
If (vDate=!00-00-00!)
	vDate:=<>DB_d_CurrentDate
	If (vDate<vDelDate)
		vDate:=vDelDate
	End if 
Else 
	If (vDate<vDelDate)
		// Gen_Alert ("You cannot choose a Date that is prior to that of the Item(s) "+"to
		// vDate:=vDelDate
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dPayment.Variable10"; $_t_oldMethodName)
