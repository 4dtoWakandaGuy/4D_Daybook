//%attributes = {}
If (False:C215)
	//Project Method Name:      XML_ExtractSubEntities
	//------------------ Method Notes ------------------
	//This method will return a list of Fields and a list of Table
	//given the string A,(B,C)
	//This should return A as a field and 'table' consisting of B and C)-related to A
	//Given a string (A,B(C(D,E))
	//This would return A and B as fields
	//C as a table consisting of C(Related to A)
	//D as a table consisting of D and E related to C
	
	//------------------ Revision Control ----------------
	//Date Created: 29/09/2012 13:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_SubEntities; 0)
	ARRAY TEXT:C222($_at_SubEntityFields; 0; 0)
	C_LONGINT:C283($_l_Index; $_l_PipePosition; $_l_PositionA; $_l_SubTableNumber)
	C_POINTER:C301($_ptr_FieldNamesArray; $3)
	C_TEXT:C284($_t_AfterBracket; $_t_BeforeBracket; $_t_EntityString; $_t_FieldName; $_t_FieldType; $_t_oldMethodName; $_t_SubEntity; $_t_TableName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("XML_ExtractSubEntities")
If (Count parameters:C259>=3)
	$_t_TableName:=$1
	$_t_EntityString:=$2
	$_ptr_FieldNamesArray:=$3
	
	//The following are passed down to any sub call...
	ARRAY TEXT:C222($_at_FieldNames; 0)  //The 'field names' of this entity
	ARRAY TEXT:C222($_at_SubEntities; 0)  //bracketed sub entity Parent(level one will relate to the $_t_TableName
	ARRAY TEXT:C222($_at_SubEntityFields; 0; 0)  //Element 'fields'
	$_l_SubTableNumber:=0
	Repeat 
		$_l_PipePosition:=Position:C15("("; $_t_EntityString)
		If ($_l_PipePosition>0)
			//in the contexting of parsing the DTD of a table this is going to be in the form (C | D)
			//in the database C and D are just seperate fields-the | is for data validation in XML the data import does not need to validate them.
			
			//Then there is a sub entity to parse
			$_t_BeforeBracket:=Substring:C12($_t_EntityString; 1; $_l_PipePosition-1)
			$_t_SubEntity:=Substring:C12($_t_EntityString; $_l_PipePosition+1)
			
			//This has to be the outside bracket-any inside bracket stays in the sub entity
			$_l_PositionA:=0
			For ($_l_Index; Length:C16($_t_SubEntity); 1; -1)
				If ($_t_SubEntity[[$_l_Index]]=")")
					$_l_PositionA:=$_l_Index
					$_l_Index:=0
				End if 
			End for 
			If ($_l_PositionA>0)
				//it better be
				//the original element may have looked like this
				//<!ELEMENT Book (Title, (Author | Editor)+, Price, Review*)>
				//we strip author | editor)
				//this we should NOT find in an entity definition.
				$_t_AfterBracket:=""
				If ($_l_PositionA<Length:C16($_t_SubEntity))
					$_t_AfterBracket:=Substring:C12($_t_SubEntity; $_l_PositionA+1)
					If ($_t_AfterBracket#"")
						If ($_t_AfterBracket[[1]]="*") | ($_t_AfterBracket[[1]]="*")
							$_t_FieldType:=$_t_AfterBracket[[1]]
							$_t_AfterBracket:=Substring:C12($_t_AfterBracket; 2)
						End if 
					End if 
					
					$_t_SubEntity:=Substring:C12($_t_SubEntity; 1; $_l_PositionA-1)
					ARRAY TEXT:C222($_at_FieldNames; 0)  //The 'field names' of this entity
					XML_ExtractSubEntities($_t_TableName; $_t_SubEntity; ->$_at_FieldNames)
					
					For ($_l_Index; 1; Size of array:C274($_at_FieldNames))
						APPEND TO ARRAY:C911($_ptr_FieldNamesArray->; $_at_FieldNames{$_l_Index})
					End for 
					If ($_t_AfterBracket#"")
						If ($_t_AfterBracket[[1]]#",")
							$_t_EntityString:=$_t_BeforeBracket+","+$_t_AfterBracket
						Else 
							$_t_EntityString:=$_t_BeforeBracket+$_t_AfterBracket
						End if 
					Else 
						$_t_EntityString:=$_t_BeforeBracket
					End if 
					
				End if 
				
			End if 
		Else 
			$_l_PipePosition:=Position:C15(","; $_t_EntityString)
			Case of 
				: ($_l_PipePosition>0)
					$_t_FieldName:=Substring:C12($_t_EntityString; 1; $_l_PipePosition-1)
					APPEND TO ARRAY:C911($_ptr_FieldNamesArray->; $_t_FieldName)
					$_t_EntityString:=Substring:C12($_t_EntityString; $_l_PipePosition+1)
				: (Position:C15("|"; $_t_EntityString)>0)
					$_l_PipePosition:=Position:C15("|"; $_t_EntityString)
					
					$_t_FieldName:=Substring:C12($_t_EntityString; 1; $_l_PipePosition-1)
					APPEND TO ARRAY:C911($_ptr_FieldNamesArray->; $_t_FieldName)
					$_t_EntityString:=Substring:C12($_t_EntityString; $_l_PipePosition+1)
					
				Else 
					$_t_FieldName:=$_t_EntityString
					APPEND TO ARRAY:C911($_ptr_FieldNamesArray->; $_t_FieldName)
					$_t_EntityString:=""
			End case 
		End if 
		
	Until ($_t_EntityString="")
	
End if 
ERR_MethodTrackerReturn("XML_ExtractSubEntities"; $_t_oldMethodName)