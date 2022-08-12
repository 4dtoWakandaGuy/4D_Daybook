If (False:C215)
	//object Name: [ACTIONS_DEFAULTDIARIES]Input.vRecNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/05/2013 06:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vRecNum)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS_DEFAULTDIARIES].Input.vRecNum"; Form event code:C388)

If (Selected record number:C246(Current form table:C627->)<0)
	vRecNum:=""
Else 
	vRecNum:=String:C10(Selected record number:C246(Current form table:C627->))+" of "+String:C10(Records in selection:C76(Current form table:C627->))
End if 
ERR_MethodTrackerReturn("OBJ [ACTIONS_DEFAULTDIARIES].Input.vRecNum"; $_t_oldMethodName)
