//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_FindIndexKey
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_useFindIndexKey)
	C_LONGINT:C283($_l_CountParameters; $_l_FieldLength; $_l_FieldType; $_l_QueryCode; $_l_QueryResult; $_l_TableNumber; $_l_Value; $0; $2; $4)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Value; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_FindIndexKey")
//$1 Pointer to fields
//$2 Integer Longint Value to be checked
//$3 String Value to be checked
//$4 pass 1 force it to not to use find index key (default value is 0 so function
//will try find index key command first)

//$0 result (-1 or zero if nothing matching found)


$_l_CountParameters:=Count parameters:C259

If ((Not:C34(Is nil pointer:C315($1))) & ($_l_CountParameters>1))
	
	$_l_TableNumber:=Table:C252($1)
	$_ptr_Table:=Table:C252($_l_TableNumber)
	$_ptr_FieldPointer:=$1
	
	If ($_l_CountParameters>1)
		$_l_Value:=$2
	Else 
		$_l_Value:=0
	End if 
	
	If ($_l_CountParameters>2)
		$_t_Value:=$3
	Else 
		$_t_Value:=""
	End if 
	
	If ($_l_CountParameters>3)
		$_l_QueryCode:=$4
	Else 
		$_l_QueryCode:=0
	End if 
	
	GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
	
	
	$_bo_useFindIndexKey:=(($_bo_FieldIndexed) & (Not:C34(DB_Indexing)) & ($_l_QueryCode=0))  //Is index actually complete or half way
	
	If ($_bo_useFindIndexKey)  //Great we can use faster command " find index key " to check unique value
		
		Case of 
			: (($_l_FieldType=Is longint:K8:6) | ($_l_FieldType=Is integer:K8:5) | ($_l_FieldType=Is real:K8:4))
				
				Case of 
					: ($_l_Value#0)
						$0:=Find in field:C653($_ptr_FieldPointer->; $_l_Value)
					: ($_t_Value#"")
						$_l_Value:=Num:C11($_t_Value)
						$0:=Find in field:C653($_ptr_FieldPointer->; $_l_Value)
				End case 
				
			: ($_l_FieldType=Is alpha field:K8:1)
				
				Case of 
					: ($_l_Value#0)
						$_t_Value:=String:C10($_l_Value)
						If (Length:C16($_t_Value)>$_l_FieldLength)
							$_t_Value:=Substring:C12($_t_Value; 1; $_l_FieldLength)
						End if 
						$0:=Find in field:C653($_ptr_FieldPointer->; $_t_Value)
						
					: ($_t_Value#"")
						If (Length:C16($_t_Value)>$_l_FieldLength)
							$_t_Value:=Substring:C12($_t_Value; 1; $_l_FieldLength)
						End if 
						$0:=Find in field:C653($_ptr_FieldPointer->; $_t_Value)
				End case 
				
		End case 
		
	Else 
		SET QUERY LIMIT:C395(1)
		// The query will return its result in a variable
		// without changing the current record nor the current selection
		SET QUERY DESTINATION:C396(3; $_l_QueryResult)
		
		Case of   //bsw section is handling data types of fields and values in case of Further field
			: (($_l_FieldType=Is longint:K8:6) | ($_l_FieldType=Is integer:K8:5) | ($_l_FieldType=Is real:K8:4))
				
				Case of 
					: ($_l_Value#0)
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_l_Value)
					: ($_t_Value#"")
						$_l_Value:=Num:C11($_t_Value)
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_l_Value)
				End case 
				
			: ($_l_FieldType=Is alpha field:K8:1)
				
				Case of 
					: ($_l_Value#0)
						$_t_Value:=String:C10($_l_Value)
						If (Length:C16($_t_Value)>$_l_FieldLength)
							$_t_Value:=Substring:C12($_t_Value; 1; $_l_FieldLength)
						End if 
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_t_Value)
					: ($_t_Value#"")
						If (Length:C16($_t_Value)>$_l_FieldLength)
							$_t_Value:=Substring:C12($_t_Value; 1; $_l_FieldLength)
						End if 
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_t_Value)
				End case 
				
		End case 
		
		If ($_l_QueryResult>0)
			$0:=$_l_QueryResult
		Else 
			$0:=-1
		End if 
		
		SET QUERY DESTINATION:C396(Into current selection:K19:1)  // Restore normal query mode
		SET QUERY LIMIT:C395(0)  // No longer limit queries
		
		DB_SetIndex_p($_ptr_FieldPointer)  //Also set index for this field so that it is optimized for next time
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_FindIndexKey"; $_t_oldMethodName)