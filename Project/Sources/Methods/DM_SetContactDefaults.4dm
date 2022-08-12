//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetContactDefaults
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
	C_LONGINT:C283($_l_ArraySize; $_l_FieldPosition; $_l_Index; $_l_Offset)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DestinationFields; $_ptr_SourceDataType; $_ptr_SourceFields)
	C_REAL:C285($1)
	C_TEXT:C284($_t_DetailSTR; $_t_HeaderSTR; $_t_oldMethodName; $2; $3; DM_t_ContactAreaCode; DM_t_ContactLayerCode; DM_t_ContactPLTerms; DM_t_ContactPOPriceGroupCode; DM_t_ContactRoleCode; DM_t_ContactSLTerms)
	C_TEXT:C284(DM_t_ContactSOPriceGroupCode; DM_t_ContactSourceCode; DM_t_ContactSPInitials; DM_t_ContactStageCode; DM_t_ContactStatusCode; DM_t_ContactTBinitials; DM_t_ContactTypeCode; DM_t_ContactVatCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetContactDefaults")
$_t_HeaderSTR:=$2
$_t_DetailSTR:=$3
$_l_Offset:=0
$_ptr_SourceFields:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Sfield")

$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Fields")
$_ptr_SourceDataType:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_SFieldType")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$1)
DM_ContactDefBlobtoVariables
If (DM_t_ContactRoleCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Role:11))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Role:11)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactRoleCode
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactRoleCode
			End if 
		End for 
	End if 
End if 
If (DM_t_ContactTypeCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Contact_Type:15))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Contact_Type:15)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactTypeCode
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactTypeCode
			End if 
		End for 
	End if 
End if 

If (DM_t_ContactSourceCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Source:16))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Source:16)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactSourceCode
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactSourceCode
			End if 
		End for 
	End if 
End if 

If (DM_t_ContactTBinitials#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Taken_by:29))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Taken_by:29)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactTBinitials
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactTBinitials
				
			End if 
		End for 
	End if 
End if 

If (DM_t_ContactSPInitials#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Sales_Person:25))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Sales_Person:25)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactSPInitials
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactSPInitials
			End if 
		End for 
	End if 
End if 

If (DM_t_ContactStatusCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[CONTACTS:1]Status:14))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_DetailSTR+"_Integer")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_DetailSTR+"_Longint")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_DetailSTR+"_Real")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_DetailSTR+"_Date")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_DetailSTR+"_Boolean")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Text")
			INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
		End for 
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Status:14)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactStatusCode
		End for 
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_DetailSTR+"_Strings")
		For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
			If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
				$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_ContactStatusCode
			End if 
		End for 
	End if 
End if 
$_ptr_SourceFields:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Sfield")
$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
$_ptr_SourceDataType:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_SFieldType")

If (DM_t_ContactTypeCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Company_Type:13))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Company_Type:13)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactTypeCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactTypeCode
		End if 
	End if 
End if 
If (DM_t_ContactSourceCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Source:14))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Source:14)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSourceCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSourceCode
		End if 
	End if 
End if 
If (DM_t_ContactSPInitials#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Sales_Person:29))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Sales_Person:29)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSPInitials
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSPInitials
		End if 
	End if 
End if 
If (DM_t_ContactTBinitials#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Taken_By:26))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Taken_By:26)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactTBinitials
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactTBinitials
		End if 
	End if 
End if 

If (DM_t_ContactStatusCode#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Status:12))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Status:12)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactStatusCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactStatusCode
		End if 
	End if 
End if 
If (DM_t_ContactAreaCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Area:11))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Area:11)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactAreaCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactAreaCode
		End if 
	End if 
End if 
If (DM_t_ContactSLTerms#"")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]SL_Terms:40))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]SL_Terms:40)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSLTerms
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSLTerms
		End if 
	End if 
End if 
If (DM_t_ContactPLTerms#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]PL_Terms:53))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]PL_Terms:53)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactPLTerms
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactPLTerms
		End if 
	End if 
End if 
If (DM_t_ContactVatCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Default_TAX:41))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Default_TAX:41)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactVatCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactVatCode
		End if 
	End if 
End if 
If (DM_t_ContactStageCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Sales_Credit:35))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Sales_Credit:35)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactStageCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactStageCode
		End if 
	End if 
End if 
If (DM_t_ContactSOPriceGroupCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]SO_Price_Group:44))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]SO_Price_Group:44)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSOPriceGroupCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactSOPriceGroupCode
		End if 
	End if 
End if 
If (DM_t_ContactPOPriceGroupCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]PO_Price_Group:54))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]PO_Price_Group:54)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactPOPriceGroupCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactPOPriceGroupCode
		End if 
	End if 
End if 
If (DM_t_ContactLayerCode#"")
	$_ptr_DestinationFields:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFields->; Field:C253(->[COMPANIES:2]Default_Layer:51))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)+1
		INSERT IN ARRAY:C227($_ptr_DestinationFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFields->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_aI"+$_t_HeaderSTR+"_Integer")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_al"+$_t_HeaderSTR+"_Longint")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ar"+$_t_HeaderSTR+"_Real")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_ad"+$_t_HeaderSTR+"_Date")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_abo"+$_t_HeaderSTR+"_Boolean")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Text")
		INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
		$_l_ArraySize:=Size of array:C274($_ptr_DestinationFields->)
		$_ptr_DestinationFields->{$_l_ArraySize}:=Field:C253(->[COMPANIES:2]Default_Layer:51)
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactLayerCode
	Else 
		$_ptr_DataArray:=Get pointer:C304("CUS_at"+$_t_HeaderSTR+"_Strings")
		If ($_ptr_DataArray->{$_l_FieldPosition}="")
			$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ContactLayerCode
		End if 
	End if 
End if 
//
ERR_MethodTrackerReturn("DM_SetContactDefaults"; $_t_oldMethodName)