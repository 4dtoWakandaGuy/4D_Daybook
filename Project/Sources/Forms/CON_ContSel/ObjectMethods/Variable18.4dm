If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/07/2012 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(ACC_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable18")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable18"; Form event code:C388)
Sel_ButtDown(->ACC_d_EntryDateFrom; ->SRCH_d_EntryDateTo)
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable18"; $_t_oldMethodName)