If (False:C215)
	//object Name: [COMPANIES]dFax_FECover.Variable6
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
	C_LONGINT:C283(<>FaxResol; bd14)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dFax_FECover.Variable6"; Form event code:C388)
If (bd14=1)
	<>FaxResol:=3
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dFax_FECover.Variable6"; $_t_oldMethodName)
