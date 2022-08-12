If (False:C215)
	//object Name: [COMPANIES]dAsk_Startup2.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Startup2.Variable12"; Form event code:C388)
If ((SRCH_d_EntryDateFrom=!00-00-00!) | (SRCH_d_EntryDateTo=!00-00-00!))
	If (SRCH_d_EntryDateFrom>!00-00-00!)
		GOTO OBJECT:C206(SRCH_d_EntryDateTo)
	End if 
Else 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Startup2.Variable12"; $_t_oldMethodName)
