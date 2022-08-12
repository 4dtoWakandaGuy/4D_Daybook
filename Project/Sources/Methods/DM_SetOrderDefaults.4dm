//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetOrderDefaults
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
	//ARRAY INTEGER(DM_ai_DefaultState;0)
	//ARRAY TEXT(DM_at_OrderDelterms;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_LONGINT:C283($_l_ArraySize; $_l_FieldPosition; $_l_Index2; $_l_offset; $_l_StatePosition; DM_cb_PrintComments)
	C_POINTER:C301($_Ptr_DataString; $_Ptr_DestinationsFieldsArray; $_ptr_SourceFieldArray; $_ptr_SourceTypeArray)
	C_REAL:C285($1)
	C_TEXT:C284($_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $2; $3; $4; DM_t_OrderAnalysisCode; DM_t_OrderAREACode; DM_t_OrderCurrencyCode; DM_t_OrderDelMethod; DM_t_OrderDelterms)
	C_TEXT:C284(DM_t_OrderIPriceCode; DM_t_OrderlayerCode; DM_t_OrderPersonInitials; DM_t_OrderSourceCode; DM_t_OrderTBinitials; DM_t_OrderTerms; DM_t_OrderTypeCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetOrderDefaults")
READ ONLY:C145([TABLE_RECORD_STATES:90])

//this method will load the default values from the options and set
//the values.
$_t_HeaderString:=$2
$_t_DetailString:=$3
$_l_offset:=0
$_ptr_SourceFieldArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Sfield")
$_ptr_SourceTypeArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_SFieldType")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$1)
DM_OrderDefBlobtoVariables
If (DM_t_OrderTypeCode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Order_Type:43))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Order_Type:43)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTypeCode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTypeCode
		End if 
	End if 
	
End if 
If (DM_t_OrderPersonInitials#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Person:5))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_I_a"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_R_a"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_D_a"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_bo_a"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_T_a"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Person:5)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderPersonInitials
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderPersonInitials
		End if 
	End if 
	
End if 
If (DM_t_OrderSourceCode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Source:18))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_I_a"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_R_a"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_D_a"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_bo_a"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_T_a"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Source:18)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderSourceCode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderSourceCode
		End if 
	End if 
End if 
If (DM_t_OrderTBinitials#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Taken_By:17))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_I_a"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_R_a"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_D_a"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_bo_a"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_T_a"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Taken_By:17)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTBinitials
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTBinitials
		End if 
	End if 
End if 
If (DM_t_OrderAREACode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Area_Code:35))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_I_a"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_R_a"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_D_a"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_bo_a"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_T_a"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Area_Code:35)
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderAREACode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_S255_a"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderAREACode
		End if 
	End if 
End if 
If (DM_t_OrderCurrencyCode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_l_a"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Currency_Code:32))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Currency_Code:32)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderCurrencyCode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderCurrencyCode
		End if 
	End if 
End if 
If (DM_t_OrderAnalysisCode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Analysis_Code:33))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Analysis_Code:33)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderAnalysisCode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderAnalysisCode
		End if 
	End if 
End if 
If (DM_t_OrderlayerCode#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Layer_Code:47))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Layer_Code:47)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderlayerCode
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderlayerCode
		End if 
	End if 
End if 
If (DM_t_OrderDelMethod#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Delivery_Method:19))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Delivery_Method:19)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderDelMethod
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderDelMethod
		End if 
	End if 
End if 
If (DM_t_OrderDelterms#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Delivery_Terms:52))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Delivery_Terms:52)
		
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderDelterms
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderDelterms
		End if 
	End if 
End if 
If (DM_t_OrderTerms#"")
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Terms:16))
	If ($_l_FieldPosition<0)
		
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Terms:16)
		
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTerms
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		If ($_Ptr_DataString->{$_l_FieldPosition}="")
			$_Ptr_DataString->{$_l_FieldPosition}:=DM_t_OrderTerms
		End if 
	End if 
End if 
If (Size of array:C274(DM_at_StateNames)>0)
	//calculate the state!!
	//THIS will be done during order creation(it has to be)
	//because the macros will operate on the fields!!
	//actually i might come back to it and replace field
	//references with data from the array elements
	$_l_StatePosition:=Find in array:C230(DM_ai_DefaultState; 1)
	//however we can set a default!!
	If ($_l_StatePosition>0)
		$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
		$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]State:15))
		If ($_l_FieldPosition<0)
			
			$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
			INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
			INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
			INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
			INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
			$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
			$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]State:15)
			
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			
			QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=DM_at_StateNames{$_l_StatePosition})
			$_Ptr_DataString->{$_l_FieldPosition}:="024"+[TABLE_RECORD_STATES:90]State_Code:1
			
			
		Else 
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			If ($_Ptr_DataString->{$_l_FieldPosition}="")
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=DM_at_StateNames{$_l_StatePosition})
				$_Ptr_DataString->{$_l_FieldPosition}:="024"+[TABLE_RECORD_STATES:90]State_Code:1
			End if 
		End if 
		
	End if 
	
End if 
If (DM_t_OrderIPriceCode#"")
	$_ptr_SourceFieldArray:=Get pointer:C304("ORD_al_"+$4+"_Sfield")
	
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_DetailString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDER_ITEMS:25]Price_Code:36))
	If ($_l_FieldPosition<0)
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			$_Ptr_DataString:=Get pointer:C304("ORD_ai_"+$_t_DetailString+"_Integer")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			
			$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_DetailString+"_Longint")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Real")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			
			$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_DetailString+"_Date")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			
			$_Ptr_DataString:=Get pointer:C304("ORD_abo"+$_t_DetailString+"_Boolean")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			
			$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Text")
			INSERT IN ARRAY:C227($_Ptr_DataString->{$_l_Index2}; $_l_ArraySize; 1)
		End for 
		
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDER_ITEMS:25]Price_Code:36)
		
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			$_Ptr_DataString->{$_l_Index2}{$_l_FieldPosition}:=DM_t_OrderIPriceCode
		End for 
	Else 
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		For ($_l_Index2; 1; Size of array:C274($_Ptr_DataString->))
			If ($_Ptr_DataString->{$_l_FieldPosition}="")
				$_Ptr_DataString->{$_l_Index2}{$_l_FieldPosition}:=DM_t_OrderIPriceCode
			End if 
		End for 
		
	End if 
	
End if 
//DM_cb_ORDERInvoice
//DM_cb_ORDERallocate
If (DM_cb_PrintComments=1)
	$_ptr_SourceFieldArray:=Get pointer:C304("ORD_al_"+$4+"_Sfield")
	
	$_Ptr_DestinationsFieldsArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationsFieldsArray->; Field:C253(->[ORDERS:24]Print_Comments:44))
	If ($_l_FieldPosition<0)
		
		$_l_ArraySize:=Size of array:C274($_Ptr_DestinationsFieldsArray->)+1
		INSERT IN ARRAY:C227($_Ptr_DestinationsFieldsArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227($_ptr_SourceTypeArray->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Integer")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
		INSERT IN ARRAY:C227($_Ptr_DataString->; $_l_ArraySize; 1)
		$_l_FieldPosition:=Size of array:C274($_Ptr_DestinationsFieldsArray->)
		$_Ptr_DestinationsFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Print_Comments:44)
		
		$_Ptr_DataString:=Get pointer:C304("ORD_abo"+$_t_HeaderString+"_boolean")
		$_Ptr_DataString->{$_l_FieldPosition}:=True:C214
	Else 
		//it was set by the import so leave it
	End if 
End if 
//these values will be passed to the order creation process(as a number)
//DM_cb_ORDERInvoice
//DM_cb_ORDERallocate
ERR_MethodTrackerReturn("DM_SetOrderDefaults"; $_t_oldMethodName)