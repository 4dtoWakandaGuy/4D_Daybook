//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Learn
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
	//ARRAY INTEGER(<>SV_al_TableNums;0)
	//ARRAY LONGINT(<>SV_al_Calc3;0)
	//ARRAY LONGINT(<>SV_al_Calc4;0)
	//ARRAY LONGINT(<>SV_al_Field3;0)
	//ARRAY LONGINT(<>SV_al_Field4;0)
	//ARRAY TEXT(<>SV_at_FieldName1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_BOOLEAN:C305(<>Stats_bo_Arraysinited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_TableRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Learn")
//StatsView_Learn
If (Not:C34(<>Stats_bo_Arraysinited))
	StatsView_Setup
End if 
$_l_TableRow:=Find in array:C230(<>SV_al_TableNums; SV_al_TableNumber{1})
If (<>SYS_l_CancelProcess=Current process:C322)
	If ($_l_TableRow>0)
		DELETE FROM ARRAY:C228(<>SV_al_TableNums; $_l_TableRow)
		DELETE FROM ARRAY:C228(<>SV_at_FieldName1; $_l_TableRow)
		DELETE FROM ARRAY:C228(<>SV_al_Field3; $_l_TableRow)
		DELETE FROM ARRAY:C228(<>SV_al_Field4; $_l_TableRow)
		DELETE FROM ARRAY:C228(<>SV_al_Calc3; $_l_TableRow)
		DELETE FROM ARRAY:C228(<>SV_al_Calc4; $_l_TableRow)
	End if 
Else 
	If ($_l_TableRow<=0)
		INSERT IN ARRAY:C227(<>SV_al_TableNums; 9999; 1)
		INSERT IN ARRAY:C227(<>SV_at_FieldName1; 9999; 1)
		INSERT IN ARRAY:C227(<>SV_al_Field3; 9999; 1)
		INSERT IN ARRAY:C227(<>SV_al_Field4; 9999; 1)
		INSERT IN ARRAY:C227(<>SV_al_Calc3; 9999; 1)
		INSERT IN ARRAY:C227(<>SV_al_Calc4; 9999; 1)
		$_l_TableRow:=Size of array:C274(<>SV_al_TableNums)
		<>SV_al_TableNums{$_l_TableRow}:=SV_al_TableNumber{1}
	End if 
	<>SV_at_FieldName1{$_l_TableRow}:=SV_at_FieldName1{SV_at_FieldName1}
	If (DB_at_TableName=1)
		<>SV_al_Field3{$_l_TableRow}:=SV_at_FieldName3
		<>SV_al_Field4{$_l_TableRow}:=SV_at_FieldName4
		<>SV_al_Calc3{$_l_TableRow}:=SV_at_CalcOption3
		<>SV_al_Calc4{$_l_TableRow}:=SV_at_CalcOption4
	End if 
End if 
ERR_MethodTrackerReturn("StatsView_Learn"; $_t_oldMethodName)
