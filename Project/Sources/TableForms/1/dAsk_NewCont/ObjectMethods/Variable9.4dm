If (False:C215)
	//object Name: [CONTACTS]dAsk_NewCont.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_NewCont.Variable9"; Form event code:C388)
Check_Lists(->vTitle; "Titles")
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_NewCont.Variable9"; $_t_oldMethodName)
