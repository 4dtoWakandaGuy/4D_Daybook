//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFldP_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:09:55If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(a01Inte1;0)
	//ARRAY INTEGER(a01Inte2;0)
	ARRAY TEXT:C222($_at_PersonalCustomFields; 0)
	ARRAY TEXT:C222($_at_PersonalCustomFieldsCodes; 0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BOOLEAN:C305(vMod2)
	C_LONGINT:C283($_l_CustomFieldRow; $_l_RecordsCount; $_l_RecordsIndex; $1; vJB)
	C_TEXT:C284($_t_CustomFieldCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldP_InLPB")
//FurthFldP_InLPB

vMod2:=False:C215
QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=$1)
$_l_RecordsCount:=Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])
If ($_l_RecordsCount>0)
	MESSAGES OFF:C175
	ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
	ARRAY TEXT:C222(FUR_at_CustomFieldNames; 0)
	ARRAY TEXT:C222(FUR_at_CustomFieldFormat; 0)  //NG 2004
	SELECTION TO ARRAY:C260([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2; FUR_at_CustomFieldNames; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; FUR_at_CustomFieldFormat)
	MESSAGES ON:C181
	ARRAY INTEGER:C220(a01Inte1; $_l_RecordsCount)
	ARRAY INTEGER:C220(a01Inte2; $_l_RecordsCount)
	$_t_CustomFieldCode:=STR_LeadZeros(String:C10($1); 3)+Str_TrailSpaces([PERSONNEL:11]Initials:1; 5)+"@"
	QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=$_t_CustomFieldCode)
	If (Records in selection:C76([CUSTOM_FIELDS_PERSONNEL:100])>0)
		SELECTION TO ARRAY:C260([CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1; $_at_PersonalCustomFields; [CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2; $_at_PersonalCustomFieldsCodes)
		For ($_l_RecordsIndex; 1; $_l_RecordsCount)
			a01Inte1{$_l_RecordsIndex}:=0
			a01Inte2{$_l_RecordsIndex}:=0
			$_l_CustomFieldRow:=Find in array:C230($_at_PersonalCustomFieldsCodes; FUR_at_CustomFieldFormat{$_l_RecordsIndex})
			If ($_l_CustomFieldRow>0)
				Case of 
					: ($_at_PersonalCustomFields{$_l_CustomFieldRow}=($_t_CustomFieldCode+"2"))  //full access
						a01Inte1{$_l_RecordsIndex}:=1
					: ($_at_PersonalCustomFields{$_l_CustomFieldRow}=($_t_CustomFieldCode+"3"))  //read only
						a01Inte1{$_l_RecordsIndex}:=1
						a01Inte2{$_l_RecordsIndex}:=1
				End case 
			End if 
		End for 
	Else 
		For ($_l_RecordsIndex; 1; $_l_RecordsCount)
			a01Inte1{$_l_RecordsIndex}:=1
			a01Inte2{$_l_RecordsIndex}:=0
		End for 
	End if 
Else 
	ARRAY TEXT:C222(FUR_at_CustomFieldNames; 0)
	ARRAY INTEGER:C220(a01Inte1; 0)
	ARRAY INTEGER:C220(a01Inte2; 0)
End if 
vJB:=$1
ERR_MethodTrackerReturn("FurthFldP_InLPB"; $_t_oldMethodName)