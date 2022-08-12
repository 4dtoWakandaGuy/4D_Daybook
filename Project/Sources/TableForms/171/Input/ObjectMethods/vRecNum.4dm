
If (False:C215)
	//Form Name:      SF_UserPreferences.Input.vRecNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vRecNum)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [SF_UserPreferences]Input.vRecNum"; Form event code:C388)
vRecNum:=Choose:C955(Selected record number:C246(Current form table:C627->)<0; ""; String:C10(Selected record number:C246(Current form table:C627->))+" / "+String:C10(Records in selection:C76(Current form table:C627->)))
ERR_MethodTrackerReturn("OBJ [SF_UserPreferences]Input.vRecNum"; $_t_oldMethodName)