If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Popup Drop down List10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 11:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_Setup;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_RecordEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Type; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_POINTER:C301($_ptr_ArrayofColumnFooters)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Popup Drop down List10"; Form event code:C388)

If (SVS_at_PreviewDateString=0)
	SVS_at_PreviewDateString:=[LIST_LAYOUTS:96]Footer:14
Else 
	If ([LIST_LAYOUTS:96]Table_Number:2>0)
		If (Size of array:C274(DB_aptr_Setup)>=20)
			$_l_Type:=Type:C295(Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)->)
			If (($_l_Type=1) | ($_l_Type=8) | ($_l_Type=9) | ($_l_Type=11) | (SVS_at_PreviewDateString<3))
				[LIST_LAYOUTS:96]Footer:14:=SVS_at_PreviewDateString
				$_l_event:=Form event code:C388
				LAY_bo_RecordEdited:=True:C214
				DB_bo_RecordModified:=True:C214
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
				$_l_Column:=[LIST_LAYOUTS:96]Order:7
				$_ptr_ArrayofColumnFooters:=DB_aptr_Setup{18}
				$_ptr_ArrayofColumnFooters->{$_l_Column}:=[LIST_LAYOUTS:96]Footer:14
				LAY_bo_ShowLastColumn:=True:C214
				LBi_LoadSetup(->DB_aptr_Setup)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
				OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
			Else 
				Gen_Alert("That type of Footer is not valid unless the Field specified above is numerical"; "Try again")
				SVS_at_PreviewDateString:=[LIST_LAYOUTS:96]Footer:14
			End if 
		Else 
			ALERT:C41("ERROR")
		End if 
	Else 
		Gen_Alert("You may not set a footer on this type of Definition")
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Popup Drop down List10"; $_t_oldMethodName)
