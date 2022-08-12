//%attributes = {}

If (False:C215)
	//Project Method Name:      In_ButtChkMandatoryByObject
	//------------------ Method Notes ------------------
	//This is to replace In_ButtCheckMan
	//like that method this is passed the table and a field (or multiple fields) that must be filled
	//unlike that method it is also passed the current form data.
	//we will get the fields on the table
	//------------------ Revision Control ----------------
	//Date Created:  06/05/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN(T)
	C_BOOLEAN:C305($_bo_EmptyValue)
	C_COLLECTION:C1488($_col_MandatoryFieldsList)
	C_LONGINT:C283($_l_FieldType; $_l_MandatoryField; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_FieldName; $_t_FirstField; $_t_MandatoryFieldsList; $2)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
	$_col_MandatoryFieldsList:=$2
	If ($_col_MandatoryFieldsList.length>0)
		For each ($_l_MandatoryField; $_col_MandatoryFieldsList)
			GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_MandatoryField; $_l_FieldType)
			$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_MandatoryField)
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
			
		End for each 
	Else 
		$0:=T
		$_t_FirstField:=First_Field($_t_MandatoryFieldsList); " ")
		
		
		
		