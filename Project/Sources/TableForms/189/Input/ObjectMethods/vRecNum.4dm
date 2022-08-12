If (False:C215)
	//object Name: [PRODUCT_BUILT_CODE_FORMAT]Input.vRecNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2011 09:55
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCT_BUILT_CODE_FORMAT].Input.vRecNum"; Form event code:C388)

If (Selected record number:C246(Current form table:C627->)<0)
	vRecNum:=""
Else 
	vRecNum:=String:C10(Selected record number:C246(Current form table:C627->))+" of "+String:C10(Records in selection:C76(Current form table:C627->))
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCT_BUILT_CODE_FORMAT].Input.vRecNum"; $_t_oldMethodName)
