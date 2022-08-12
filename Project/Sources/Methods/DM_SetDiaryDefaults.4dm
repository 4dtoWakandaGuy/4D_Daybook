//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_SetDiaryDefaults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DestinationFieldRow; $_l_offset; $_l_SizeofArray)
	C_POINTER:C301($_ptr_DestinationFields; $_ptr_SourceField; $_ptr_SourceTypes; $_Ptr_ThisColumnArray)
	C_REAL:C285($1)
	C_TEXT:C284($_t_Details; $_t_Header; $_t_oldMethodName; $2; $3; DM_t_dActionCode; DM_t_dCompanyCode; DM_t_dContactCode; DM_t_dDocumentCode; DM_t_dJobCode; DM_t_dMacroCode)
	C_TEXT:C284(DM_t_dOrderCode; DM_t_dOriginator; DM_t_dPersonCode; DM_t_dPersPrior; DM_t_dPictureCode; DM_t_dPriority; DM_t_dProductCode; DM_t_dResultCode; DM_t_dSerCallCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetDiaryDefaults")

//this method sets any default values on a diary record
$_t_oldMethodName:=ERR_MethodTracker("DM_SetDiaryDefaults")
READ ONLY:C145([TABLE_RECORD_STATES:90])

//this method will load the default values from the options and set
//the values.
$_t_Header:=$2
$_t_Details:=$3
$_l_offset:=0
$_ptr_SourceField:=Get pointer:C304("DIA_at_"+$_t_Header+"_Sfield")
$_ptr_SourceTypes:=Get pointer:C304("DIA_al_"+$_t_Header+"_SFieldType")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$1)
//Remember this does not overwrite sent values only sets defaults where no data was sent

DM_DiaryDefBlobtoVariables
If (DM_t_dOrderCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Order_Code:26))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Order_Code:26)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dOrderCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dOrderCode
		End if 
	End if 
	
End if 
If (DM_t_dPersonCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Person:8))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Person:8)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPersonCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPersonCode
		End if 
	End if 
	
End if 
If (DM_t_dOriginator#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Originator:23))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Originator:23)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dOriginator
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dOriginator
		End if 
	End if 
	
End if 
If (DM_t_dPersPrior#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Personal_Priority:31))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Personal_Priority:31)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPersPrior
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPersPrior
		End if 
	End if 
	
End if 
If (DM_t_dPictureCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Picture_Code:37))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Picture_Code:37)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPictureCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPictureCode
		End if 
	End if 
	
End if 
If (DM_t_dPriority#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Priority:17))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Priority:17)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPriority
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dPriority
		End if 
	End if 
	
End if 
If (DM_t_dProductCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Product_Code:13))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Product_Code:13)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dProductCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dProductCode
		End if 
	End if 
	
End if 
If (DM_t_dResultCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Result_Code:11))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Result_Code:11)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dResultCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dResultCode
		End if 
	End if 
	
End if 
If (DM_t_dActionCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Action_Code:9))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Action_Code:9)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dActionCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dActionCode
		End if 
	End if 
	
End if 

If (DM_t_dSerCallCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Call_Code:25))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Call_Code:25)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dSerCallCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dSerCallCode
		End if 
	End if 
	
End if 
If (DM_t_dCompanyCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Company_Code:1))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Company_Code:1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dCompanyCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dCompanyCode
		End if 
	End if 
	
End if 
If (DM_t_dDocumentCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Document_Code:15))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Document_Code:15)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dDocumentCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dDocumentCode
		End if 
	End if 
	
End if 
If (DM_t_dContactCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Contact_Code:2))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Contact_Code:2)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dContactCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dContactCode
		End if 
	End if 
	
End if 
If (DM_t_dJobCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Job_Code:19))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Job_Code:19)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dJobCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dJobCode
		End if 
	End if 
	
End if 
If (DM_t_dMacroCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("DIA_al_"+$_t_Header+"_Fields")
	$_l_DestinationFieldRow:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[DIARY:12]Script_Code:29))
	If ($_l_DestinationFieldRow<0)
		$_l_SizeofArray:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceField->; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypes->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ai_"+$_t_Header+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_al_"+$_t_Header+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ar_"+$_t_Header+"_Real")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_ad_"+$_t_Header+"_Date")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_abo_"+$_t_Header+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_T_a"+$_t_Header+"_Text")
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_SizeofArray; 1)
		$_l_DestinationFieldRow:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_DestinationFieldRow}:=Field:C253(->[DIARY:12]Script_Code:29)
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dMacroCode
	Else 
		$_Ptr_ThisColumnArray:=Get pointer:C304("DIA_at_"+$_t_Header+"_Strings")
		If ($_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}="")
			$_Ptr_ThisColumnArray->{$_l_DestinationFieldRow}:=DM_t_dMacroCode
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("DM_SetDiaryDefaults"; $_t_oldMethodName)