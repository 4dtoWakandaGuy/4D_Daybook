//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyNum; 0)
	ARRAY LONGINT:C221($_al_PropertyNUMS; 0)
	ARRAY LONGINT:C221($_al_PropertyValues; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	C_COLLECTION:C1488($_Col_PropertyTypes)
	C_LONGINT:C283($_l_ArraySize; $_l_Offset; $_l_Properties)
	C_OBJECT:C1216($_Obj_ListItems; $_obj_Property; $_Obj_PropertyITem; $1)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_GetListItemProperties")
//This method loads the properties for the current list
$_Obj_PropertyITem:=$1
ARRAY TEXT:C222($_at_PropertyNames; 0)
ARRAY LONGINT:C221($_al_PropertyNum; 0)
ARRAY TEXT:C222($_at_PropertyValue; 0)
$_l_Offset:=0
If ($_Obj_PropertyITem.x_ItemAttributesOBJECT=Null:C1517)
	//then the data has not been moved yet
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY LONGINT:C221($_al_PropertyNUMS; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	BLOB TO VARIABLE:C533($_Obj_PropertyITem.X_Revised_Attributes; $_at_PropertyNames; $_l_Offset)
	$_l_ArraySize:=Size of array:C274($_at_PropertyNames)
	If (BLOB size:C605($_Obj_PropertyITem.X_Revised_Attributes)>$_l_Offset)
		BLOB TO VARIABLE:C533($_Obj_PropertyITem.X_Revised_Attributes; $_al_PropertyNUMS; $_l_Offset)
		If (BLOB size:C605($_Obj_PropertyITem.X_Revised_Attributes)>$_l_Offset)
			BLOB TO VARIABLE:C533($_Obj_PropertyITem.X_Revised_Attributes; $_at_PropertyValues; $_l_Offset)
		Else 
			
		End if 
	Else 
		
	End if 
	$_Col_PropertyTypes:=New collection:C1472
	For ($_l_Properties; 1; Size of array:C274($_at_PropertyNames))
		If ($_al_PropertyNUMS{$_l_Properties}#0)
			$_obj_Property:=New object:C1471("Property Type"; $_at_PropertyNames{$_l_Properties}; "Number"; $_al_PropertyNUMS{$_l_Properties})
		Else 
			$_obj_Property:=New object:C1471("Property Type"; $_at_PropertyNames{$_l_Properties}; "Name"; $_al_PropertyValues{$_l_Properties})
		End if 
		$_Col_PropertyTypes.push($_obj_Property)
	End for 
	$_Obj_ListItems.x_ItemAttributesOBJECT.properties:=$_Col_PropertyTypes
	DB_SaveEntity($_Obj_ListItems)
	
End if 
ARRAY TEXT:C222($_at_PropertyNames; $_l_ArraySize)
ARRAY LONGINT:C221($_al_PropertyNum; $_l_ArraySize)
ARRAY TEXT:C222($_at_PropertyValue; $_l_ArraySize)
If (Count parameters:C259>=3)
	COPY ARRAY:C226($_at_PropertyNames; $2->)
	COPY ARRAY:C226($_al_PropertyNum; $3->)
	COPY ARRAY:C226($_at_PropertyValue; $4->)
End if 
ERR_MethodTrackerReturn("AA_GetListItemProperties"; $_t_oldMethodName)
