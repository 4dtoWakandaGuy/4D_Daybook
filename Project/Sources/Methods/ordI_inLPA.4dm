//%attributes = {}
If (False:C215)
	//Project Method Name:      ordI_inLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305(ORDI_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_TableNumber; ORDI_l_FurtherFieldsMod)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ordI_inLPA")

If (ORDI_bo_FurtherFieldsLoaded)  // Further fields exist for the invoice table and are loaded
	If (ORDI_l_FurtherFieldsMod>0)
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("ORDI_FFSelection")>0)
			USE SET:C118("ORDI_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		CLEAR SET:C117("ORDI_FFSelection")
		FUR_UpdateFurtherFields(->[ORDER_ITEMS:25])
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		//at least one further field has been modified
		
		
	End if 
	$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	CLEAR SET:C117("ORDI_FFSelection")
End if 
ERR_MethodTrackerReturn("ordI_inLPA"; $_t_oldMethodName)
