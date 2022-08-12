If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oselectAll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_BOOLEAN:C305(DB_bo_ShowArrayBased)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oselectAll"; Form event code:C388)

If (DB_bo_ShowArrayBased)
	
	LISTBOX SELECT ROW:C912(DB_lb_OutputArrays; 0; 0)
	
	
Else 
	
	LISTBOX SELECT ROW:C912(DB_l_LBOutputForm; 0; 0)
	
	
End if 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oselectAll"; $_t_oldMethodName)
