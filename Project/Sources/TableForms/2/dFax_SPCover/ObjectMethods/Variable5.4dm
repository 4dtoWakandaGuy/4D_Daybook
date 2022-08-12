If (False:C215)
	//object Name: [COMPANIES]dFax_SPCover.Variable5
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
	C_LONGINT:C283(<>FaxCover)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dFax_SPCover.Variable5"; Form event code:C388)
If ((<>FaxCover>10) | (<>FaxCover<0))
	Gen_Alert("Please enter a number in the range 0 to 10")
	<>FaxCover:=1
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dFax_SPCover.Variable5"; $_t_oldMethodName)
