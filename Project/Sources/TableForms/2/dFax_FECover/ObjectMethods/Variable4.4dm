If (False:C215)
	//object Name: [COMPANIES]dFax_FECover.Variable4
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
	C_LONGINT:C283(<>FaxResol; bd12)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dFax_FECover.Variable4"; Form event code:C388)
If (bd12=1)
	<>FaxResol:=1
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dFax_FECover.Variable4"; $_t_oldMethodName)
