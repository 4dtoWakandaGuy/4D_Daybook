If (False:C215)
	//object Name: [SF_STOCK_SUMMARY]Input.vRecNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2012 11:34
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SF_STOCK_SUMMARY].Input.vRecNum"; Form event code:C388)

If (Selected record number:C246(Current form table:C627->)<0)
	vRecNum:=""
Else 
	vRecNum:=String:C10(Selected record number:C246(Current form table:C627->))+" of "+String:C10(Records in selection:C76(Current form table:C627->))
End if 
ERR_MethodTrackerReturn("OBJ [SF_STOCK_SUMMARY].Input.vRecNum"; $_t_oldMethodName)
