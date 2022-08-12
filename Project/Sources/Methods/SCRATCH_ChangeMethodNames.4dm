//%attributes = {}

If (False:C215)
	//Project Method Name:      SCRATCH_ChangeMethodNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/03/2022
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_CurrentField)
	//C_UNKNOWN($_tableName)
	//C_UNKNOWN($i)
	//C_UNKNOWN(Call)
	ARRAY BOOLEAN:C223($_aobj_Relations; 0)
	ARRAY LONGINT:C221($_al_2DFieldNumbers; 0; 0)
	ARRAY LONGINT:C221($_al_MethodLength; 0)
	ARRAY LONGINT:C221($_al_PrimeKeys; 0)
	ARRAY LONGINT:C221($_al_RecordNameField; 0)
	ARRAY LONGINT:C221($_al_RecStateRestriction; 0; 0)
	ARRAY LONGINT:C221($_al_RecStateSortOrder; 0; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_TableRecordNameField; 0)
	ARRAY LONGINT:C221($_al_TableUniqueField; 0)
	ARRAY OBJECT:C1221($_aobj_ManyRelations; 0; 0)
	ARRAY OBJECT:C1221($_aobj_OneRelations; 0; 0)
	ARRAY TEXT:C222($_at_2SFieldNames; 0; 0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	ARRAY TEXT:C222($_at_DocumentPaths2; 0)
	ARRAY TEXT:C222($_at_Export; 0)
	ARRAY TEXT:C222($_at_Fields; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_PrimeKeys; 0)
	ARRAY TEXT:C222($_at_RecStateAbbrev; 0; 0)
	ARRAY TEXT:C222($_at_RecStateCodes; 0; 0)
	ARRAY TEXT:C222($_at_RecStateNames; 0; 0)
	ARRAY TEXT:C222($_at_TableNames; 0)
	ARRAY TEXT:C222($_at_TestFields; 0)
	ARRAY TEXT:C222($_at_TestTableNames; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_Infos; $_bo_invisible)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_L_CheckSPac; $_l_CurrentRow; $_l_FieldLength; $_l_FieldNumber; $_l_Fields; $_l_FieldType; $_L_FindForm; $_l_FormNumber; $_l_LastTable; $_l_LastTableNumber)
	C_LONGINT:C283($_l_Length; $_l_Method; $_l_Method2; $_l_Position; $_l_Position2; $_l_Postion; $_l_Table; $_l_TableIndex; $_l_TableNumber; $_l_Tables; $_l_TableToAddTo)
	C_OBJECT:C1216($_obj_Class; $_Obj_Datastore; $_Obj_Entities; $_obj_Entity; $_obj_Field; $_obj_Fields; $_obj_Formula; $_obj_FormulaObject; $_Obj_GetUser; $_obj_Infos; $_obj_Records)
	C_OBJECT:C1216($_obj_Scripts)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Form; $_t_Formula; $_t_Json; $_t_newName; $_t_Result; $_t_Script; $_t_SourceCode; $_t_SourceCode2; $_t_Sscript; $_t_ThisScript)
	C_TEXT:C284($_t_Whatsit)
	C_TIME:C306($_ti_Document; $_ti_DocumentofChanges)
End if 
//Code Starts Here
///METHOD GET CODE($_at_DocumentPaths$_l_Index}; DB_t_MethodText)
If (False:C215)
	
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	METHOD GET PATHS:C1163(Path project method:K72:1; $_at_DocumentPaths)
	SORT ARRAY:C229($_at_DocumentPaths)
	ARRAY LONGINT:C221($_al_MethodLength; 0)
	For ($_l_Method; 1; Size of array:C274($_at_DocumentPaths))
		$_l_Length:=Length:C16($_at_DocumentPaths{$_l_Method})
		APPEND TO ARRAY:C911($_al_MethodLength; $_l_Length)
	End for 
	SORT ARRAY:C229($_al_MethodLength; $_at_DocumentPaths; <)
	//longest names first
	$_ti_DocumentofChanges:=Create document:C266(""; "TEXT")
	For ($_l_Method; 1; Size of array:C274($_at_DocumentPaths))
		If (Position:C15(" "; $_at_DocumentPaths{$_l_Method})>0) & ($_at_DocumentPaths{$_l_Method}#"SCRATCH_CHANGEMETHODNAMES")
			
			
			$_t_newName:=Replace string:C233($_at_DocumentPaths{$_l_Method}; " "; "_")
			If (Find in array:C230($_at_DocumentPaths; $_t_newName)<0)
				MESSAGE:C88(String:C10($_l_Method)+" of "+String:C10(Size of array:C274($_at_DocumentPaths))+" "+$_at_DocumentPaths{$_l_Method}+" "+$_t_newName)
				
				SEND PACKET:C103($_ti_DocumentOfChanges; "$_t_ScriptText:=Replace string($_t_ScriptText; "+Char:C90(34)+$_at_DocumentPaths{$_l_Method}+Char:C90(34)+";"+Char:C90(34)+$_t_newName+Char:C90(34)+")"+Char:C90(13))
				
				//Note this is going to create a new method.
				METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Method}; $_t_SourceCode)
				//TRACE
				METHOD SET CODE:C1194($_t_newName; $_t_SourceCode)
				/////
				ARRAY TEXT:C222($_at_DocumentPaths2; 0)
				METHOD GET PATHS:C1163(2; $_at_DocumentPaths2)  //Database methods
				If (True:C214)
					For ($_l_Method2; 1; Size of array:C274($_at_DocumentPaths2))
						METHOD GET CODE:C1190($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode)
						$_t_SourceCode2:=Replace string:C233($_t_SourceCode; $_at_DocumentPaths{$_l_Method}; $_t_newName)
						If ($_t_SourceCode2#$_t_SourceCode)
							METHOD SET CODE:C1194($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode2)
						End if 
					End for 
				End if 
				METHOD GET PATHS:C1163(8; $_at_DocumentPaths2)  //trigger methods
				If (True:C214)
					For ($_l_Method2; 1; Size of array:C274($_at_DocumentPaths2))
						METHOD GET CODE:C1190($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode)
						$_t_SourceCode2:=Replace string:C233($_t_SourceCode; $_at_DocumentPaths{$_l_Method}; $_t_newName)
						If ($_t_SourceCode2#$_t_SourceCode)
							METHOD SET CODE:C1194($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode2)
						End if 
					End for 
				End if 
				METHOD GET PATHS:C1163(4; $_at_DocumentPaths2)  //project form methods
				If (True:C214)
					For ($_l_Method2; 1; Size of array:C274($_at_DocumentPaths2))
						METHOD GET CODE:C1190($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode)
						$_t_SourceCode2:=Replace string:C233($_t_SourceCode; $_at_DocumentPaths{$_l_Method}; $_t_newName)
						If ($_t_SourceCode2#$_t_SourceCode)
							METHOD SET CODE:C1194($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode2)
						End if 
					End for 
					
				End if 
				
				METHOD GET PATHS:C1163(Path project method:K72:1; $_at_DocumentPaths2)  //Project method paths
				If (True:C214)
					For ($_l_Method2; 1; Size of array:C274($_at_DocumentPaths2))
						If ($_at_DocumentPaths2{$_l_Method2}#$_at_DocumentPaths{$_l_Method})
							METHOD GET CODE:C1190($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode)
							$_t_SourceCode2:=Replace string:C233($_t_SourceCode; $_at_DocumentPaths{$_l_Method}; $_t_newName)
							If ($_t_SourceCode2#$_t_SourceCode)
								METHOD SET CODE:C1194($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode2)
							End if 
						End if 
					End for 
				End if 
				//TRACE
				
				$_l_LastTable:=Get last table number:C254
				For ($_l_Table; 1; $_l_LastTable)
					If (Is table number valid:C999($_l_Table))
						ARRAY TEXT:C222($_at_FormNames; 0)
						$_ptr_Table:=Table:C252($_l_Table)
						FORM GET NAMES:C1167($_ptr_Table->; $_at_FormNames)
						For ($_l_FormNumber; 1; Size of array:C274($_at_FormNames))
							METHOD GET PATHS FORM:C1168($_Ptr_Table->; $_at_DocumentPaths2; $_at_FormNames{$_l_FormNumber}; *)
							For ($_l_Method2; 1; Size of array:C274($_at_DocumentPaths2))
								If ($_at_DocumentPaths2{$_l_Method2}#$_at_DocumentPaths{$_l_Method})
									METHOD GET CODE:C1190($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode)
									$_t_SourceCode2:=Replace string:C233($_t_SourceCode; $_at_DocumentPaths{$_l_Method}; $_t_newName)
									If ($_t_SourceCode2#$_t_SourceCode)
										METHOD SET CODE:C1194($_at_DocumentPaths2{$_l_Method2}; $_t_SourceCode2)
									End if 
								End if 
							End for 
							
							
							
						End for 
					End if 
					
				End for 
			Else 
				MESSAGE:C88(String:C10($_l_Method)+" of "+String:C10(Size of array:C274($_at_DocumentPaths))+" "+$_at_DocumentPaths{$_l_Method}+" "+$_t_newName)
				SEND PACKET:C103($_ti_DocumentOfChanges; "FIX $_t_ScriptText:=Replace string($_t_ScriptText; "+Char:C90(34)+$_at_DocumentPaths{$_l_Method}+Char:C90(34)+";"+Char:C90(34)+$_t_newName+Char:C90(34)+")"+Char:C90(13))
				
				
			End if 
			
			
		End if 
		METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Method}; $_t_SourceCode)
		If ($_at_DocumentPaths{$_l_Method}="DB_OpenRecordFromSelection")
			
			TRACE:C157
		End if 
		Repeat 
			$_l_Position:=Position:C15("Form Set"; $_t_SourceCode)
			If ($_l_Position>0)
				$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position)
				$_l_Position:=Position:C15(Char:C90(13); $_t_SourceCode)
				If ($_l_Position<0)
					$_l_Position:=Position:C15(Char:C90(10); $_t_SourceCode)
				End if 
				$_l_Position2:=Position:C15(")"; $_t_SourceCode)
				If ($_l_Position2<$_l_Position)
					$_l_position:=Position:C15(")"; $_t_SourceCode)
					
					$_t_Form:=Substring:C12($_t_SourceCode; 1; $_l_position)
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_position+2)
					
					$_l_position:=Position:C15("("; $_t_Form)
					$_t_Form:=Substring:C12($_t_Form; $_l_position+1)
					
					$_l_LastTable:=Get last table number:C254
					For ($_l_Table; 1; $_l_LastTable)
						If (Is table number valid:C999($_l_Table))
							$_tableName:=Table name:C256($_l_Table)
							If (Position:C15("["+$_tableName+"]"; $_t_Form)>0)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								$_t_Form:=Substring:C12($_t_Form; $_l_Postion+1)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								If ($_l_Postion>0)
									$_t_Form:=Substring:C12($_t_Form; 1; $_l_Postion-1)
								End if 
								$_t_Form:=Replace string:C233($_t_Form; Char:C90(34); "")
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								//$_obj_Strip:=New object("text";$_t_Form;"where";"Start")
								$_t_Form:=UTIL_TrimSpaces(New object:C1471("text"; $_t_Form; "where"; New collection:C1472("Start"; "End")))
								
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								////
								ARRAY TEXT:C222($_at_FormNames; 0)
								$_ptr_Table:=Table:C252($_l_Table)
								FORM GET NAMES:C1167($_ptr_Table->; $_at_FormNames)
								For ($_L_CheckSPac; 1; Size of array:C274($_at_FormNames))
									If (Position:C15(" "; $_at_FormNames{$_L_CheckSPac})>0)
										SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_tableName+" "+$_at_FormNames{$_L_CheckSPac}+Char:C90(13))
									End if 
								End for 
								
								$_L_FindForm:=Find in array:C230($_at_FormNames; $_t_Form)
								If ($_L_FindForm<0)
									SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_tableName+" "+$_t_Form+"in "+$_at_DocumentPaths{$_l_Method}+Char:C90(13))
									
								End if 
							End if 
						End if 
						
					End for 
				Else 
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position+1)
				End if 
			End if 
		Until ($_l_Position=0)
		METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Method}; $_t_SourceCode)
		If ($_at_DocumentPaths{$_l_Method}="ProcessIndexutility")
			TRACE:C157
		End if 
		Repeat 
			$_l_Position:=Position:C15("Dialogue"; $_t_SourceCode)
			If ($_l_Position>0)
				$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position)
				
				$_l_Position:=Position:C15(Char:C90(13); $_t_SourceCode)
				If ($_l_Position<0)
					$_l_Position:=Position:C15(Char:C90(10); $_t_SourceCode)
				End if 
				$_l_Position2:=Position:C15(")"; $_t_SourceCode)
				If ($_l_Position2<$_l_Position)
					$_l_position:=Position:C15(")"; $_t_SourceCode)
					
					$_t_Form:=Substring:C12($_t_SourceCode; 1; $_l_position)
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_position+2)
					
					$_l_position:=Position:C15("("; $_t_Form)
					$_t_Form:=Substring:C12($_t_Form; $_l_position+1)
					
					$_l_LastTable:=Get last table number:C254
					For ($_l_Table; 1; $_l_LastTable)
						If (Is table number valid:C999($_l_Table))
							$_tableName:=Table name:C256($_l_Table)
							If (Position:C15("["+$_tableName+"]"; $_t_Form)>0)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								$_t_Form:=Substring:C12($_t_Form; $_l_Postion+1)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								If ($_l_Postion>0)
									$_t_Form:=Substring:C12($_t_Form; 1; $_l_Postion-1)
								End if 
								$_t_Form:=Replace string:C233($_t_Form; Char:C90(34); "")
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								//$_obj_Strip:=New object("text";$_t_Form;"where";"Start")
								$_t_Form:=UTIL_TrimSpaces(New object:C1471("text"; $_t_Form; "where"; New collection:C1472("Start"; "End")))
								
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								////
								ARRAY TEXT:C222($_at_FormNames; 0)
								$_ptr_Table:=Table:C252($_l_Table)
								FORM GET NAMES:C1167($_ptr_Table->; $_at_FormNames)
								For ($_L_CheckSPac; 1; Size of array:C274($_at_FormNames))
									If (Position:C15(" "; $_at_FormNames{$_L_CheckSPac})>0)
										SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_tableName+" "+$_at_FormNames{$_L_CheckSPac}+Char:C90(13))
									End if 
								End for 
								
								$_L_FindForm:=Find in array:C230($_at_FormNames; $_t_Form)
								If ($_L_FindForm<0)
									SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_t_Form+"in "+$_at_DocumentPaths{$_l_Method}+Char:C90(13))
									
								End if 
							End if 
						End if 
						
					End for 
				Else 
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position+1)
				End if 
				
				
			End if 
		Until ($_l_Position=0)
		METHOD GET CODE:C1190($_at_DocumentPaths{$_l_Method}; $_t_SourceCode)
		If ($_at_DocumentPaths{$_l_Method}="ProcessIndexutility")
			
			//TRACE
		End if 
		Repeat 
			$_l_Position:=Position:C15("Print form"; $_t_SourceCode)
			If ($_l_Position>0)
				$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position)
				$_l_Position:=Position:C15(Char:C90(13); $_t_SourceCode)
				If ($_l_Position<0)
					$_l_Position:=Position:C15(Char:C90(10); $_t_SourceCode)
				End if 
				$_l_Position2:=Position:C15(")"; $_t_SourceCode)
				If ($_l_Position2<$_l_Position)
					$_l_position:=Position:C15(")"; $_t_SourceCode)
					
					$_t_Form:=Substring:C12($_t_SourceCode; 1; $_l_position)
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_position+2)
					
					$_l_position:=Position:C15("("; $_t_Form)
					$_t_Form:=Substring:C12($_t_Form; $_l_position+1)
					
					
					$_l_LastTable:=Get last table number:C254
					For ($_l_Table; 1; $_l_LastTable)
						If (Is table number valid:C999($_l_Table))
							$_tableName:=Table name:C256($_l_Table)
							If (Position:C15("["+$_tableName+"]"; $_t_Form)>0)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								$_t_Form:=Substring:C12($_t_Form; $_l_Postion+1)
								$_l_Postion:=Position:C15(";"; $_t_Form)
								If ($_l_Postion>0)
									$_t_Form:=Substring:C12($_t_Form; 1; $_l_Postion-1)
								End if 
								
								
								$_t_Form:=Replace string:C233($_t_Form; Char:C90(34); "")
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								//$_obj_Strip:=New object("text";$_t_Form;"where";"Start")
								$_t_Form:=UTIL_TrimSpaces(New object:C1471("text"; $_t_Form; "where"; New collection:C1472("Start"; "End")))
								
								$_t_Form:=Replace string:C233($_t_Form; ")"; "")
								////
								ARRAY TEXT:C222($_at_FormNames; 0)
								$_ptr_Table:=Table:C252($_l_Table)
								FORM GET NAMES:C1167($_ptr_Table->; $_at_FormNames)
								For ($_L_CheckSPac; 1; Size of array:C274($_at_FormNames))
									If (Position:C15(" "; $_at_FormNames{$_L_CheckSPac})>0)
										SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_tableName+" "+$_at_FormNames{$_L_CheckSPac}+Char:C90(13))
									End if 
								End for 
								
								$_L_FindForm:=Find in array:C230($_at_FormNames; $_t_Form)
								If ($_L_FindForm<0)
									SEND PACKET:C103($_ti_DocumentOfChanges; "Fix Form Name "+$_t_Form+"in "+$_at_DocumentPaths{$_l_Method}+Char:C90(13))
									
								End if 
							End if 
						End if 
						
					End for 
				Else 
					$_t_SourceCode:=Substring:C12($_t_SourceCode; $_l_Position+1)
					
				End if 
			End if 
		Until ($_l_Position=0)
		
		
	End for 
	//For ($0
	
	CLOSE DOCUMENT:C267($_ti_DocumentofChanges)
	
	TRACE:C157
Else 
	TRACE:C157
	
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "userName"; "")
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	TRACE:C157
	//$_obj_Records:=ds.PRODUCTS.all()
	//$_t_ThisScript:="TRACE"+Char(13)
	//$_t_ThisScript:=$_t_ThisScript+"ALert(String($1.length))"
	//$_t_Sscript:="<!--#4DCODE"+Char(13)+$_t_ThisScript+Char(13)+"-->"
	//$_t_Result:="$_t_Result"
	//PROCESS 4D TAGS($_t_Sscript; $_t_Result; $_obj_Records)
	TRACE:C157
	ARRAY TEXT:C222($_at_TableNames; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY TEXT:C222($_at_2SFieldNames; 0; 0)
	ARRAY LONGINT:C221($_al_2DFieldNumbers; 0; 0)
	ARRAY TEXT:C222($_at_RecStateCodes; 0; 0)  //see States Load
	ARRAY LONGINT:C221($_al_RecStateSortOrder; 0; 0)
	ARRAY TEXT:C222($_at_RecStateNames; 0; 0)
	ARRAY TEXT:C222($_at_RecStateAbbrev; 0; 0)
	ARRAY LONGINT:C221($_al_RecStateRestriction; 0; 0)
	ARRAY LONGINT:C221($_al_TableUniqueField; 0)  //define these now so at least they will be 0
	ARRAY LONGINT:C221($_al_TableRecordNameField; 0)  //if they're used before finishing this proc
	
	$_Obj_Datastore:=ds:C1482
	TRACE:C157
	ARRAY TEXT:C222($_at_Export; 0)
	
	$_obj_Fields:=New object:C1471
	$_obj_Fields.tableNames:=New collection:C1472
	$_obj_Fields.tableNumbers:=New collection:C1472
	$_obj_Fields.fieldNames:=New collection:C1472
	$_obj_Fields.fieldNumbers:=New collection:C1472
	Load_Fields($_obj_Fields)
	If (Not:C34($_Obj_Datastore=Null:C1517))
		OB GET PROPERTY NAMES:C1232($_Obj_Datastore; $_at_TestTableNames)
		$_l_LastTableNumber:=Size of array:C274($_at_TestTableNames)
		ARRAY TEXT:C222($_at_TableNames; $_l_LastTableNumber)
		ARRAY LONGINT:C221($_al_TableNumbers; $_l_LastTableNumber)
		ARRAY TEXT:C222($_at_PrimeKeys; $_l_LastTableNumber)
		ARRAY LONGINT:C221($_al_RecordNameField; $_l_LastTableNumber)
		ARRAY OBJECT:C1221($_aobj_ManyRelations; $_l_LastTableNumber; 0)
		ARRAY OBJECT:C1221($_aobj_OneRelations; $_l_LastTableNumber; 0)
		
		ARRAY TEXT:C222($_at_2SFieldNames; $_l_LastTableNumber; 0)
		ARRAY LONGINT:C221($_al_2DFieldNumbers; $_l_LastTableNumber; 0)
		ARRAY TEXT:C222($_at_RecStateCodes; $_l_LastTableNumber; 0)  //see States Load
		ARRAY LONGINT:C221($_al_RecStateSortOrder; $_l_LastTableNumber; 0)
		ARRAY TEXT:C222($_at_RecStateNames; $_l_LastTableNumber; 0)
		ARRAY TEXT:C222($_at_RecStateAbbrev; $_l_LastTableNumber; 0)
		ARRAY LONGINT:C221($_al_RecStateRestriction; $_l_LastTableNumber; 0)
		ARRAY LONGINT:C221($_al_TableUniqueField; $_l_LastTableNumber)  //define these now so at least they will be 0
		ARRAY LONGINT:C221($_al_TableRecordNameField; $_l_LastTableNumber)  //if they're used before finishing this proc
		TRACE:C157
		
		$_l_CurrentRow:=0
		For ($_l_Tables; 1; Size of array:C274($_at_TestTableNames))
			$_obj_Infos:=ds:C1482[$_at_TestTableNames{$_l_Tables}].getInfo()
			
			GET TABLE PROPERTIES:C687($_obj_Infos.tableNumber; $_bo_invisible)
			
			If (Current user:C182="DESIGNER")
				$_bo_invisible:=False:C215
			Else 
				
				If ($_at_TableNames{$_l_Tables}="SF_@") | ($_at_TableNames{$_l_Tables}="X@")
					$_bo_invisible:=True:C214
				End if 
				
			End if 
			If (Not:C34($_bo_invisible))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_obj_Class:=ds:C1482[$_at_TestTableNames{$_l_Tables}]
				OB GET PROPERTY NAMES:C1232($_obj_Class; $_at_TestFields)
				
				$_at_PrimeKeys{$_l_CurrentRow}:=$_obj_Infos.primaryKey
				$_al_TableNumbers{$_l_CurrentRow}:=$_obj_Infos.tableNumber
				$_at_TableNames{$_l_CurrentRow}:=$_at_TestTableNames{$_l_Tables}  //APPEND TO ARRAY($_al_TableNumbers; $_l_Tables)
				$_CurrentField:=0
				
				For ($_l_Fields; 1; Size of array:C274($_at_TestFields))
					$_obj_Field:=ds:C1482[$_at_TestTableNames{$_l_Tables}][$_at_TestFields{$_l_Fields}]
					Case of 
						: ($_obj_Field.fieldType=42)  //RelatedEntities
							//TRACE
							If ($_obj_Field.kind="relatedEntities")
								APPEND TO ARRAY:C911($_aobj_ManyRelations{$_l_CurrentRow}; $_obj_Field)
								//$_t_Json:=JSON Stringify($_obj_Field)
								//If (Position("1"; $_t_Json)>0) | (Position("2"; $_t_Json)>0) | (Position("3"; $_t_Json)>0) | (Position("4"; $_t_Json)>0) | (Position("5"; $_t_Json)>0) | (Position("6"; $_t_Json)>0) | (Position("7"; $_t_Json)>0) | (Position("8"; $_t_Json)>0) | (Position("9"; $_t_Json)>0)
								
								//APPEND TO ARRAY($_at_Export; $_at_TestTableNames{$_l_Tables}+Char(9)+$_t_Json)
							Else 
								//TRACE
								$_l_FieldNumber:=$_obj_Field.fieldNumber
								$_l_TableNumber:=$_obj_Infos.tableNumber
								GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
								If (Not:C34($_bo_FieldInvisible))
									$_CurrentField:=$_CurrentField+1
									APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
									APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
									Case of 
										: ($_obj_Infos.tableNumber=1)
											If ($_obj_Field.name="Company_Name")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=198)
											If ($_obj_Field.name="Bank_Account_Number")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=32)
											If ($_obj_Field.name="ACCOUNTS")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=34)
											//no record 'name'
											
										Else 
											//TRACE
											
									End case 
									
								End if 
								
								
							End if 
						: ($_obj_Field.fieldType=38)  //RelatedEntity
							
							If ($_obj_Field.kind="relatedEntity")
								APPEND TO ARRAY:C911($_aobj_OneRelations{$_l_CurrentRow}; $_obj_Field)
								//$_t_Json:=JSON Stringify($_obj_Field)
								//If (Position("1"; $_t_Json)>0) | (Position("2"; $_t_Json)>0) | (Position("3"; $_t_Json)>0) | (Position("4"; $_t_Json)>0) | (Position("5"; $_t_Json)>0) | (Position("6"; $_t_Json)>0) | (Position("7"; $_t_Json)>0) | (Position("8"; $_t_Json)>0) | (Position("9"; $_t_Json)>0)
								
								//APPEND TO ARRAY($_at_Export; $_at_TestTableNames{$_l_Tables}+Char(9)+$_t_Json)
							Else 
								//TRACE
								$_l_FieldNumber:=$_obj_Field.fieldNumber
								$_l_TableNumber:=$_obj_Infos.tableNumber
								GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
								If (Not:C34($_bo_FieldInvisible))
									$_CurrentField:=$_CurrentField+1
									APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
									APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
									Case of 
										: ($_obj_Infos.tableNumber=1)
											If ($_obj_Field.name="Company_Name")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=198)
											If ($_obj_Field.name="Bank_Account_Number")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=32)
											If ($_obj_Field.name="ACCOUNTS")
												$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
											End if 
										: ($_obj_Infos.tableNumber=34)
											//no record 'name'
											
										Else 
											//TRACE
											
									End case 
									
								End if 
								
								
							End if 
						Else 
							$_l_FieldNumber:=$_obj_Field.fieldNumber
							$_l_TableNumber:=$_obj_Infos.tableNumber
							GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
							If (Not:C34($_bo_FieldInvisible))
								$_CurrentField:=$_CurrentField+1
								APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
								APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
								Case of 
									: ($_obj_Infos.tableNumber=1)
										If ($_obj_Field.name="Company_Name")
											$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
										End if 
									: ($_obj_Infos.tableNumber=198)
										If ($_obj_Field.name="Bank_Account_Number")
											$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
										End if 
									: ($_obj_Infos.tableNumber=32)
										If ($_obj_Field.name="ACCOUNTS")
											$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
										End if 
									: ($_obj_Infos.tableNumber=34)
										//no record 'name'
										
									Else 
										//TRACE
										
								End case 
								
							End if 
					End case 
				End for 
			End if 
		End for 
		$_ti_Document:=Create document:C266(""; "TEXT")
		For ($i; 1; Size of array:C274($_at_Export))
			SEND PACKET:C103($_ti_Document; $_at_Export{$i}+Char:C90(13))
		End for 
		
	End if 
	TRACE:C157
	//$_l_TableToAddTo:=Table(->[WORKFLOW_CONTROL])
	//DB_CreateNewRecord(0; False; $_l_TableToAddTo; True)
	$_obj_Scripts:=ds:C1482.SCRIPTS.query("Script_Code =:1"; "Maint Up TM")
	If ($_obj_Scripts.length>0)
		$_t_Script:=$_obj_Scripts[0].Recording_Text
		$_obj_Formula:=Formula:C1597($_t_Script)
		$_obj_FormulaObject:=New object:C1471("Maint_Up_TM"; $_obj_Formula)
		$_t_Whatsit:=Call.Maint_Up_TM()
	End if 
	
	
End if 
