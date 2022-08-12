//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView ArF1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     04/05/2011 09:15 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FIeld1Relation; 0)
	ARRAY TEXT:C222($_at_FieldName1; 0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_NoShow; $2)
	C_LONGINT:C283($_l_CurrentRow; $_l_FieldIndex; $_l_FieldLength; $_l_FIeldNamePosition; $_l_FieldType; $_l_LastFieldNumber; $_l_TableNumber; $1)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView ArF1"; Form event code:C388)
//StatsView ArF1 - creates array of fields for col 1
ARRAY TEXT:C222($_at_FieldName1; 0)  //was 15 pre 4.0.037
ARRAY TEXT:C222($_at_FIeld1Relation; 0)
COPY ARRAY:C226(SV_at_FieldName1; $_at_FieldName1)
COPY ARRAY:C226(SV_at_Field1Relation; $_at_FIeld1Relation)
ARRAY TEXT:C222(SV_at_FieldName1; 1)  //was 15 pre 4.0.037

ARRAY TEXT:C222(SV_at_Field1Relation; 1)
SV_at_FieldName1{1}:="None"
SV_at_FieldName1:=1
SV_at_Field1Relation{1}:=""

$_l_LastFieldNumber:=Get last field number:C255($1)
$_l_TableNumber:=$1
$_l_CurrentRow:=1
For ($_l_FieldIndex; 1; $_l_LastFieldNumber)
	If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
		GET FIELD PROPERTIES:C258($1; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
		If (($_l_FieldType#2) & ($_l_FieldType#3) & ($_l_FieldType#7) & ($_l_FieldType#11))
			
			
			If (($2=False:C215) | ($_bo_FieldIndexed))
				$_bo_NoShow:=False:C215
				If ($_bo_FieldInvisible) & Not:C34(Current user:C182="Designer")
					$_bo_NoShow:=True:C214
				Else 
					$_t_FieldName:=Field name:C257($1; $_l_FieldIndex)
					If ($_t_FieldName[[1]]="x") & Not:C34(Current user:C182="Designer")
						$_bo_NoShow:=True:C214
					End if 
				End if 
				If ($_bo_FieldUnique) & (False:C215)
					$_bo_NoShow:=True:C214
				End if 
				If (Not:C34($_bo_NoShow))
					$_l_CurrentRow:=$_l_CurrentRow+1
					//INSERT IN ARRAY(SV_at_FieldName1;$_l_CurrentRow;1)
					//INSERT IN ARRAY(SV_at_Field1Relation;$_l_CurrentRow;1)
					APPEND TO ARRAY:C911(SV_at_FieldName1; Field name:C257($1; $_l_FieldIndex))
					$_l_FIeldNamePosition:=Find in array:C230($_at_FieldName1; SV_at_FieldName1{$_l_CurrentRow})
					If ($_l_FIeldNamePosition>0)
						APPEND TO ARRAY:C911(SV_at_Field1Relation; $_at_FIeld1Relation{$_l_FIeldNamePosition})
					Else 
						APPEND TO ARRAY:C911(SV_at_Field1Relation; "")
					End if 
				End if 
			End if 
		End if 
	End if 
End for 
FurthFld_ArF1(vFilePtr; "")
ERR_MethodTrackerReturn("StatsView ArF1"; $_t_oldMethodName)