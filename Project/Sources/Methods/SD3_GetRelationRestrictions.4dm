//%attributes = {}

If (False:C215)
	//Database Method Name:      SD3_GetRelationRestrictions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ObjectAttributeTypes; 0)
	ARRAY LONGINT:C221($_al_RelationType; 0)
	ARRAY LONGINT:C221($_al_RelationTypesS; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	ARRAY TEXT:C222($_at_ObjectAttributeNames; 0)
	ARRAY TEXT:C222($_at_RelationTypes; 0)
	C_BOOLEAN:C305($_bo_CheckRestrictions; $0)
	C_LONGINT:C283($_l_ArraySize; $_l_RelationElement; $_l_RelationRestriction; $_l_RelationTableField; $_l_RelationTypeElement; $_l_RelationTypeFIeld)
	C_POINTER:C301($_Ptr_DiaryAttributes; $_ptr_RelateRestrictionName; $_Ptr_RelationRestriction; $_Ptr_RelationTableField; $_ptr_RelationTableName; $_ptr_RelationTypeName; $_Ptr_RelationTypesS; $1; $2; $3; $4)
	C_POINTER:C301($5; $6; $7)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_GetRelationRestrictions")
$_Ptr_DiaryAttributes:=$1
$_Ptr_RelationTypesS:=$2  //$_al_RelationTypesS
$_ptr_RelationTypeName:=$3
$_Ptr_RelationTableField:=$4
$_ptr_RelationTableName:=$5
$_Ptr_RelationRestriction:=$6
$_ptr_RelateRestrictionName:=$7


ARRAY LONGINT:C221($_al_RelationType; 2)
ARRAY TEXT:C222($_at_RelationTypes; 2)
$_al_RelationType{1}:=1
$_al_RelationType{2}:=2
$_at_RelationTypes{1}:="Mandatory"
$_at_RelationTypes{2}:="Resticted Maximum"


OB GET PROPERTY NAMES:C1232($_Ptr_DiaryAttributes->; $_at_ObjectAttributeNames; $_al_ObjectAttributeTypes)

$_l_RelationTypeFIeld:=Find in array:C230($_at_ObjectAttributeNames; "Relation Type")
$_l_RelationTableField:=Find in array:C230($_at_ObjectAttributeNames; "Relation Table")
$_l_RelationRestriction:=Find in array:C230($_at_ObjectAttributeNames; "Relation Restriction")

If ($_l_RelationRestriction>0) & ($_l_RelationTableField>0) & ($_l_RelationTypeFIeld>0)
	OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; "Relation Type"; $_Ptr_RelationTypesS->)
	OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; "Relation Table"; $_Ptr_RelationTableField->)
	OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; "Relation Restriction"; $_Ptr_RelationRestriction->)
	$_l_ArraySize:=Size of array:C274($_Ptr_RelationTypesS->)
	ARRAY TEXT:C222($_Ptr_RelationTypesS->; $_l_ArraySize)  //Relation type name Name
	ARRAY TEXT:C222($_ptr_RelationTableName->; $_l_ArraySize)  //relation table name
	ARRAY TEXT:C222($_ptr_RelateRestrictionName->; $_l_ArraySize)
	
	For ($_l_RelationElement; 1; $_l_ArraySize)
		If ($_al_RelationTypesS{$_l_RelationElement}>0)
			$_l_RelationTypeElement:=Find in array:C230($_al_RelationType; $_al_RelationTypesS{$_l_RelationElement})
			If ($_l_RelationTypeElement>0)
				$_Ptr_RelationTypesS->{$_l_RelationElement}:=$_at_RelationTypes{$_l_RelationTypeElement}
			Else 
				$_Ptr_RelationTypesS->{$_l_RelationElement}:="Unknown"
			End if 
		End if 
		
		If ($_Ptr_RelationTableField->{$_l_RelationElement}>0)
			If (Is table number valid:C999($_Ptr_RelationTableField->{$_l_RelationElement}))
				$_ptr_RelationTableName->{$_l_RelationElement}:=Table name:C256($_Ptr_RelationTableField->{$_l_RelationElement})
			Else 
				$_ptr_RelationTableName->{$_l_RelationElement}:="Unknown"
			End if 
		Else 
			$_ptr_RelationTableName->{$_l_RelationElement}:="Unknown"
		End if 
		If ($_Ptr_RelationRestriction->{$_l_RelationElement}>0)
			$_ptr_RelateRestrictionName->{$_l_RelationElement}:=String:C10($_Ptr_RelationRestriction->{$_l_RelationElement})
		Else 
			$_ptr_RelateRestrictionName->{$_l_RelationElement}:="Unlimited"
		End if 
	End for 
End if 
//if The above arrays are populated then the action has a restriction--so that has to be taken into account when building the following
$_bo_CheckRestrictions:=False:C215
If (Size of array:C274($_al_RelationTypesS)>0)
	$_bo_CheckRestrictions:=True:C214
	
End if 
$0:=$_bo_CheckRestrictions
ERR_MethodTrackerReturn("SD3_GetRelationRestrictions"; $_t_oldMethodName)
