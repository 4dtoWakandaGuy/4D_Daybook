If (False:C215)
	//object Name: [COMPANIES]dModulesTrad.Variable36
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
	C_BOOLEAN:C305(<>MenuFront)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dModulesTrad.Variable36"; Form event code:C388)
BRING TO FRONT:C326(<>MenuProc)
// SET COLOR(vSolution;-57331)  `-(243+(256*223)))
<>MenuFront:=True:C214
Gen_SetModCol
ERR_MethodTrackerReturn("OBJ:dModulesTrad,xCount"; $_t_oldMethodName)
