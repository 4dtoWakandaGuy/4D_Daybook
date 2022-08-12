If (False:C215)
	//object Name: [COMPANIES]dFax_SPCover.Variable7
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
	C_BOOLEAN:C305(<>FaxUrgent)
	C_LONGINT:C283(bd12)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dFax_SPCover.Variable7"; Form event code:C388)
If (bd12=1)
	<>FaxUrgent:=True:C214
Else 
	<>FaxUrgent:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dFax_SPCover.Variable7"; $_t_oldMethodName)
