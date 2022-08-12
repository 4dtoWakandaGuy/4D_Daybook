//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Set2
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
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_CustomFieldRow; $_l_FieldLength; $_l_FieldType; $_l_TableNumber; $_l_TableNumberRow; $0)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_CustomFieldType; $_t_oldMethodName; $_t_Source; $_t_TableName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Set2")
//FurthFld_Set2 - Sets Value into a Field
//extracts a value from a specific Further Field


$0:=0
Load_Fields
$_t_TableName:=$1
$_l_TableNumberRow:=DB_GetTableNumFromNameString($_t_TableName)
$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumberRow}
If ($_l_TableNumberRow>0)
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumberRow})=0)
			FurthFld_Arr($_l_TableNumber)
		End if 
		$_l_CustomFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; $2)
		If ($_l_CustomFieldRow<1)
			FurthFld_Create($1; $2)
		End if 
		$_l_CustomFieldRow:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TableNumberRow}; $2)
		If ($_l_CustomFieldRow>0)
			If (Count parameters:C259=3)
				$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
				Case of 
					: (Type:C295($_ptr_Field->)=9) | (Type:C295($_ptr_Field->)=1) | (Type:C295($_ptr_Field->)=8)
						$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+String:C10($_ptr_Field->)
					: (Type:C295($_ptr_Field->)=4)
						$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+String:C10($_ptr_Field->)
					: (Type:C295($_ptr_Field->)=11)
						$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+Time string:C180($_ptr_Field->)
					: (Type:C295($_ptr_Field->)=6)
						If ($_ptr_Field->)
							$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+"TRUE"
						Else 
							$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+"FALSE"
						End if 
						
					: (Type:C295($_ptr_Field->)=0) | (Type:C295($_ptr_Field->)=2)
						$_t_Source:=STR_LeadZeros(String:C10(<>DB_al_TableNums{$_l_TableNumberRow}); 3)+$_ptr_Field->
					Else 
						Gen_Alert("THIS TYPE OF DATA CANNOT BE USED")
						
				End case 
				
			Else 
				$_t_Source:=STR_LeadZeros(String:C10($_l_TableNumber); 3)+$4
			End if 
			If (Length:C16(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow})=1)
				READ WRITE:C146([CUSTOM_FIELDS:98])
				
				GET FIELD PROPERTIES:C258(->[CUSTOM_FIELDS:98]Unique_Code:2; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				
				If ((Length:C16($_t_Source)>$_l_FieldLength))  //BSW 9/10/02
					$_t_Source:=Substring:C12($_t_Source; 1; $_l_FieldLength)
				End if 
				
				QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$2; *)
				QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_Source)
				If (Records in selection:C76([CUSTOM_FIELDS:98])=0)
					CREATE RECORD:C68([CUSTOM_FIELDS:98])
					[CUSTOM_FIELDS:98]Unique_Code:2:=$_t_Source
					[CUSTOM_FIELDS:98]Field_Name:3:=$2
				End if 
				If (Not:C34(Locked:C147([CUSTOM_FIELDS:98])))
					$_t_CustomFieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TableNumberRow}{$_l_CustomFieldRow}; 1; 1)
					Case of 
						: ($_t_CustomFieldType="A")
							[CUSTOM_FIELDS:98]String_31:4:=Substring:C12($3; 1; 79)  //NG November 2004
						: ($_t_CustomFieldType="N")
							[CUSTOM_FIELDS:98]Real_or_Integer:5:=Num:C11($3)
						: ($_t_CustomFieldType="D")
							[CUSTOM_FIELDS:98]Date_Field:7:=Date:C102($3)
						Else 
							[CUSTOM_FIELDS:98]Text_Field:6:=$3
					End case 
					DB_SaveRecord(->[CUSTOM_FIELDS:98])
					If (OK=0)
						$0:=1
					End if 
					UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
					READ ONLY:C145([CUSTOM_FIELDS:98])
				Else 
					$0:=1
				End if 
			Else 
				Gen_Alert("FurthFld_Set Error - The Further Field is Read Only")
				$0:=2
			End if 
		Else 
			Gen_Alert("FurthFld_Set Error - Field Name not found or not available for use")
			$0:=2
		End if 
	Else 
		Gen_Alert("FurthFld_Set Error - This File cannot have Further Fields")
		$0:=2
	End if 
Else 
	Gen_Alert("FurthFld_Set Error - Incorrect File Name")
	$0:=2
End if 
ERR_MethodTrackerReturn("FurthFld_Set2"; $_t_oldMethodName)