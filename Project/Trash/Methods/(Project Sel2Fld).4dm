//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Project Sel2Fld
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2011 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_LongintValues; 0)
	ARRAY LONGINT:C221($_al_LongintValues2; 0)
	ARRAY TEXT:C222($_at_TextValues; 0)
	ARRAY TEXT:C222($_at_TextValues2; 0)
	C_LONGINT:C283($_l_ArraySIze; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber)
	C_POINTER:C301($1; $2; $3; $4; $5; $6)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Project Sel2Fld")

$_l_TableNumber:=Table:C252($3)
$_l_FieldNumber:=Field:C253($4)
GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
$_l_FieldNumber:=Records in selection:C76($1->)
If ($_l_FieldNumber>0)
	If ($_l_FieldNumber>1)
		If (($_l_FieldType=8) | ($_l_FieldType=9))
			ARRAY LONGINT:C221($_al_LongintValues; $_l_FieldNumber)
			ARRAY LONGINT:C221($_al_LongintValues2; $_l_FieldNumber)
			SELECTION TO ARRAY:C260($2->; $_al_LongintValues; $5->; $_al_LongintValues2)
			$_l_TableNumber:=1
			$_l_ArraySIze:=Size of array:C274($_al_LongintValues)
			CREATE EMPTY SET:C140($3->; "Master2")
			//While ($_l_TableNumber<$_l_ArraySIze)
			QUERY WITH ARRAY:C644($4->; $_al_LongintValues)
			QUERY SELECTION WITH ARRAY:C1050($6->; $_al_LongintValues2)
			CREATE SET:C116($3->; "Extra")
			UNION:C120("Extra"; "Master2"; "Master2")
			//$_l_TableNumber:=$_l_TableNumber+1
			//End while
			USE SET:C118("Master2")
		Else 
			ARRAY TEXT:C222($_at_TextValues; $_l_FieldNumber)
			ARRAY TEXT:C222($_at_TextValues2; $_l_FieldNumber)
			SELECTION TO ARRAY:C260($2->; $_at_TextValues; $5->; $_at_TextValues2)
			$_l_TableNumber:=1
			$_l_ArraySIze:=Size of array:C274($_at_TextValues)
			CREATE EMPTY SET:C140($3->; "Master2")
			//While ($_l_TableNumber<$_l_ArraySIze)
			QUERY WITH ARRAY:C644($4->; $_at_TextValues)
			QUERY SELECTION WITH ARRAY:C1050($6->; $_at_TextValues2)
			CREATE SET:C116($3->; "Extra")
			UNION:C120("Extra"; "Master2"; "Master2")
			$_l_TableNumber:=$_l_TableNumber+1
			//End while
			USE SET:C118("Master2")
		End if 
		CLEAR SET:C117("Master2")
		CLEAR SET:C117("Extra")
	Else 
		QUERY:C277($3->; $4->=$2->; *)
		QUERY:C277($3->;  & ; $6->=$6->)
	End if 
Else 
	REDUCE SELECTION:C351($3->; 0)
End if 
ERR_MethodTrackerReturn("Project Sel2Fld"; $_t_oldMethodName)