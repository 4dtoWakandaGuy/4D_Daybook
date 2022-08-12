//%attributes = {}
If (False:C215)
	//Project Method Name:      XML_READDTD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/09/2012 05:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RowTypes; 0)
	ARRAY LONGINT:C221($_al_TableRow; 0)
	ARRAY TEXT:C222($_at_2DTableFIeldIterations; 0; 0)
	ARRAY TEXT:C222($_at_2DTableFields; 0; 0)
	ARRAY TEXT:C222($_at_AttributeField; 0)
	ARRAY TEXT:C222($_at_AttributeName; 0)
	ARRAY TEXT:C222($_at_AttributeTable; 0)
	ARRAY TEXT:C222($_at_DTDRows; 0)
	ARRAY TEXT:C222($_at_ExpectedTableIterations; 0)
	ARRAY TEXT:C222($_at_ExpectedTables; 0)
	ARRAY TEXT:C222($_at_FieldName; 0)
	ARRAY TEXT:C222($_at_Tables; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_Optional; $_bo_Repeating; $_bo_Single)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition; $_l_CurrentRow2; $_l_DocRefNUM; $_l_Index; $_l_Index2; $_l_Row; $_l_TablePosition)
	C_TEXT:C284($_t_Entities; $_t_Entity; $_t_Name; $_t_oldMethodName; $_t_TableName; $_t_XMLDTD)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("XML_READDTD")
$_ti_DocumentRef:=Open document:C264(""; ""; 2)
$_l_DocRefNUM:=$_ti_DocumentRef*1
//TRACE
If ($_l_DocRefNUM>0)
	RECEIVE PACKET:C104($_ti_DocumentRef; $_t_XMLDTD; 32000)
	//we will store the text of a defined dtd in table-for simplicity this will be a text field(we are unlikely to have a vast array of dtds
	//we will then store the tranlation of that dtd to 4D in vars in the same record
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	//Because this is the DTD it will not validate as XML
	ARRAY TEXT:C222($_at_DTDRows; 0)
	Repeat 
		$_l_CharacterPosition:=Position:C15(">"; $_t_XMLDTD)
		If ($_l_CharacterPosition>0)
			APPEND TO ARRAY:C911($_at_DTDRows; Substring:C12($_t_XMLDTD; 1; $_l_CharacterPosition))
			$_t_XMLDTD:=Substring:C12($_t_XMLDTD; $_l_CharacterPosition+1)
		End if 
	Until (OK=0) | ($_l_CharacterPosition=0)
	ARRAY LONGINT:C221($_al_RowTypes; 0)
	ARRAY LONGINT:C221($_al_RowTypes; Size of array:C274($_at_DTDRows))
	For ($_l_Index; 1; Size of array:C274($_at_DTDRows))
		$_l_CharacterPosition:=Position:C15("ELEMENT"; $_at_DTDRows{$_l_Index})
		Case of 
			: ($_l_CharacterPosition>0)
				$_l_CharacterPosition:=Position:C15("(#"; $_at_DTDRows{$_l_Index})
				If ($_l_CharacterPosition>0)
					$_al_RowTypes{$_l_Index}:=2
				Else 
					$_l_CharacterPosition:=Position:C15("("; $_at_DTDRows{$_l_Index})
					If ($_l_CharacterPosition>0)
						$_al_RowTypes{$_l_Index}:=1
						//? or + only have meaning in validating the data for the validation of the dtd against structure they dont have meaning
						//what we have to watch out for is where data is store in attributes. so a line after an element coul be attributes of the element and those attributes could be 'sub data' of the element
						//that sub data could be in the same table for us or in a related table.
						//also we have to cope with an element being a table(type 1) but really being a field within daybook(or just a section of a table) and the 'fields(entities) of the table(sub entities). being the fields
						
					End if 
				End if 
			: (Position:C15("ATTRIBUTE"; $_at_DTDRows{$_l_Index})>0)
				
			Else 
		End case 
	End for 
	ARRAY TEXT:C222($_at_Tables; 0)
	ARRAY LONGINT:C221($_al_TableRow; 0)
	For ($_l_Index; 1; Size of array:C274($_al_RowTypes))
		If ($_al_RowTypes{$_l_Index}=1)
			APPEND TO ARRAY:C911($_at_Tables; $_at_DTDRows{$_l_Index})
			APPEND TO ARRAY:C911($_al_TableRow; $_l_Index)
		End if 
	End for 
	//now for each 'table'(collection of entities)
	//`get the entity name. if the name is ROOT the 'fields' of this entity are the 'tables' of the structure.
	//we can do a nice validation as the 'list of tables can be extracted from the root
	//Be careful a FIELD of a table(an object of an entity could itself be an entity(table) with its own fields
	ARRAY TEXT:C222($_at_ExpectedTables; 0)
	ARRAY TEXT:C222($_at_ExpectedTableIterations; 0)
	ARRAY TEXT:C222($_at_2DTableFields; 0; 0)
	ARRAY TEXT:C222($_at_2DTableFIeldIterations; 0; 0)
	//note that not all DTDs will have this-this is a 4D thing and maybe others.
	//if there is an element named root this only give the names of the entities and their scope
	For ($_l_Index; 1; Size of array:C274($_at_Tables))
		$_t_Name:=Replace string:C233($_at_Tables{$_l_Index}; "<!ELEMENT"; "")
		$_l_CharacterPosition:=Position:C15("Root"; $_t_Name)
		If ($_l_CharacterPosition>0)
			//This is the root element
			//`the 'root' element is therefore not expected to contain complex statements only a simple list of entities.
			
			$_l_CharacterPosition:=Position:C15("("; $_t_Name)
			If ($_l_CharacterPosition>0)
				$_t_Entities:=Substring:C12($_t_Name; $_l_CharacterPosition+1)
				Repeat 
					$_bo_Optional:=False:C215
					$_bo_Repeating:=False:C215
					$_bo_Single:=False:C215
					
					$_l_CharacterPosition:=Position:C15(","; $_t_Entities)
					If ($_l_CharacterPosition>0)
						$_t_Entity:=Substring:C12($_t_Entities; 1; $_l_CharacterPosition-1)
						$_t_Entities:=Substring:C12($_t_Entities; $_l_CharacterPosition+1)
					Else 
						$_t_Entity:=$_t_Entities
						$_t_Entities:=""
					End if 
					$_l_CharacterPosition:=Position:C15(")"; $_t_Entity)
					If ($_l_CharacterPosition>0)
						$_t_Entity:=Substring:C12($_t_Entity; 1; $_l_CharacterPosition-1)
					End if 
					If ($_t_Entity#"")
						$_bo_Optional:=False:C215
						$_bo_Repeating:=False:C215
						$_bo_Single:=False:C215
						
						If ($_t_Entity[[Length:C16($_t_Entity)]]="*")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							
							$_bo_Repeating:=True:C214
						End if 
						If ($_t_Entity[[Length:C16($_t_Entity)]]="+")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							
							$_bo_Single:=True:C214
						End if 
						If ($_t_Entity[[Length:C16($_t_Entity)]]="?")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							$_bo_Optional:=True:C214
						End if 
						//Actually this is only really expected to be *
						$_l_TablePosition:=Find in array:C230($_at_ExpectedTables; $_t_Entity)
						If ($_l_TablePosition<0)
							APPEND TO ARRAY:C911($_at_ExpectedTables; $_t_Entity)
							$_l_ArraySize:=Size of array:C274($_at_ExpectedTables)
							INSERT IN ARRAY:C227($_at_2DTableFields; $_l_ArraySize; 1)  //Create the row for the field names
							INSERT IN ARRAY:C227($_at_2DTableFIeldIterations; $_l_ArraySize; 1)  // create the Row for the field name iterations..
							
							Case of 
								: ($_bo_Optional)
									APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Optional")
								: ($_bo_Repeating)
									APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Repeating")
								: ($_bo_Single)
									APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Once")
								Else 
									APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "")
							End case 
						End if 
						
					End if 
				Until ($_t_Entities="")
				
			End if 
		Else 
			$_l_CharacterPosition:=Position:C15("("; $_t_Name)
			If ($_l_CharacterPosition>0)
				$_t_TableName:=Substring:C12($_t_Name; 1; $_l_CharacterPosition-1)
				$_t_Entities:=Substring:C12($_t_Name; $_l_CharacterPosition+1)
				$_bo_Exit:=False:C215
				//strip leading spaces
				Repeat 
					If ($_t_TableName#"")
						If ($_t_TableName[[1]]=" ") | ((Character code:C91($_t_TableName[[(1)]]))=13) | ((Character code:C91($_t_TableName[[(1)]]))=10)
							$_t_TableName:=Substring:C12($_t_TableName; 2)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
				//string trailing spaces
				$_bo_Exit:=False:C215
				//strip leading spaces
				Repeat 
					If ($_t_TableName#"")
						If ($_t_TableName[[Length:C16($_t_TableName)]]=" ") | (Character code:C91($_t_TableName[[Length:C16($_t_TableName)]])=13) | (Character code:C91($_t_TableName[[Length:C16($_t_TableName)]])=10)
							$_t_TableName:=Substring:C12($_t_TableName; 1; Length:C16($_t_TableName)-1)
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
				//Is the table already defined?
				$_l_TablePosition:=Find in array:C230($_at_ExpectedTables; $_t_TableName)
				If ($_l_TablePosition<0)
					APPEND TO ARRAY:C911($_at_ExpectedTables; $_t_TableName)
					$_l_ArraySize:=Size of array:C274($_at_ExpectedTables)
					INSERT IN ARRAY:C227($_at_2DTableFields; $_l_ArraySize; 1)  //Create the row for the field names
					INSERT IN ARRAY:C227($_at_2DTableFIeldIterations; $_l_ArraySize; 1)  // create the Row for the field name iterations..
					$_l_Row:=$_l_ArraySize
				Else 
					$_l_Row:=$_l_TablePosition
				End if 
				If ($_t_Entities#"")
					$_t_Entities:=Replace string:C233($_t_Entities; ")>"; "")
					
					//These could be the field names(look for # elements for them)-or they could be related tables in which case the relation between A and B must be recorded.
					ARRAY TEXT:C222($_at_FieldName; 0)  //The 'field names' of this entity
					//So that this can go multiple levels deep if needed
					XML_ExtractSubEntities($_t_TableName; $_t_Entities; ->$_at_FieldName)
					//Here we test the Field names are NOT defined as Entities-if they are then an FK(Foreign Key) needs to exist in that sub entity.
					//note that We do not strip the * ? + off the field names in the extract
					//That should be done here.
					For ($_l_Index2; 1; Size of array:C274($_at_FieldName))
						$_t_Entity:=$_at_FieldName{$_l_Index2}
						Repeat 
							If ($_t_Entity#"")
								If ($_t_Entity[[1]]=" ") | ((Character code:C91($_t_Entity[[(1)]]))=13) | ((Character code:C91($_t_Entity[[(1)]]))=10)
									$_t_Entity:=Substring:C12($_t_Entity; 2)
								Else 
									$_bo_Exit:=True:C214
								End if 
							Else 
								$_bo_Exit:=True:C214
							End if 
						Until ($_bo_Exit)
						//string trailing spaces
						$_bo_Exit:=False:C215
						//strip leading spaces
						Repeat 
							If ($_t_Entity#"")
								If ($_t_Entity[[Length:C16($_t_Entity)]]=" ") | (Character code:C91($_t_Entity[[Length:C16($_t_Entity)]])=13) | (Character code:C91($_t_Entity[[Length:C16($_t_Entity)]])=10)
									$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
								Else 
									$_bo_Exit:=True:C214
								End if 
							Else 
								$_bo_Exit:=True:C214
							End if 
						Until ($_bo_Exit)
						
						If ($_t_Entity[[Length:C16($_t_Entity)]]="*")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							$_bo_Repeating:=True:C214
						End if 
						If ($_t_Entity[[Length:C16($_t_Entity)]]="+")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							$_bo_Single:=True:C214
						End if 
						If ($_t_Entity[[Length:C16($_t_Entity)]]="?")
							$_t_Entity:=Substring:C12($_t_Entity; 1; Length:C16($_t_Entity)-1)
							$_bo_Optional:=True:C214
						End if 
						$_l_TablePosition:=Find in array:C230($_at_ExpectedTables; $_t_Entity)
						If ($_l_TablePosition<0)
							//its a field
							
							Case of 
								: ($_bo_Optional)
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_Row}; $_t_Entity)
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_Row}; "Optional")  //aka nullable!
								: ($_bo_Repeating)  //if its repeating its a table!!!
									//The reference to the table must be stored as a field so we know its a relation
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_Row}; $_t_Entity)
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_Row}; "Related")  //aka create a row in the table for the entity with an iD (generated) in this field
									APPEND TO ARRAY:C911($_at_ExpectedTables; $_t_Entity)
									$_l_ArraySize:=Size of array:C274($_at_ExpectedTables)
									INSERT IN ARRAY:C227($_at_2DTableFields; $_l_ArraySize; 1)  //Create the row for the field names
									INSERT IN ARRAY:C227($_at_2DTableFIeldIterations; $_l_ArraySize; 1)  // create the Row for the field name iterations..
									$_l_CurrentRow2:=$_l_ArraySize
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_CurrentRow2}; "FK_"+$_t_TableName)  //<-this field is added to the import to support the relationship in the import-it may not be stored in the data.
									
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_CurrentRow2}; "Optional")
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_CurrentRow2}; $_t_Entity)
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_CurrentRow2}; "Optional")
								: ($_bo_Single)  //Not really relevent in defining a field-it means mandatory
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_Row}; $_t_Entity)
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_Row}; "Once")
								Else 
									APPEND TO ARRAY:C911($_at_2DTableFields{$_l_Row}; $_t_Entity)
									APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_Row}; "")
							End case 
						Else 
							//the entity will have an element for the table
							//we must create a FK in that table definition(append) and store the FK value in this 'table'
							APPEND TO ARRAY:C911($_at_2DTableFields{$_l_Row}; $_t_Entity)
							APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_Row}; "Related")  //aka create a row in the table for the entity with an iD (generated) in this field
							APPEND TO ARRAY:C911($_at_2DTableFields{$_l_TablePosition}; "FK_"+$_t_TableName)  //<-this field is added to the import to support the relationship in the import-it may not be stored in the data.
							APPEND TO ARRAY:C911($_at_2DTableFIeldIterations{$_l_TablePosition}; "Optional")
							
						End if 
						
					End for 
				End if 
				If (False:C215)
					Case of 
						: ($_bo_Optional)
							APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Optional")
						: ($_bo_Repeating)
							
							APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Repeating")
						: ($_bo_Single)
							APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "Once")
						Else 
							APPEND TO ARRAY:C911($_at_ExpectedTableIterations; "")
					End case 
				End if 
			End if 
		End if 
		
	End for 
End if 
//if there are attributes of a field element.
//these attibutes may be 'look-up'-ie another table or they may be data stored in the main table(Or simply ignored)
//this point to create a consistent 'stucture' the attributes will considered as attibute tables. this allows us to then store in a consitent way what to do with the attributes
ARRAY TEXT:C222($_at_AttributeField; 0)  //the field to which the attribute belongs
ARRAY TEXT:C222($_at_AttributeTable; 0)  //the table to which the field using the attribute belong
ARRAY TEXT:C222($_at_AttributeName; 0)

//'good' practice says dont store data in attributes..except for things like ID
ERR_MethodTrackerReturn("XML_READDTD"; $_t_oldMethodName)