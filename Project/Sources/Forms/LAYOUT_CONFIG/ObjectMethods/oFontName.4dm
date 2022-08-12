If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.oFontName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 16:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_Setup;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_RecordEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_Column; $_l_event; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_POINTER:C301($_ptr_ArrayTitles)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.oFontName"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Size of array:C274(DB_aptr_Setup)>=20)
			
			LAY_bo_RecordEdited:=True:C214
			DB_bo_RecordModified:=True:C214
			OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
			OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
			$_l_Column:=[LIST_LAYOUTS:96]Order:7
			$_ptr_ArrayTitles:=DB_aptr_Setup{12}
			$_ptr_ArrayTitles->{$_l_Column}:=[LIST_LAYOUTS:96]Title:4
			LAY_bo_ShowLastColumn:=True:C214
			LBi_LoadSetup(->DB_aptr_Setup)
		Else 
			Gen_Alert("Error")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.oFontName"; $_t_oldMethodName)
