If (False:C215)
	//object Name: [USER]SD2_MiniDropSelect.oEscapeKey
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
	C_LONGINT:C283(DOC_l_CallEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_MiniDropSelect.oEscapeKey"; Form event code:C388)

DOC_l_CallEvent:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SD2_MiniDropSelect.oEscapeKey"; $_t_oldMethodName)