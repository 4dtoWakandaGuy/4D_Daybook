If (False:C215)
	//object Name: [USER]SD2_MiniDropSelect.oEnterKey
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
	C_LONGINT:C283(SD2_l_Callback; SD2_l_EmailCalledback)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_MiniDropSelect.oEnterKey"; Form event code:C388)

BRING TO FRONT:C326(SD2_l_Callback)
SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_l_EmailCalledback; 1)
POST OUTSIDE CALL:C329(SD2_l_Callback)
ERR_MethodTrackerReturn("OBJ [USER].SD2_MiniDropSelect.oEnterKey"; $_t_oldMethodName)
