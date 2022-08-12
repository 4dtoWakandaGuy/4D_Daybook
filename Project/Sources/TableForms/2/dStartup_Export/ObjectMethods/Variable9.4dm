If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(s1; s2; vNo1)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable9"; Form event code:C388)
OBJECT SET ENTERABLE:C238(vText; False:C215)
vText:="Not used"
GOTO OBJECT:C206(vNo1)
OBJECT SET ENABLED:C1123(s1; False:C215)
OBJECT SET ENABLED:C1123(s2; False:C215)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable9"; $_t_oldMethodName)
