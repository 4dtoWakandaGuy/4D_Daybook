If (False:C215)
	//object Name: Object Name:      ADDRESS_SETTER.oButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/06/2011 06:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Error)
	C_LONGINT:C283($_l_FieldIndex)
	C_POINTER:C301($_ptr_AddressField)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; RR_t_AddressFieldData_1; RR_t_AddressFieldData_2; RR_t_AddressFieldData_3; RR_t_AddressFieldData_4; RR_t_AddressFieldData_5; RR_t_AddressFieldData_6; RR_t_AddressFieldData_8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ADDRESS_SETTER.oButton"; Form event code:C388)
$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(1))
$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
$_bo_Error:=False:C215
If ($_t_FieldName#"")
	For ($_l_FieldIndex; 2; 8)
		$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
		If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
			$_bo_Error:=True:C214
			Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
			$_ptr_AddressField->:=0
		End if 
	End for 
Else 
	If (RR_t_AddressFieldData_1#"")
		$_bo_Error:=True:C214
		Gen_Alert("You must set field names for all fields with data")
	End if 
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(2))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		For ($_l_FieldIndex; 3; 8)
			$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
			If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
				$_bo_Error:=True:C214
				Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
				$_ptr_AddressField->:=0
			End if 
		End for 
	Else 
		If (RR_t_AddressFieldData_2#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
	
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(3))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		For ($_l_FieldIndex; 4; 8)
			$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
			If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
				$_bo_Error:=True:C214
				Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
				$_ptr_AddressField->:=0
			End if 
		End for 
	Else 
		If (RR_t_AddressFieldData_3#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
	
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(4))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		For ($_l_FieldIndex; 5; 8)
			$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
			If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
				$_bo_Error:=True:C214
				Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
				$_ptr_AddressField->:=0
			End if 
		End for 
	Else 
		If (RR_t_AddressFieldData_4#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
	
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(5))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		For ($_l_FieldIndex; 6; 8)
			$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
			If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
				$_bo_Error:=True:C214
				Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
				$_ptr_AddressField->:=0
			End if 
		End for 
	Else 
		If (RR_t_AddressFieldData_5#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
	
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(6))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		For ($_l_FieldIndex; 7; 8)
			$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10($_l_FieldIndex))
			If ($_ptr_AddressField->{$_ptr_AddressField->}=$_t_FieldName)
				$_bo_Error:=True:C214
				Gen_Alert("You may only set  one field of data to "+$_t_FieldName)
				$_ptr_AddressField->:=0
			End if 
		End for 
	Else 
		If (RR_t_AddressFieldData_6#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
	
End if 
If (Not:C34($_bo_Error))
	$_ptr_AddressField:=Get pointer:C304("RR_at_AddressFIeldName_"+String:C10(7))
	$_t_FieldName:=$_ptr_AddressField->{$_ptr_AddressField->}
	$_bo_Error:=False:C215
	If ($_t_FieldName#"")
		
	Else 
		If (RR_t_AddressFieldData_8#"")
			$_bo_Error:=True:C214
			Gen_Alert("You must set field names for all fields with data")
		End if 
	End if 
End if 
If (Not:C34($_bo_Error))
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ ADDRESS_SETTER.oButton"; $_t_oldMethodName)
