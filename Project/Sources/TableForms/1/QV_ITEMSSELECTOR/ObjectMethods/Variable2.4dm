If (False:C215)
	//object Name: [CONTACTS]QV_ITEMSSELECTOR.Variable2
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
	C_BOOLEAN:C305(QV_ListSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].QV_ITEMSSELECTOR.Variable2"; Form event code:C388)

QV_ListSelected:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [CONTACTS].QV_ITEMSSELECTOR.Variable2"; $_t_oldMethodName)
