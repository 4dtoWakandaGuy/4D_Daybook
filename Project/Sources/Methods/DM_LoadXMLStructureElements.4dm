//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_LoadXMLStructureElements
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
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($6)
	//C_UNKNOWN($ElementData)
	//C_UNKNOWN($ParentelementName)
	//ARRAY TEXT(DM_at_2DObjectAttNames;0)
	//ARRAY TEXT(DM_at_2DObjectAttValues;0)
	C_BOOLEAN:C305($_bo_New)
	C_LONGINT:C283($_l_AttributeColumn; $_l_AttributesXMLReference; $_l_Column; $_l_ColumnCount; $_l_index; $_l_InsertLevel; $_l_LastColumnReference; $_l_Level; $_l_TestIndex; $2; $_l_ArraySize)
	C_LONGINT:C283($_l_AttributeColumn; $_l_AttributesXMLReference; $_l_Column; $_l_ColumnCount; $_l_index; $_l_InsertLevel; $_l_LastColumnReference; $_l_Level; $_l_TestIndex; $2; DM_l_CurrentObjectReference)
	C_POINTER:C301($4; $5; $6; $3)
	C_TEXT:C284($_t_AttributeValue; $_t_ElementName; $_t_ElementName2; $_t_ElementReference2; $_t_ElementXMLReference; $_t_oldMethodName; $_t_ParentElementReference; $1; $ElementData; $ParentelementName; $_t_AttributeName)
	C_TEXT:C284($_t_AttributeValue; $_t_ElementName; $_t_ElementName2; $_t_ElementReference2; $_t_ElementXMLReference; $_t_oldMethodName; $_t_ParentElementReference; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_LoadXMLStructureElements")
//This method will load the (structure) sub-element names for the element referenced in $1. It will only Load_One instance of each entity
//so repeating records are ignored-we are only interested in the entity names
$_t_ParentElementReference:=$1
$_l_LastColumnReference:=$2
$_l_Level:=$_l_LastColumnReference+1

DOM GET XML ELEMENT NAME:C730($1; $ParentelementName)

$_t_ElementXMLReference:=DOM Get first child XML element:C723($_t_ParentElementReference; $_t_ElementName; $ElementData)
While (OK=1)
	//Repeat
	DOM GET XML ELEMENT NAME:C730($_t_ElementXMLReference; $_t_ElementName)
	If ($_t_ElementXMLReference#"") & ($_t_ElementName#"")
		$_bo_New:=True:C214
		For ($_l_TestIndex; 1; Size of array:C274($3->))
			$_l_AttributeColumn:=Find in array:C230($3->{$_l_TestIndex}; $_t_ElementName)
			If ($_l_AttributeColumn>0)
				$_l_ArraySize:=$_l_TestIndex
				$_bo_New:=False:C215
				$_l_TestIndex:=Size of array:C274($3->)
			End if 
		End for 
		If ($_bo_New)
			
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; 1)
			INSERT IN ARRAY:C227($4->; Size of array:C274($4->)+1; 1)
			INSERT IN ARRAY:C227($5->; Size of array:C274($5->)+1; 1)
			INSERT IN ARRAY:C227($6->; Size of array:C274($6->)+1; 1)
			$_l_ArraySize:=Size of array:C274($3->)
			If ((Size of array:C274($3->{$_l_ArraySize}))<$_l_Level)
				$_l_ColumnCount:=Size of array:C274($3->{$_l_ArraySize})
				$_l_InsertLevel:=$_l_Level-($_l_ColumnCount)
				INSERT IN ARRAY:C227($3->{$_l_ArraySize}; $_l_ColumnCount+1; $_l_InsertLevel)
				INSERT IN ARRAY:C227($4->{$_l_ArraySize}; $_l_ColumnCount+1; $_l_InsertLevel)
			End if 
			DM_l_CurrentObjectReference:=DM_l_CurrentObjectReference+1
			$3->{$_l_ArraySize}{$_l_Level}:=$_t_ElementName
			$4->{$_l_ArraySize}{$_l_Level}:=DM_l_CurrentObjectReference
			
		End if 
		$_l_AttributesXMLReference:=DOM Count XML attributes:C727($_t_ElementXMLReference)
		If ($_l_AttributesXMLReference>0)
			If ($_bo_New)
				INSERT IN ARRAY:C227(DM_at_2DObjectAttNames{$_l_ArraySize}; 1; $_l_AttributesXMLReference)
				INSERT IN ARRAY:C227(DM_at_2DObjectAttValues{$_l_ArraySize}; 1; $_l_AttributesXMLReference)
				$_l_Column:=0
			Else 
				$_l_Column:=Size of array:C274(DM_at_2DObjectAttNames{$_l_ArraySize})
			End if 
			
			For ($_l_index; 1; $_l_AttributesXMLReference)
				
				DOM GET XML ATTRIBUTE BY INDEX:C729($_t_ElementXMLReference; $_l_index; $_t_AttributeName; $_t_AttributeValue)
				$_l_AttributeColumn:=Find in array:C230(DM_at_2DObjectAttNames{$_l_ArraySize}; $_t_AttributeName)
				// as we are loading the structure we only need one attribute value as an example
				If ($_l_AttributeColumn<0)
					$_l_Column:=$_l_Column+1
					If ($_l_Column>(Size of array:C274(DM_at_2DObjectAttNames{$_l_ArraySize})))
						
						INSERT IN ARRAY:C227(DM_at_2DObjectAttNames{$_l_ArraySize}; Size of array:C274(DM_at_2DObjectAttNames{$_l_ArraySize})+1; 1)
						INSERT IN ARRAY:C227(DM_at_2DObjectAttValues{$_l_ArraySize}; Size of array:C274(DM_at_2DObjectAttValues{$_l_ArraySize})+1; 1)
					End if 
					DM_at_2DObjectAttNames{$_l_ArraySize}{$_l_Column}:=$_t_AttributeName
					DM_at_2DObjectAttValues{$_l_ArraySize}{$_l_Column}:=$_t_AttributeValue
				End if 
			End for 
		End if 
		$_t_ElementReference2:=DOM Get first child XML element:C723($_t_ElementXMLReference; $_t_ElementName2)
		If (Ok=1)
			If ($_t_ElementReference2#"") & ($_t_ElementName2#"")
				//This element has sub elements so walk down that road
				DM_LoadXMLStructureElements($_t_ElementXMLReference; $_l_Level; $3; $4; $5; $6)
				
			End if 
		Else 
			
		End if 
		
	End if 
	$_t_ElementReference2:=$_t_ElementXMLReference
	$_t_ElementXMLReference:=DOM Get next sibling XML element:C724($_t_ElementReference2; $_t_ElementName; $ElementData)
	//
End while 



//Until ($_t_ElementXMLReference="") | ($_t_ElementName="")
ERR_MethodTrackerReturn("DM_LoadXMLStructureElements"; $_t_oldMethodName)
