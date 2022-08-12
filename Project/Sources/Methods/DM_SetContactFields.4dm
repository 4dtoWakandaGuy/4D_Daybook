//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetContactFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_arraySize; $_l_FieldPosition; $_l_FieldPosition2; $_l_index)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DataArray2; $_ptr_DestinationFieldArray; $_ptr_DestinationFieldArray2; $_ptr_SourceDataArray; $_ptr_SourceTypeArray)
	C_TEXT:C284($_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetContactFields")
//this method will set the field references for fields that
//are in both the contacts and contacts table.

//the fields affected are
$_t_HeaderString:=$1
$_t_DetailString:=$2


//Type
//source
//taken by
//sales person
//status
$_ptr_SourceDataArray:=Get pointer:C304("CUS_at_"+$1+"_Sfield")
$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Fields")
$_ptr_SourceTypeArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SFieldType")
$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Contact_Type:15))
$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
$_l_FieldPosition2:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[COMPANIES:2]Company_Type:13))

If ($_l_FieldPosition<0) & ($_l_FieldPosition2>0)  //
	//the type field is in the company fields but not the contact
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailString+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Contact_Type:15)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
	End for 
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
			End if 
		End for 
	End if 
	
End if 

If ($_l_FieldPosition>0) & ($_l_FieldPosition2<0)
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_HeaderString+"_Boolean")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_l_FieldPosition2:=Size of array:C274($_ptr_DestinationFieldArray2->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Company_Type:13)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
			$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
		End if 
	End for 
	
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
				$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
			End if 
		End for 
	End if 
	
End if 
//```
$_ptr_SourceDataArray:=Get pointer:C304("CUS_al_"+$1+"_Sfield")
$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
$_ptr_SourceTypeArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SFieldType")
$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Source:16))
$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
$_l_FieldPosition2:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[COMPANIES:2]Source:14))

If ($_l_FieldPosition<0) & ($_l_FieldPosition2>0)  //
	//the type field is in the company fields but not the contact
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailString+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Source:16)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
	End for 
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
			End if 
		End for 
	End if 
	
End if 

If ($_l_FieldPosition>0) & ($_l_FieldPosition2<0)
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderString+"_Boolean")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_l_FieldPosition2:=Size of array:C274($_ptr_DestinationFieldArray2->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Source:14)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
			$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
		End if 
	End for 
	
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
				$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
			End if 
		End for 
	End if 
	
End if 
//``
$_ptr_SourceDataArray:=Get pointer:C304("CUS_al_"+$1+"_Sfield")
$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
$_ptr_SourceTypeArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SFieldType")

$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Taken_by:29))
$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
$_l_FieldPosition2:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[COMPANIES:2]Taken_By:26))

If ($_l_FieldPosition<0) & ($_l_FieldPosition2>0)  //
	//the type field is in the company fields but not the contact
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailString+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Taken_by:29)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
	End for 
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
			End if 
		End for 
	End if 
End if 


If ($_l_FieldPosition>0) & ($_l_FieldPosition2<0)
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_HeaderString+"_Boolean")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_l_FieldPosition2:=Size of array:C274($_ptr_DestinationFieldArray2->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Taken_By:26)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
			$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
		End if 
	End for 
	
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
				$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
			End if 
		End for 
	End if 
	
End if 

//``
$_ptr_SourceDataArray:=Get pointer:C304("CUS_al_"+$1+"_Sfield")
$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
$_ptr_SourceTypeArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SFieldType")

$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Sales_Person:25))
$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
$_l_FieldPosition2:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[COMPANIES:2]Sales_Person:29))

If ($_l_FieldPosition<0) & ($_l_FieldPosition2>0)  //
	//the type field is in the company fields but not the contact
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailString+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Sales_Person:25)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
	End for 
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
			End if 
		End for 
	End if 
	
End if 

If ($_l_FieldPosition>0) & ($_l_FieldPosition2<0)
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_HeaderString+"_Boolean")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_l_FieldPosition2:=Size of array:C274($_ptr_DestinationFieldArray2->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Sales_Person:29)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
			$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
		End if 
	End for 
	
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
				$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
			End if 
		End for 
	End if 
End if 


//`
//``
$_ptr_SourceDataArray:=Get pointer:C304("CUS_al_"+$1+"_Sfield")
$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
$_ptr_SourceTypeArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SFieldType")

$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Status:14))
$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Fields")
$_l_FieldPosition2:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[COMPANIES:2]Status:12))

If ($_l_FieldPosition<0) & ($_l_FieldPosition2>0)  //
	//the type field is in the company fields but not the contact
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailString+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailString+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_D_a"+$_t_DetailString+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailString+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_index}; $_l_arraySize; 1)
	End for 
	$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Status:14)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
	End for 
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}:=$_ptr_DataArray2->{$_l_FieldPosition2}
			End if 
		End for 
	End if 
	
End if 

If ($_l_FieldPosition>0) & ($_l_FieldPosition2<0)
	$_l_arraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
	INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceDataArray->; $_l_arraySize; 1)
	INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderString+"_Integer")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_al_"+$_t_HeaderString+"_Longint")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderString+"_Real")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderString+"_Date")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_HeaderString+"_Boolean")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Text")
	INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_arraySize; 1)
	$_l_FieldPosition2:=Size of array:C274($_ptr_DestinationFieldArray2->)
	$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Status:12)
	$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
	For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
		If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
			$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
		End if 
	End for 
	
Else 
	If ($_l_FieldPosition>0) & ($_l_FieldPosition2>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		$_ptr_DataArray2:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		For ($_l_index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_index}{$_l_FieldPosition}#"")
				$_ptr_DataArray2->{$_l_FieldPosition2}:=$_ptr_DataArray->{$_l_index}{$_l_FieldPosition}
			End if 
		End for 
	End if 
	
End if 
ERR_MethodTrackerReturn("DM_SetContactFields"; $_t_oldMethodName)