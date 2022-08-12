//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_ArF1S
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_InputString; $_t_oldMethodName; $_t_RelationString; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ArF1S")
//StatsView_ArF1S - start
//Field Nos to incl

ARRAY TEXT:C222(SV_at_FieldName1; 1)  //was 15 pre 4.0.037
ARRAY TEXT:C222(SV_at_Field1Relation; 1)  //Used to store the relating file.field1,2 + * for recommend fields
SV_at_FieldName1{1}:="None"
SV_at_FieldName1:=1
SV_at_Field1Relation{1}:=""
$_l_TableNumber:=Table:C252(vFilePtr)
$_l_ArraySize:=1
While ($1#"")
	IDLE:C311  // 7/04/03 pb
	$_l_CharacterPosition:=Position:C15("/"; $1)
	If ($_l_CharacterPosition=0)
		$_t_InputString:=Substring:C12($1; 1; 7)
		$1:=""
	Else 
		$_t_InputString:=Substring:C12($1; 1; $_l_CharacterPosition-1)
	End if 
	$1:=Substring:C12($1; Length:C16($_t_InputString)+2; 32000)
	$_l_CharacterPosition:=Position:C15("."; $_t_InputString)
	If ($_l_CharacterPosition>0)
		$_t_RelationString:=Substring:C12($_t_InputString; $_l_CharacterPosition+1; 7)
		$_t_InputString:=Substring:C12($_t_InputString; 1; $_l_CharacterPosition-1)
		$_l_CharacterPosition:=Position:C15("."; $_t_RelationString)
		If ($_l_CharacterPosition<1)
			$_t_RelationString:=$_t_RelationString+".1,2"
		End if 
	Else 
		$_t_RelationString:=""
	End if 
	$_l_FieldNumber:=Num:C11($_t_InputString)
	GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength)
	If (($_l_FieldLength<32) & ($_l_FieldType#2) & ($_l_FieldType#3) & ($_l_FieldType#7) & ($_l_FieldType#11))
		$_l_ArraySize:=$_l_ArraySize+1
		INSERT IN ARRAY:C227(SV_at_FieldName1; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227(SV_at_Field1Relation; $_l_ArraySize; 1)
		SV_at_FieldName1{$_l_ArraySize}:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
		SV_at_Field1Relation{$_l_ArraySize}:=$_t_RelationString+"*"
	End if 
End while 
FurthFld_ArF1(vFilePtr; "S")  //S for startup
ERR_MethodTrackerReturn("StatsView_ArF1S"; $_t_oldMethodName)
