
If (False:C215)
	//Object Name:      [CONTRACTS].dContr_Sel.oContDateEndToUpDown
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateFromBase; SRCH_d_EntryDateTo; SRCH_d_EntryDateToBase)
	C_LONGINT:C283(CONT_l_EDateFupDown; CONT_l_EDateTupDown)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (SRCH_d_EntryDateTo=!00-00-00!)
			SRCH_d_EntryDateTo:=Current date:C33(*)
		End if 
		If (SRCH_d_EntryDateToBase=!00-00-00!)
			SRCH_d_EntryDateToBase:=SRCH_d_EntryDateTo
		End if 
		SRCH_d_EntryDateTO:=SRCH_d_EntryDateToBase+CONT_l_EDateTupDown
		If (SRCH_d_EntryDateTo<SRCH_d_EntryDateTo)
			If (SRCH_d_EntryDateFrom=!00-00-00!)
				SRCH_d_EntryDateFrom:=Current date:C33(*)
			End if 
			If (SRCH_d_EntryDateFromBase=!00-00-00!)
				SRCH_d_EntryDateFROmBase:=SRCH_d_EntryDateFrom
			End if 
			Repeat 
				CONT_l_EDateFupDown:=CONT_l_EDateFupDown-1
				SRCH_d_EntryDateFrom:=SRCH_d_EntryDateFromBase+CONT_l_EDateFupDown
			Until (SRCH_d_EntryDateFrom<=SRCH_d_EntryDateTo)
			
		End if 
		
		
		
		
End case 

