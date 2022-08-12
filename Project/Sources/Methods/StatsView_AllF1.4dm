//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_AllF1
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
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_FieldRow; $_l_Index; bd1; bd10)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_AllF1")
//StatsView_AllF1 - the proc behind bd10 check box

$_t_FieldName:=SV_at_FieldName1{SV_at_FieldName1}
If (bd10=1)  //If All
	StatsView_ArF1(SV_al_TableNumber{1}; False:C215)  //load in all the fields
Else 
	$_l_Index:=2  //remove all those without the *
	While ($_l_Index<=Size of array:C274(SV_at_FieldName1))
		IDLE:C311  // 7/04/03 pb
		If (SV_at_Field1Relation{$_l_Index}#"@*")
			DELETE FROM ARRAY:C228(SV_at_FieldName1; $_l_Index; 1)
			DELETE FROM ARRAY:C228(SV_at_Field1Relation; $_l_Index; 1)
		Else 
			$_l_Index:=$_l_Index+1
		End if 
	End while 
End if 
$_l_FieldRow:=Find in array:C230(SV_at_FieldName1; $_t_FieldName)
If ($_l_FieldRow>0)
	SV_at_FieldName1:=$_l_FieldRow
Else 
	SV_at_FieldName1:=1
	StatsView_Cal1
End if 
bd1:=SV_at_FieldName1
ERR_MethodTrackerReturn("StatsView_AllF1"; $_t_oldMethodName)
