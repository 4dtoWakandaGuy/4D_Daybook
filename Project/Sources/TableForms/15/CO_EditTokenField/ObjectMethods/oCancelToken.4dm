If (False:C215)
	//object Name: [USER]CO_EditTokenField.oCancelToken
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CO_l_TokenSave)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CO_EditTokenField.oCancelToken"; Form event code:C388)

CO_l_TokenSave:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].CO_EditTokenField.oCancelToken"; $_t_oldMethodName)
