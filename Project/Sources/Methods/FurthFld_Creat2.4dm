//%attributes = {}
If (False:C215)
	//Project Method Name: FurthFld_Creat2
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
	C_LONGINT:C283($_l_Clash; $_l_CountParameters; $_l_CountRecords; $_l_FieldColumn; $_l_TableNumber; $_l_TablePosition; $_l_TableRow)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AccessCode; $_t_CustomFieldFormat; $_t_CustomFieldName; $_t_CustomFieldType; $_t_FurtherDefCode; $_t_oldMethodName; $_t_TableName; $0; $1; $2)
	C_TEXT:C284($3; $4; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Creat2")
//FurthFld_Creat2
Load_Fields

$_l_CountParameters:=Count parameters:C259
$0:=""
If ($_l_CountParameters>=2)
	$_t_TableName:=$1
	
	$_t_CustomFieldName:=$2
	If (Count parameters:C259>=3)
		$_t_CustomFieldType:=$3
		If (Count parameters:C259>=4)
			$_t_CustomFieldFormat:=$4
		End if 
	End if 
	
	$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
	If ($_l_TableNumber>0)
		$_l_TableRow:=<>DB_al_TableNums{$_l_TableNumber}
		$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableRow)
		If ($_l_TableRow>0)
			
			If (<>SYS_al_TableUniqueField{$_l_TableRow}#0)
				If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TablePosition})=0)
					FurthFld_Arr($_l_TablePosition)
				End if 
				$_l_FieldColumn:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TablePosition}; $_t_CustomFieldName)
				If ($_l_FieldColumn<1)
					READ WRITE:C146([CUSTOM_FIELD_DEFINITiONS:99])
					CREATE RECORD:C68([CUSTOM_FIELD_DEFINITiONS:99])
					
					Repeat 
						$_t_FurtherDefCode:=String:C10(AA_GetNextIDinMethod(->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; Sequence number:C244([CUSTOM_FIELD_DEFINITiONS:99])-1))
						SET QUERY DESTINATION:C396(3; $_l_Clash)
						QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1=$_t_FurtherDefCode)
						SET QUERY DESTINATION:C396(0)
					Until ($_l_Clash=0)
					
					[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1:=$_t_FurtherDefCode
					[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3:=$_l_TableRow
					[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2:=$_t_CustomFieldName
					If ($_l_CountParameters>2)
						If (($_t_CustomFieldType="D") | ($_t_CustomFieldType="T") | ($_t_CustomFieldType="N"))
							[CUSTOM_FIELD_DEFINITiONS:99]Type:6:=$_t_CustomFieldType
						Else 
							[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="A"
						End if 
					Else 
						[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="A"
					End if 
					If ($_l_CountParameters>3)
						[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5:=$_t_CustomFieldFormat
					End if 
					[CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TablePosition})+1
					DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
					
					$_t_AccessCode:=STR_LeadZeros(String:C10($_l_TableRow); 3)+Str_TrailSpaces(<>PER_t_CurrentUserInitials; 5)
					QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=$_t_AccessCode+"@")
					$_l_CountRecords:=Records in selection:C76([CUSTOM_FIELDS_PERSONNEL:100])
					If ($_l_CountRecords>0)
						READ WRITE:C146([CUSTOM_FIELDS_PERSONNEL:100])
						CREATE RECORD:C68([CUSTOM_FIELDS_PERSONNEL:100])
						[CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1:=$_t_AccessCode
						[CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2:=[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1
						DB_SaveRecord(->[CUSTOM_FIELDS_PERSONNEL:100])
						UNLOAD RECORD:C212([CUSTOM_FIELDS_PERSONNEL:100])
						READ ONLY:C145([CUSTOM_FIELDS_PERSONNEL:100])
					End if 
					
					UNLOAD RECORD:C212([CUSTOM_FIELD_DEFINITiONS:99])
					READ ONLY:C145([CUSTOM_FIELD_DEFINITiONS:99])
					FurthFld_Arr($_l_TableRow)
				Else 
					If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
						Gen_Alert("FurthFld_Create Error - The Further Field "+$_t_CustomFieldName+" already exists")
					End if 
				End if 
			Else 
				If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
					Gen_Alert("FurthFld_Create Error - This File cannot have Further Fields")
				End if 
			End if 
		Else 
			If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
				Gen_Alert("FurthFld_Create Error - Incorrect File Name")
			End if 
		End if 
	Else 
		If (DB_t_CurrentFormUsage#"none")  //Rollo 22/10/2004
			Gen_Alert("FurthFld_Create Error - Incorrect File Name")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("FurthFld_Creat2"; $_t_oldMethodName)