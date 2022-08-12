If (False:C215)
	//object Name: Object Name:      ACC_ImportFieldMap.oButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 09:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_Labels; 0)
	ARRAY TEXT:C222($_at_propertyNames; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	C_LONGINT:C283($_l_FormEvent; $_l_ObectNumber; $_l_Position; $_l_SetObjects)
	C_OBJECT:C1216(DB_obj_Interface)
	C_POINTER:C301($_ptr_Nil)
	C_TEXT:C284($_t_DataObject; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportFieldMap/oButton"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		
		OB GET PROPERTY NAMES:C1232(DB_obj_Interface; $_at_propertyNames; $_al_PropertyTypes)
		
		$_l_Position:=Find in array:C230($_at_propertyNames; "Values")
		If ($_l_Position>0)
			OB GET ARRAY:C1229(DB_obj_Interface; "Values"; $_at_Values)
		End if 
		For ($_l_SetObjects; 1; Size of array:C274($_at_Values))
			$_t_DataObject:="oVariableText"+String:C10($_l_SetObjects)
			$_ptr_Nil:=OBJECT Get pointer:C1124(Object named:K67:5; "oVariableText"+String:C10($_l_SetObjects))
			$_at_Values{$_l_SetObjects}:=$_ptr_Nil->
		End for 
		OB SET ARRAY:C1227(DB_obj_Interface; "Values"; $_at_Values)
		OB SET:C1220(DB_obj_Interface; "Exit"; "Save")
		
End case 
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.oButton"; $_t_oldMethodName)
