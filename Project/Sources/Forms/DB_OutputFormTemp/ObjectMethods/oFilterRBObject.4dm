If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oFilterRBObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/01/2011 15:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_event)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oFilterRBObject"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_ptr_FocusObject:=Focus object:C278
		LAY_bo_FiltersActive:=True:C214
		Lay_bo_UpdateFilters:=True:C214
		LAY_FilterRadioButtons(Self:C308; $_ptr_FocusObject)
		
		
		//TRACE
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oInvoicePaidCB3"; $_t_oldMethodName)
