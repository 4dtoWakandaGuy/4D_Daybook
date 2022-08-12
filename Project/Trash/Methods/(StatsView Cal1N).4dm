//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_Cal1N
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
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharacterPosition2; $_l_FieldNumberC; $_l_FieldNumberN; $_l_Index; $_l_SizeofArray; $_l_TableNumber; r2)
	C_POINTER:C301($_Ptr_FieldC; $_Ptr_FieldN; $_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_Relation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Cal1N")
//StatsView_Cal1N - calcs the column 1 Names/Codes

If ((r2=1) & (SV_at_Field1Relation{SV_at_FieldName1}#"") & (SV_at_Field1Relation{SV_at_FieldName1}#"*"))
	$_l_SizeofArray:=Size of array:C274(aSV1)
	$_t_Relation:=SV_at_Field1Relation{SV_at_FieldName1}
	$_l_CharacterPosition:=Position:C15("."; $_t_Relation)
	$_l_CharacterPosition2:=Position:C15(","; $_t_Relation)
	$_l_TableNumber:=Num:C11(Substring:C12($_t_Relation; 1; $_l_CharacterPosition-1))
	$_l_FieldNumberC:=Num:C11(Substring:C12($_t_Relation; $_l_CharacterPosition+1; 1))
	$_l_FieldNumberN:=Num:C11(Substring:C12($_t_Relation; $_l_CharacterPosition2+1; 1))
	$_Ptr_Table:=Table:C252($_l_TableNumber)
	$_Ptr_FieldC:=Field:C253($_l_TableNumber; $_l_FieldNumberC)
	$_Ptr_FieldN:=Field:C253($_l_TableNumber; $_l_FieldNumberN)
	For ($_l_Index; 1; $_l_SizeofArray)
		QUERY:C277($_Ptr_Table->; $_Ptr_FieldC->=aSV1{$_l_Index})
		If ($_Ptr_FieldN->#"")
			aSVN1{$_l_Index}:=Substring:C12($_Ptr_FieldN->; 1; 79)  //Is cut off for display only - can be increased to 31
		Else 
			aSVN1{$_l_Index}:=aSV1{$_l_Index}
		End if 
	End for 
Else 
	COPY ARRAY:C226(aSV1; aSVN1)
End if 
ERR_MethodTrackerReturn("StatsView_Cal1N"; $_t_oldMethodName)
