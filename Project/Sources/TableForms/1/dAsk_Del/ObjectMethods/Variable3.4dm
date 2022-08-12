If (False:C215)
	//object Name: [CONTACTS]dAsk_Del.Variable3
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
	C_LONGINT:C283(ch2; r2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_Del.Variable3"; Form event code:C388)
If (r2=1)
	OBJECT SET ENABLED:C1123(ch2; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_Del.Variable3"; $_t_oldMethodName)
