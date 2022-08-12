If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oFilterCBObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2013 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.OSIFilterAllocated"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LAY_bo_FiltersActive:=True:C214
		Lay_bo_UpdateFilters:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.OSIFilterAllocated"; $_t_oldMethodName)
