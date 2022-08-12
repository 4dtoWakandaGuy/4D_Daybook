//%attributes = {}
If (False:C215)
	//Project Method Name:      FUR_UpdateFurtherFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateData; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY REAL:C219($_ar_NumberData; 0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	ARRAY TEXT:C222($_at_AlphaData; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_Coded)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_RecordsinSelection; $_l_SizeofArray; $_l_TableNumber; $_l_TableNumberRow)
	C_POINTER:C301($_ptr_Field; $1; $2)
	C_TEXT:C284($_t_FieldTypes; $_t_oldMethodName; $_t_ParentRecordID; $_t_TableNumberasString; $_t_UniqueCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FUR_UpdateFurtherFields")

//This method updates the Further field data. from a seleciton of arrays
//these arrays are populated in FUR_FIELDSLOAD Note that the selection of records must be loaded first!!!!!
If (Count parameters:C259>=1)
	$_l_TableNumber:=Table:C252($1)
	Load_Fields
	
	$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
	$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})
	If (Count parameters:C259<2)
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumberasString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		If (Type:C295($_ptr_Field->)=9)
			$_t_ParentRecordID:=String:C10($_ptr_Field->)
			$_bo_Coded:=($_t_ParentRecordID#"0")
		Else 
			$_t_ParentRecordID:=$_ptr_Field->
			$_bo_Coded:=($_t_ParentRecordID#"")
		End if 
		$_t_UniqueCode:=$_t_TableNumberasString+$_t_ParentRecordID
	Else 
		//The record may not be loaded so pass a pointer to a variable in $2
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumberasString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		If (Type:C295($_ptr_Field->)=9)
			$_t_ParentRecordID:=$2->
			$_bo_Coded:=($_t_ParentRecordID#"0")
		Else 
			$_t_ParentRecordID:=$2->
			$_bo_Coded:=($_t_ParentRecordID#"")
		End if 
		$_t_UniqueCode:=$_t_TableNumberasString+$_t_ParentRecordID
		
	End if 
	$_l_RecordsinSelection:=Records in selection:C76([CUSTOM_FIELDS:98])
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_AlphaData; 0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	//ARRAY STRING(11;$aFFC;0)
	ARRAY REAL:C219($_ar_NumberData; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	ARRAY DATE:C224($_ad_DateData; 0)
	$_l_CurrentRow:=0
	$_l_SizeofArray:=Size of array:C274(CUS_at_DisplayedData)
	For ($_l_Index; 1; $_l_SizeofArray)
		If (CUS_at_DisplayedData{$_l_Index}#"")  //& (Length(FUR_at_CustomFieldTypes{$_l_Index})=1)) `NO! Do have to save even if RO
			$_l_CurrentRow:=$_l_CurrentRow+1
			INSERT IN ARRAY:C227($_at_FieldNames; $_l_CurrentRow; 1)
			INSERT IN ARRAY:C227($_at_AlphaData; $_l_CurrentRow; 1)
			INSERT IN ARRAY:C227($_at_UniqueCode; $_l_CurrentRow; 1)
			//INSERT ELEMENT($aFFC;$_l_CurrentRow;1)
			INSERT IN ARRAY:C227($_ar_NumberData; $_l_CurrentRow; 1)
			INSERT IN ARRAY:C227($_at_TextData; $_l_CurrentRow; 1)
			INSERT IN ARRAY:C227($_ad_DateData; $_l_CurrentRow; 1)
			$_at_UniqueCode{$_l_CurrentRow}:=$_t_UniqueCode
			// $aFFC{$_l_CurrentRow}:=String(Sequence number(File($_l_TableNumber)»))
			$_at_FieldNames{$_l_CurrentRow}:=FUR_at_CustomFieldNames{$_l_Index}
			$_t_FieldTypes:=Substring:C12(FUR_at_CustomFieldTypes{$_l_Index}; 1; 1)
			Case of 
				: ($_t_FieldTypes="T")
					$_at_TextData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
				: ($_t_FieldTypes="N")
					$_ar_NumberData{$_l_CurrentRow}:=Num:C11(CUS_at_DisplayedData{$_l_Index})
				: ($_t_FieldTypes="D")
					$_ad_DateData{$_l_CurrentRow}:=Date:C102(CUS_at_DisplayedData{$_l_Index})
				Else 
					$_at_AlphaData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
			End case 
		End if 
	End for 
	//$aFFC;[FURTHER FIELDS]FF Code
	
	ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_at_AlphaData; [CUSTOM_FIELDS:98]String_31:4; $_ar_NumberData; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_at_TextData; [CUSTOM_FIELDS:98]Text_Field:6; $_ad_DateData; [CUSTOM_FIELDS:98]Date_Field:7)
End if 
ERR_MethodTrackerReturn("FUR_UpdateFurtherFields"; $_t_oldMethodName)