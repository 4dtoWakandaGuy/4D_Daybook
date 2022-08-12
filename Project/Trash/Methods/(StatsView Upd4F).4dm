//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_Upd4F
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
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283($_l_FurtherFieldRow; $_l_TableNumber; $_l_TablePosition; $_l_Type; $1)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285($_r_Sum; vSVT4)
	C_TEXT:C284($_t_FurtherField; $_t_oldMethodName; $_t_TableNumberString; $FFType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Upd4F")
//StatsView_Upd4F - FurthFld
Load_Fields

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
$_l_Type:=Type:C295($_ptr_Field)
$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
$_t_FurtherField:=Substring:C12(SV_at_FieldName4{SV_at_FieldName4}; 4; 31)
$_l_FurtherFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TablePosition}; $_t_FurtherField)
If ($_l_FurtherFieldRow>0)
	
	//find all the Further Fields attached to the main records
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_FurtherField)
	StatsView_FFSS($_ptr_Field; $_t_TableNumberString; $_l_Type)
	
	Case of 
		: (SV_at_CalcOption4=1)
			$_r_Sum:=Sum_FieldArr(->[CUSTOM_FIELDS:98]Real_or_Integer:5)
			aSV4{$1}:=Gen_Round($_r_Sum; 2; 2)
			vSVT4:=vSVT4+aSV4{$1}
		: (SV_at_CalcOption4=2)
			$_r_Sum:=Sum_FieldArr(->[CUSTOM_FIELDS:98]Real_or_Integer:5)
			If (aSV2{$1}=0)
				aSV4{$1}:=0
			Else 
				aSV4{$1}:=Gen_Round(($_r_Sum/aSV2{$1}); 2; 2)
			End if 
			vSVT4:=vSVT4+$_r_Sum
		: (SV_at_CalcOption4=3)
			If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
				aSV4{$1}:=Max:C3([CUSTOM_FIELDS:98]Real_or_Integer:5)
			Else 
				aSV4{$1}:=0
			End if 
			vSVT4:=vSVT4+aSV4{$1}
		: (SV_at_CalcOption4=4)
			If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
				aSV4{$1}:=Min:C4([CUSTOM_FIELDS:98]Real_or_Integer:5)
			Else 
				aSV4{$1}:=0
			End if 
			vSVT4:=vSVT4+aSV4{$1}
	End case 
	
End if 
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
ERR_MethodTrackerReturn("StatsView_Upd4F"; $_t_oldMethodName)
