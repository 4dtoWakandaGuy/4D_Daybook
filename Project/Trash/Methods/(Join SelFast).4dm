//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Join SelFast
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   21/04/2011 20:33 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SearchLongints; 0)
	ARRAY TEXT:C222($_at_SearchStrings; 0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_FIeldNumber; $_l_FieldType; $_l_Index2; $_l_LinesCount; $_l_Process; $_l_Progress; $_l_RecordsCount; $_l_RecordsinSelection; $_l_SizeofArray; $_l_TableNumber)
	C_LONGINT:C283($5)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Join SelFast")
//TRACE


$_l_TableNumber:=Table:C252($1)
$_l_FIeldNumber:=Field:C253($2)
GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FIeldNumber; $_l_FieldType)
If ($_l_FieldType=7)
	//  Join_SelFastSub ($1;$2;$3;$4;Subfile) `Doesn't know the subfile
Else 
	$_l_RecordsinSelection:=Records in selection:C76($1->)
	If ($_l_RecordsinSelection>1)
		If ($_l_RecordsinSelection<256) | (False:C215)
			If (($_l_FieldType=8) | ($_l_FieldType=9))
				ARRAY LONGINT:C221($_al_SearchLongints; $_l_RecordsinSelection)
				SELECTION TO ARRAY:C260($2->; $_al_SearchLongints)
				If (Size of array:C274($_al_SearchLongints)>0)
					CREATE EMPTY SET:C140($3->; "$Temp_1")
					CREATE EMPTY SET:C140($3->; "$temp_2")
					$_l_LinesCount:=0
					For ($_l_TableNumber; 1; $_l_SizeofArray)
						If ($_l_LinesCount=0)
							QUERY:C277($3->; $4->=$_al_SearchLongints{1}; *)
						Else 
							QUERY:C277($3->;  | ; $4->=$_al_SearchLongints{$_l_TableNumber}; *)
						End if 
						$_l_LinesCount:=$_l_LinesCount+1
						If ($_l_LinesCount>200)
							QUERY:C277($3->)
							CREATE SET:C116($3->; "$Temp_2")
							UNION:C120("$Temp_1"; "$Temp_2"; "$Temp_1")
							$_l_LinesCount:=0
						End if 
						
					End for 
					If ($_l_LinesCount>0)
						QUERY:C277($3->)
						CREATE SET:C116($3->; "$Temp_2")
					End if 
					UNION:C120("$Temp_1"; "$Temp_2"; "$Temp_1")
					USE SET:C118("$temp_1")
					CLEAR SET:C117("$temp_1")
					CLEAR SET:C117("$temp_2")
				End if 
				
			Else 
				ARRAY TEXT:C222($_at_SearchStrings; $_l_RecordsinSelection)
				SELECTION TO ARRAY:C260($2->; $_at_SearchStrings)
				$_l_SizeofArray:=Size of array:C274($_at_SearchStrings)
				If (Count parameters:C259=5)
					For ($_l_TableNumber; 1; $_l_SizeofArray)
						$_at_SearchStrings{$_l_TableNumber}:=Substring:C12($_at_SearchStrings{$_l_TableNumber}; $5+1; 32000)
					End for 
				End if 
				If (Size of array:C274($_at_SearchStrings)>0)
					CREATE EMPTY SET:C140($3->; "$Temp_1")
					CREATE EMPTY SET:C140($3->; "$temp_2")
					$_l_LinesCount:=0
					
					For ($_l_TableNumber; 1; $_l_SizeofArray)
						If ($_l_LinesCount=0)
							QUERY:C277($3->; $4->=$_at_SearchStrings{1}; *)
						Else 
							QUERY:C277($3->;  | ; $4->=$_at_SearchStrings{$_l_TableNumber}; *)
						End if 
						$_l_LinesCount:=$_l_LinesCount+1
						If ($_l_LinesCount>200)
							QUERY:C277($3->)
							CREATE SET:C116($3->; "$Temp_2")
							UNION:C120("$Temp_1"; "$Temp_2"; "$Temp_1")
							$_l_LinesCount:=0
						End if 
						
					End for 
					Progress2_Call($_l_Progress; "")
					If ($_l_LinesCount>0)
						QUERY:C277($3->)
						CREATE SET:C116($3->; "$Temp_2")
					End if 
					UNION:C120("$Temp_1"; "$Temp_2"; "$Temp_1")
					USE SET:C118("$temp_1")
					CLEAR SET:C117("$temp_1")
					CLEAR SET:C117("$temp_2")
				End if 
				
			End if 
			
		Else 
			//  JOIN($1»;$3»)
			CREATE EMPTY SET:C140($3->; "Master")
			
			//REDUCE SELECTION($1->;255)
			//CREATE SET($1->;"Extra2")
			//DIFFERENCE("Extra";"Extra2";"Extra")
			$_l_Progress:=Progress2_Start("Linking selections ...")
			If ($_l_Progress>0)
				$_l_Process:=$_l_Progress
			Else 
				$_l_Process:=Current process:C322
			End if 
			$_l_Index2:=1
			<>SYS_l_CancelProcess:=0
			FIRST RECORD:C50($1->)
			$_l_RecordsCount:=0
			$_l_RecordsinSelection:=Records in selection:C76($1->)
			If ($_l_RecordsinSelection>0)
				CREATE EMPTY SET:C140($3->; "$Temp_1")
				CREATE EMPTY SET:C140($3->; "$temp_2")
				REDUCE SELECTION:C351($3->; 0)
				DB_GetRelatedRecords(Table:C252($1); Table:C252($3))
				If (Records in selection:C76($3->)=0)
					If (($_l_FieldType=8) | ($_l_FieldType=9))
						ARRAY LONGINT:C221($_al_SearchLongints; $_l_RecordsinSelection)
						SELECTION TO ARRAY:C260($2->; $_al_SearchLongints)
					Else 
						ARRAY TEXT:C222($_at_SearchStrings; 0)
						SELECTION TO ARRAY:C260($2->; $_at_SearchStrings)
						If (Count parameters:C259=5)
							For ($_l_TableNumber; 1; $_l_SizeofArray)
								$_at_SearchStrings{$_l_TableNumber}:=Substring:C12($_at_SearchStrings{$_l_TableNumber}; $5+1; 32000)
							End for 
						End if 
						
					End if 
					
					
					
					Case of 
						: (($_l_FieldType=8) | ($_l_FieldType=9))
							QUERY WITH ARRAY:C644($4->; $_al_SearchLongints)
						Else 
							QUERY WITH ARRAY:C644($4->; $_at_SearchStrings)
							
					End case 
				End if 
				CREATE SET:C116($3->; "$Temp_1")
				USE SET:C118("$temp_1")
				CLEAR SET:C117("$temp_1")
				CREATE SET:C116($3->; "Extra3")
				UNION:C120("Master"; "Extra3"; "Master")
			End if 
			$_l_Index2:=$_l_Index2+1
			USE SET:C118("Master")
			CLEAR SET:C117("Extra3")
			Progress2_Call($_l_Progress; "")
		End if 
	Else 
		If (Count parameters:C259=5)
			QUERY:C277($3->; $4->=(Substring:C12($2->; $5+1; 32000)))
		Else 
			QUERY:C277($3->; $4->=$2->)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Join SelFast"; $_t_oldMethodName)