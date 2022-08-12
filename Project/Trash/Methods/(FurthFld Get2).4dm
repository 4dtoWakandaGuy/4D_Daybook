//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name: FurthFld_Get2
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
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_ArrayPosition; $_l_CountParameters; $_l_CustomFieldPosition; $_l_CustomFieldPositionile; $_l_FieldLength; $_l_FieldType; $_l_TableNumber)
	C_POINTER:C301($_l_CustomFieldPositionldPtr)
	C_TEXT:C284($_t_CustomFieldName; $_t_FieldFormat; $_t_FieldType; $_t_oldMethodName; $_t_TableName; $0; $1; $2; $3; $4; $src)
	C_TEXT:C284($srcOrig; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Get2")
//FurthFld_Get2 - Gets Value from a Field
//extracts a value from a specific Further Field
Load_Fields

$0:=""
If (Count parameters:C259>=2)
	$_t_TableName:=$1
	$_l_ArrayPosition:=DB_GetTableNumFromNameString($_t_TableName)
	$_l_TableNumber:=<>DB_al_TableNums{$_l_ArrayPosition}
	$_l_CustomFieldPositionile:=$_l_ArrayPosition
	
	$_l_CountParameters:=Count parameters:C259
	
	$_t_CustomFieldName:=$2
	If ($_l_CountParameters=2)
		$srcOrig:=""
	Else 
		$srcOrig:=$3
	End if 
	
	If ($_l_CountParameters>3)  //Rollo 22/10/2004
		$_t_FieldType:=$4
	Else 
		$_t_Fieldtype:=""
	End if 
	If ($_l_CountParameters>5)  //Rollo 22/10/2004
		$_t_FieldFormat:=$4
	Else 
		$_t_FieldFormat:=""
	End if 
	
	//$_l_CustomFieldPositionile:=◊Files{$_t_TableName}
	If ($_l_TableNumber>0)
		If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_ArrayPosition})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			$_l_CustomFieldPosition:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_ArrayPosition}; $_t_CustomFieldName)
			If ($_l_CustomFieldPosition>0)
				If ($srcOrig="")
					
					$_l_CustomFieldPositionldPtr:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
					If (Type:C295($_l_CustomFieldPositionldPtr->)=9)
						$src:=Str LeadZeros(String:C10($_l_TableNumber); 3)+String:C10($_l_CustomFieldPositionldPtr->)
					Else 
						$src:=Str LeadZeros(String:C10($_l_TableNumber); 3)+$_l_CustomFieldPositionldPtr->
					End if 
					
				Else 
					$src:=Str LeadZeros(String:C10($_l_TableNumber); 3)+$srcOrig
				End if 
				
				
				GET FIELD PROPERTIES:C258(->[CUSTOM_FIELDS:98]Unique_Code:2; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				
				If ((Length:C16($src)>$_l_FieldLength))  //BSW 9/10/02
					$src:=Substring:C12($src; 1; $_l_FieldLength)
				End if 
				
				QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_CustomFieldName; *)
				QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Unique_Code:2=$src)
				$_t_FieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_ArrayPosition}{$_l_CustomFieldPosition}; 1; 1)
				Case of 
					: ($_t_FieldType="A")
						$0:=[CUSTOM_FIELDS:98]String_31:4
					: ($_t_FieldType="N")
						If ($_t_FieldFormat#"")
							$0:=String:C10([CUSTOM_FIELDS:98]Real_or_Integer:5; $_t_FieldFormat)
						Else 
							$0:=String:C10([CUSTOM_FIELDS:98]Real_or_Integer:5; <>FUR_at_2dCustomFieldFormat{$_l_ArrayPosition}{$_l_CustomFieldPosition})
						End if 
					: ($_t_FieldType="D")
						If ($_t_FieldFormat#"")
							$0:=String:C10([CUSTOM_FIELDS:98]Date_Field:7; $_t_FieldFormat)
						Else 
							$0:=String:C10([CUSTOM_FIELDS:98]Date_Field:7; <>FUR_at_2dCustomFieldFormat{$_l_ArrayPosition}{$_l_CustomFieldPosition})
						End if 
					Else 
						$0:=[CUSTOM_FIELDS:98]Text_Field:6
				End case 
			Else 
				If ($_t_Fieldtype#"")
					//$_t_FieldFormat
					If ($_t_FieldFormat#"")
						
						FurthFld_Create($_t_TableName; $_t_CustomFieldName; $_t_Fieldtype; $_t_FieldFormat)
					Else 
						FurthFld_Create($_t_TableName; $_t_CustomFieldName; $_t_Fieldtype)
						
					End if 
				Else 
					If ($_t_FieldFormat#"")
						
						FurthFld_Create($_t_TableName; $_t_CustomFieldName; "A"; $_t_FieldFormat)
					Else 
						FurthFld_Create($_t_TableName; $_t_CustomFieldName)
					End if 
				End if 
				
				//Gen_Alert ("FurthFld_Get Error - "
				//Field Name not found or not available for use")
			End if 
		Else 
			If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
				Gen_Alert("FurthFld_Get Error - This File cannot have Further Fields")
			End if 
		End if 
	Else 
		If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
			Gen_Alert("FurthFld_Get Error - Incorrect File Name")
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("FurthFld_Get2"; $_t_oldMethodName)