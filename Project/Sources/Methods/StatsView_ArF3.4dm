//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_ArF3
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
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_NoShow)
	C_LONGINT:C283($_l_ArraySize; $_l_FieldCount; $_l_FieldLength; $_l_FieldsIndex; $_l_FieldType; $_l_Index; $_l_RecordsIndex; $_l_TableNumberRow; $1; bd3; bd4)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; vSVField3Ex; vSVField4Ex)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ArF3")
//StatsView_ArF3 - creates array of fields for col 3
ARRAY TEXT:C222(SV_at_FieldName3; 1)  //was 15 pre 4.0.037
ARRAY TEXT:C222(SV_at_FieldName4; 1)  //was 15 pre 4.0.037
Load_Fields

SV_at_FieldName3{1}:="None"
SV_at_FieldName3:=1
$_l_FieldCount:=Get last field number:C255($1)
//$n:=1
For ($_l_FieldsIndex; 1; $_l_FieldCount)
	GET FIELD PROPERTIES:C258($1; $_l_FieldsIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
	
	If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9))  //| ($_l_FieldType=11))`Disallow time
		//$n:=$n+1
		$_t_FieldName:=Field name:C257($1; $_l_FieldsIndex)
		$_bo_NoShow:=False:C215
		If ($_t_FieldName[[1]]="X") | ($_bo_FieldInvisible)
			If (Current user:C182#"Designer")
				$_bo_NoShow:=True:C214
			End if 
		End if 
		If (Not:C34($_bo_NoShow))
			//INSERT IN ARRAY(SV_at_FieldName3;$n;1)
			APPEND TO ARRAY:C911(SV_at_FieldName3; $_t_FieldName)
		End if 
	End if 
End for 
$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; $1)
If ((DB_GetModuleSettingByNUM(1))#5)
	If (<>SYS_al_TableUniqueField{$1}#0)
		
		If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
			FurthFld_Arr($1)
		End if 
		
		$_l_FieldCount:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})
		If ($_l_FieldCount#0)
			
			For ($_l_FieldsIndex; 1; $_l_FieldCount)
				If (<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_FieldsIndex}="@N")
					//$n:=$n+1
					//INSERT IN ARRAY(SV_at_FieldName3;$n;1)
					APPEND TO ARRAY:C911(SV_at_FieldName3; "FF:"+<>FUR_at_CustomFieldNames{$_l_TableNumberRow}{$_l_FieldsIndex})
					
				End if 
			End for 
			
		End if 
	End if 
End if 

//$n:=$n+1
//INSERT IN ARRAY(SV_at_FieldName3;$n;1)
APPEND TO ARRAY:C911(SV_at_FieldName3; "Formula")
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]AddtoStatisticsFormulas:19=True:C214; *)
QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Table_Number:8=$1)
If (Records in selection:C76([SCRIPTS:80])>0)
	ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2)
	APPEND TO ARRAY:C911(SV_at_FieldName3; " ")
	For ($_l_RecordsIndex; 1; Records in selection:C76([SCRIPTS:80]))
		APPEND TO ARRAY:C911(SV_at_FieldName3; "Formula: "+[SCRIPTS:80]Script_Name:2)
		NEXT RECORD:C51([SCRIPTS:80])
	End for 
End if 

COPY ARRAY:C226(SV_at_FieldName3; SV_at_FieldName4)
SV_at_FieldName4:=1

$_l_ArraySize:=Size of array:C274(aSV1)
If ($_l_ArraySize>0)
	For ($_l_Index; 1; $_l_ArraySize)
		aSV3{$_l_Index}:=0
		aSV4{$_l_Index}:=0
	End for 
End if 
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
bd3:=1
bd4:=1
vSVField3Ex:=""  //Used to store the Edit a Formula Executes
vSVField4Ex:=""
ERR_MethodTrackerReturn("StatsView_ArF3"; $_t_oldMethodName)