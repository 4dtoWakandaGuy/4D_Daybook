//%attributes = {}
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ALL CALLS TO THIS NEED TO BE CHANGED TO PASS THE ENTITY)
	//C_UNKNOWN(RECORD)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	C_LONGINT:C283($_l_offset; $_l_PropertyNumber; $_l_PropertyRow)
	C_OBJECT:C1216($_obj_Entity)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $_t_PropertyName; $_t_PropertyValue; $1; $3; $4)
End if 
//Code Starts Here
ALL CALLS TO THIS NEED TO BE CHANGED TO PASS THE ENTITY(RECORD)in$1
$_t_oldMethodName:=ERR_MethodTracker("AA_SetListProperty")
//This method loads the properties from the CURRENT list record
//It then finds the property name passed in $1
//sets the numberic value passed in $2 and a string value if passed in $3
If (Count parameters:C259>=2)
	$_obj_Entity:=$1
	$_t_PropertyName:=$2
	$_l_PropertyNumber:=$3
	If (Count parameters:C259>=4)
		$_t_PropertyValue:=$4
	Else 
		$_t_PropertyValue:=""
	End if 
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	$_l_offset:=0
	If (Not:C34($_obj_Entity.x_ListValues=Null:C1517))
		BLOB TO VARIABLE:C533($_obj_Entity.x_ListValues; $_at_PropertyNames; $_l_offset)
		BLOB TO VARIABLE:C533($_obj_Entity.x_ListValues; $_al_PropertyNumber; $_l_offset)
		BLOB TO VARIABLE:C533($_obj_Entity.x_ListValues; $_at_PropertyValue; $_l_offset)
	End if 
	$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; $_t_PropertyName)
	
	If ($_l_PropertyRow>0)
		$_at_PropertyNames{$_l_PropertyRow}:=$_t_PropertyName
		$_al_PropertyNumber{$_l_PropertyRow}:=$_l_PropertyNumber
		If (Count parameters:C259>=4)  //this was not setting the value
			$_at_PropertyValue{$_l_PropertyRow}:=$4
		Else 
			$_at_PropertyValue{$_l_PropertyRow}:=""
		End if 
	Else 
		APPEND TO ARRAY:C911($_at_PropertyNames; $_t_PropertyName)
		APPEND TO ARRAY:C911($_al_PropertyNumber; $_l_PropertyNumber)
		APPEND TO ARRAY:C911($_at_PropertyValue; $_t_PropertyValue)
	End if 
	SET BLOB SIZE:C606($_obj_Entity.x_ListValues; 0)
	VARIABLE TO BLOB:C532($_at_PropertyNames; $_obj_Entity.x_ListValues; *)
	VARIABLE TO BLOB:C532($_al_PropertyNumber; $_obj_Entity.x_ListValues; *)
	VARIABLE TO BLOB:C532($_at_PropertyValue; $_obj_Entity.x_ListValues; *)
End if 
ERR_MethodTrackerReturn("AA_SetListProperty"; $_t_oldMethodName)
