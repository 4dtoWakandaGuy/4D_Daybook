//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SetUpFFArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 17:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray; $_l_TableNumber; $_l_TableRow)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_FormUsage; $_t_FormUsage3; $_t_oldMethodName; $_t_TableNumberString; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SetUpFFArray")

$_l_TableNumber:=Table:C252($1)
$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; Table:C252($1))
If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
	
	
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableRow})
	$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	
	$_t_FormUsage:=$_t_TableNumberString+DB_t_CurrentFormUsage3
	$_t_FormUsage:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
	$_t_FormUsage3:="MC"
	If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
		FurthFld_Arr($_l_TableNumber)
	End if 
	$_l_SIzeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
	If ($_l_SIzeofArray#0)
		COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
		COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
		COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
		ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SIzeofArray)
		ARRAY TEXT:C222(CUS_at_PageText; $_l_SIzeofArray)
		For ($_l_Index; 1; $_l_SIzeofArray)  //clear the arr first
			CUS_at_DisplayedData{$_l_Index}:=""
			CUS_at_PageText{$_l_Index}:=""
		End for 
	Else 
		COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
		COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
		COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
		ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
		ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
	End if 
Else 
	COPY ARRAY:C226(<>FUR_at_CustomFieldNames{0}; FUR_at_CustomFieldNames)
	COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{0}; FUR_at_CustomFieldFormat)
	COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{0}; FUR_at_CustomFieldTypes)
	ARRAY TEXT:C222(CUS_at_DisplayedData; Size of array:C274(FUR_at_CustomFieldNames))
	ARRAY TEXT:C222(CUS_at_PageText; Size of array:C274(FUR_at_CustomFieldNames))
	
End if 
ERR_MethodTrackerReturn("SM_SetUpFFArray"; $_t_oldMethodName)
