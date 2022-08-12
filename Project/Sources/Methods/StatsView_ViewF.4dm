//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_ViewF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:26
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
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_CurrentProcess; $_l_FurtherFieldRow; $_l_TableNumber; $_l_TablePosition; $_l_Type; $1)
	C_POINTER:C301($_ptr_Field; vFilePtr)
	C_TEXT:C284($_t_FieldType; $_t_FurtherField; $_t_oldMethodName; $_t_TableNumberString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ViewF")
//StatsView_ViewF - FurthFld
Load_Fields

$_l_CurrentProcess:=Current process:C322

$_l_TableNumber:=Table:C252(vFilePtr)
$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
$_l_Type:=Type:C295($_ptr_Field)
$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
$_t_FurtherField:=Substring:C12(SV_at_FieldName1{SV_at_FieldName1}; 4; 31)
$_l_FurtherFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TablePosition}; $_t_FurtherField)
If ($_l_FurtherFieldRow>0)
	$_t_FieldType:=<>FUR_at_CustomFieldTypes{$_l_TablePosition}{$_l_FurtherFieldRow}
	
	//find all the Further Fields attached to the main records
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_FurtherField)
	StatsView_FFSS($_ptr_Field; $_t_TableNumberString; $_l_Type)
	
	//Find the right  FF records
	StatsView_FFS2($_t_FieldType; $1)
	
	//Find the right actual records
	StatsView_FFS3($_ptr_Field)
	
Else 
	BEEP:C151
End if 
ERR_MethodTrackerReturn("StatsView_ViewF"; $_t_oldMethodName)
