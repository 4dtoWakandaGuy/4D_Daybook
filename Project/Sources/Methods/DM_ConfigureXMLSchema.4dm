//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ConfigureXMLSchema
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
	//C_UNKNOWN($0)
	//ARRAY LONGINT(DM_al_2DObjectReference;0;0)
	//ARRAY TEXT(DM_at_2DObjectAttNames;0;0)
	//ARRAY TEXT(DM_at_2DObjectAttValues;0;0)
	//ARRAY TEXT(DM_at_2DObjectName;0;0)
	C_BLOB:C604(DM_Bl_XMLBLob)
	C_BOOLEAN:C305($0; $3; $_bo_Validation; $3)
	C_LONGINT:C283($_l_AttributesXMLReference; $_l_Index; $_l_Level; $_l_ArraySize; $_l_AttributesXMLReference; $_l_Index; $_l_Level; DM_l_CurrentObjectReference)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_AttributeValue; $_t_BLobStructureReference; $_t_ElementData; $_t_ElementName; $_t_ElementXMLReference; $_t_ObjectName; $_t_oldMethodName; $_t_StructureReference; $_t_TableName; $_t_ValidationPath; $4)
	C_TEXT:C284($_t_AttributeName; $_t_AttributeValue; $_t_ElementData; $_t_ElementName; $_t_ElementXMLReference; $_t_ObjectName; $_t_oldMethodName; $_t_StructureReference; $_t_ValidationPath; $1; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ConfigureXMLSchema")
//Pass this method an XML structure
// it will extract the elements and display them to the user for mapping to daybook fields`This can then be used to save the schema for future reference
//note the sourceof the xml does not matter.
//$1 is document path(can be URL whatever
//S2 can be a pointer to a text variable containing XML or a pointer to blob containing the XML structure
If (Count parameters:C259>=4)
	$_bo_Validation:=$3
	$_t_ValidationPath:=$4
End if 

If (Count parameters:C259>=1)
	//if the XML is less than 32K pass the text in $1
	//if it is greater than then it must be in a document..pass the path to the document in $2
	If ($1#"")
		If ($_bo_Validation)
			$_t_StructureReference:=DOM Parse XML source:C719($1; $_bo_Validation; $_t_ValidationPath)
		Else 
			$_t_StructureReference:=DOM Parse XML source:C719($1)
		End if 
		
		
	Else 
		//Read from Variable
		SET BLOB SIZE:C606(DM_Bl_XMLBLob; 0)
		TEXT TO BLOB:C554($2->; DM_Bl_XMLBLob)
		
		If ($_bo_Validation)
			$_t_StructureReference:=DOM Parse XML variable:C720(DM_Bl_XMLBLob; $_bo_Validation; $_t_ValidationPath)
		Else 
			$_t_StructureReference:=DOM Parse XML variable:C720(DM_Bl_XMLBLob)
			
		End if 
	End if 
	//Note that in the following sequence we are loading the XML STRUCTURE. that is the range of entities from the XML file
	//Although the DM_at_2DObjectName array is two dimensional. each ROW of this array corresponds to ONE entity so a sub entity is recorded
	//in the NEXT COLUMN. The DM_al_2DObjectReference array which corresponds to is used to store a reference which is then used on the
	//heirarchical list to display the structure.
	//When receiving data we load the structure of that data in the same way(except we also load the entity values). An entity with no VALUE (just subentities)
	//can clearly be identified as a section or context..so it can not be mapped in itself to a field.
	
	DM_l_CurrentObjectReference:=1
	ARRAY TEXT:C222(DM_at_2DObjectName; 0; 0)
	ARRAY LONGINT:C221(DM_al_2DObjectReference; 0; 0)
	
	ARRAY TEXT:C222(DM_at_2DObjectAttNames; 0; 0)
	ARRAY TEXT:C222(DM_at_2DObjectAttValues; 0; 0)
	
	If ($_t_StructureReference#"")
		INSERT IN ARRAY:C227(DM_al_2DObjectReference; Size of array:C274(DM_al_2DObjectReference)+1; 1)
		INSERT IN ARRAY:C227(DM_at_2DObjectName; Size of array:C274(DM_at_2DObjectName)+1; 1)
		$_l_ArraySize:=Size of array:C274(DM_al_2DObjectReference)
		INSERT IN ARRAY:C227(DM_al_2DObjectReference{$_l_ArraySize}; 1; 1)
		INSERT IN ARRAY:C227(DM_at_2DObjectName{$_l_ArraySize}; 1; 1)
		INSERT IN ARRAY:C227(DM_at_2DObjectAttNames; Size of array:C274(DM_at_2DObjectAttNames)+1; 1)
		INSERT IN ARRAY:C227(DM_at_2DObjectAttValues; Size of array:C274(DM_at_2DObjectAttValues)+1; 1)
		$_l_ArraySize:=Size of array:C274(DM_at_2DObjectName)
		$_l_AttributesXMLReference:=DOM Count XML attributes:C727($_t_StructureReference)
		If ($_l_AttributesXMLReference>0)
			INSERT IN ARRAY:C227(DM_at_2DObjectAttNames{$_l_ArraySize}; 1; $_l_AttributesXMLReference)
			INSERT IN ARRAY:C227(DM_at_2DObjectAttValues{$_l_ArraySize}; 1; $_l_AttributesXMLReference)
			For ($_l_Index; 1; $_l_AttributesXMLReference)
				DOM GET XML ATTRIBUTE BY INDEX:C729($_t_StructureReference; $_l_Index; $_t_AttributeName; $_t_AttributeValue)
				DM_at_2DObjectAttNames{$_l_ArraySize}{$_l_Index}:=$_t_AttributeName
				DM_at_2DObjectAttValues{$_l_ArraySize}{$_l_Index}:=$_t_AttributeValue
			End for 
		End if 
		DOM GET XML ELEMENT NAME:C730($_t_StructureReference; $_t_ObjectName)
		DM_at_2DObjectName{$_l_ArraySize}{1}:=$_t_ObjectName
		DM_al_2DObjectReference{$_l_ArraySize}{1}:=1
		//$FieldCount:=Count XML elements($TableReference;$_t_TableName)
		$_l_Level:=1
		
		While (OK=1)
			DM_LoadXMLStructureElements($_t_StructureReference; $_l_Level; ->DM_at_2DObjectName; ->DM_al_2DObjectReference; ->DM_at_2DObjectAttNames; ->DM_at_2DObjectAttValues)
			$_t_ElementXMLReference:=DOM Get next sibling XML element:C724($_t_StructureReference; $_t_ElementName; $_t_ElementData)
			//
		End while 
		//NOW WE CAN SET UP THE INTERFACE
		
	Else 
		$0:=False:C215
	End if 
	
Else 
	$0:=False:C215
	
End if 
ERR_MethodTrackerReturn("DM_ConfigureXMLSchema"; $_t_oldMethodName)
