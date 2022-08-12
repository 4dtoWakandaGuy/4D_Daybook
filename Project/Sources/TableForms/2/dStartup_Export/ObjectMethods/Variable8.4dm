If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable8
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
	C_LONGINT:C283(s1; s2)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable8"; Form event code:C388)
OBJECT SET ENTERABLE:C238(vText; True:C214)
vText:=""
GOTO OBJECT:C206(vText)
OBJECT SET ENABLED:C1123(s1; True:C214)
OBJECT SET ENABLED:C1123(s2; True:C214)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable8"; $_t_oldMethodName)
