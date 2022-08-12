//%attributes = {}
C_OBJECT:C1216($1)
C_OBJECT:C1216($2)
If (Count parameters:C259>=2)
	$_col_NamedCollection:=$1
	$_obj_FindProperties:=$2
	If (Not:C34($_col_NamedCollection=Null:C1517)) & (Not:C34($_obj_FindProperties=Null:C1517))
		$_t_objectName:=$_obj_FindProperties.attribute
		$_col_NamedCollection.result:=$_col_NamedCollection.value[$_t_objectName]=$_obj_FindProperties.attributevalue
	End if 
End if 



//$1.result:=$1.value.name=$2

