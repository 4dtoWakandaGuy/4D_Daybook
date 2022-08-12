//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Type
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
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	C_LONGINT:C283($_l_CustomFieldRow; $_l_TableNumber; $_l_TableNumberRow)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_CustomFieldType; $_t_oldMethodName; $_t_TableName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Type")
//FurthFld_Type - Return just the Type of the Further Field
//As A N D or T


Load_Fields

$_t_CustomFieldType:=""
$_t_TableName:=$1
$_l_TableNumberRow:=DB_GetTableNumFromNameString($_t_TableName)
$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumberRow}

//$_l_TableNumber:=$_l_TableNumberRow

If ($_l_TableNumber>0)
	
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		
		If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
			FurthFld_Arr($_l_TableNumber)
		End if 
		
		$_l_CustomFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; $2)
		If ($_l_CustomFieldRow>0)
			$_t_CustomFieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow}; 1; 1)
		End if 
		
	End if 
End if 

$0:=$_t_CustomFieldType
ERR_MethodTrackerReturn("FurthFld_Type"; $_t_oldMethodName)