//%attributes = {}
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ALL CALLS TO THIS METHOD NEED TO CHANGE TO PASS THE ENTITY)
	//C_UNKNOWN(in the  first parameter)
	//C_UNKNOWN(RECORD)
	ARRAY LONGINT:C221($_al_PropertyNumbers; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	C_BOOLEAN:C305($_bo_useCollection)
	C_COLLECTION:C1488($_COL_Attributes)
	C_LONGINT:C283($_l_BuildAttributes; $_l_Index; $_l_offset; $_l_PropertyNumber; $_l_PropertyRow)
	C_OBJECT:C1216($_Obj_Attribute; $_obj_Entity; $_obj_NewRow)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $_t_PropertyName; $_t_PropertyValue; $1; $3; $4)
End if 
//Code Starts Here
, , , <--ALL CALLS TO THIS METHOD NEED TO CHANGE TO PASS THE ENTITY(RECORD)in the  first parameter
$_t_oldMethodName:=ERR_MethodTracker("AA_SetListItemProperty")
//This method loads the properties from the CURRENT list itemrecord
//It then finds the property name passed in $1
//sets the numberic value passed in $2 and a string value if passed in $3
If (Count parameters:C259>=2)
	$_obj_Entity:=$1
	$_t_PropertyName:=$2
	$_l_PropertyNumber:=$3
	If (Count parameters:C259>=3)
		$_t_PropertyValue:=$4
	Else 
		$_t_PropertyValue:=""
	End if 
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY LONGINT:C221($_al_PropertyNumbers; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	$_bo_useCollection:=False:C215
	If ($_obj_Entity.x_ItemAttributesOBJECT=Null:C1517)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_at_PropertyNames; $_l_offset)
		BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_al_PropertyNumbers; $_l_offset)
		BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_at_PropertyValues; $_l_offset)
		$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; $_t_PropertyName)
	Else 
		If (Not:C34($_obj_Entity.x_ItemAttributesOBJECT.propertyAttributes=Null:C1517))
			$_COL_Attributes:=New collection:C1472
			$_COL_Attributes:=$_obj_Entity.x_ItemAttributesOBJECT.propertyAttributes
			$_l_Index:=0
			For each ($_Obj_Attribute; $_COL_Attributes)
				If ($_Obj_Attribute.PropertyType=$_t_PropertyName)
					$_l_PropertyRow:=$_l_Index
					$_bo_useCollection:=True:C214
				End if 
			End for each 
		End if 
	End if 
	
	If ($_l_PropertyRow>=0)
		If ($_bo_useCollection)
			$_COL_Attributes[$_l_PropertyRow].number:=$_l_PropertyNumber
		Else 
			$_at_PropertyNames{$_l_PropertyRow}:=$_t_PropertyName
			$_al_PropertyNumbers{$_l_PropertyRow}:=$_l_PropertyNumber
		End if 
		
		If (Count parameters:C259>=3)
			If ($_bo_useCollection)
				$_COL_Attributes[$_l_PropertyRow].name:=$_t_PropertyValue
			Else 
				$_at_PropertyNames{$_l_PropertyRow}:=$_t_PropertyName
				$_at_PropertyValues{$_l_PropertyRow}:=$_t_PropertyValue
			End if 
			
		Else 
			If ($_bo_useCollection)
				$_at_PropertyValues{$_l_PropertyRow}:=""
			End if 
		End if 
	Else 
		If ($_bo_useCollection)
			If ($_t_PropertyValue="")
				$_obj_NewRow:=New object:C1471("PropertyType"; $_t_PropertyName; "number"; $_l_PropertyNumber)
			Else 
				$_obj_NewRow:=New object:C1471("PropertyType"; $_t_PropertyName; "name"; $_t_PropertyValue)
				
			End if 
			$_COL_Attributes.push($_obj_NewRow)
			
		Else 
			APPEND TO ARRAY:C911($_at_PropertyNames; $_t_PropertyName)
			APPEND TO ARRAY:C911($_al_PropertyNumbers; $_l_PropertyNumber)
			APPEND TO ARRAY:C911($_at_PropertyValues; $_t_PropertyValue)
			$_COL_Attributes:=New collection:C1472
			For ($_l_BuildAttributes; 1; Size of array:C274($_t_PropertyName)
				If ($_at_PropertyValues{}="")
					$_obj_NewRow:=New object:C1471("PropertyType"; $_at_PropertyNames{$_l_BuildAttributes}; "number"; $_al_PropertyNumbers{$_l_BuildAttributes})
				Else 
					$_obj_NewRow:=New object:C1471("PropertyType"; $_at_PropertyNames{$_l_BuildAttributes}; "name"; $_at_PropertyValues{$_l_BuildAttributes})
					
				End if 
				$_COL_Attributes.push($_obj_NewRow)
				
			End for 
			
		End if 
	End if 
	SET BLOB SIZE:C606([LIST_ITEMS:95]X_Revised_Attributes:9; 0)
	$_obj_Entity.x_ItemAttributesOBJECT.propertyAttributes:=$_COL_Attributes
	//VARIABLE TO BLOB($_at_PropertyNames; [LIST_ITEMS]X_Revised_Attributes; *)
	//VARIABLE TO BLOB($_al_PropertyNumbers; [LIST_ITEMS]X_Revised_Attributes; *)
	//VARIABLE TO BLOB($_at_PropertyValues; [LIST_ITEMS]X_Revised_Attributes; *)
End if 
ERR_MethodTrackerReturn("AA_SetListItemProperty"; $_t_oldMethodName)
