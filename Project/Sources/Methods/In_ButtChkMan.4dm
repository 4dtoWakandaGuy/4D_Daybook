//%attributes = {}
If (False:C215)
	//Project Method Name:      In_ButtChkMan
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_EmptyValue; $0)
	C_LONGINT:C283($_l_FieldType)
	C_POINTER:C301($_ptr_FieldPointer; $1)
	C_TEXT:C284($_t_FirstValue; $_t_oldMethodName; $_t_TextValue; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_ButtChkMan")
If (Count parameters:C259>=2)
	If ($2#"")
		$0:=True:C214
		$_t_TextValue:=$2
		$_t_FirstValue:=First_Field(->$_t_TextValue; " ")
		While (($_t_FirstValue#"") & ($0=True:C214))
			$_ptr_FieldPointer:=Field:C253(Table:C252($1); Num:C11($_t_FirstValue))
			GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
			$_bo_EmptyValue:=False:C215
			If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
				If ($_ptr_FieldPointer->=0)
					$_bo_EmptyValue:=True:C214
				End if 
			Else 
				If ($_l_FieldType=4)
					If ($_ptr_FieldPointer->=!00-00-00!)
						$_bo_EmptyValue:=True:C214
					End if 
				Else 
					If ($_ptr_FieldPointer->="")
						$_bo_EmptyValue:=True:C214
					End if 
				End if 
			End if 
			If ($_bo_EmptyValue=True:C214)
				Gen_Alert("The field "+Field name:C257($_ptr_FieldPointer)+" must first be completed"; "Try again")
				$0:=False:C215
			End if 
			$_t_FirstValue:=First_Field(->$_t_TextValue; " ")
		End while 
	Else 
		$0:=True:C214
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("In_ButtChkMan"; $_t_oldMethodName)