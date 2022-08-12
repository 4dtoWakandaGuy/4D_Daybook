//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_IndexoneField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 2:03 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY POINTER:C280($_aptr_FieldPointerArray; 0)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $1; $2)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_TablePointer)
	C_TEXT:C284($_t_FieldName; $_t_IndexName; $_t_oldMethodName; $_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_IndexoneField")
//this has been done so that everything does not stop
If (Count parameters:C259>=2)
	//the method
	$_ptr_FieldPointer:=Field:C253($1; $2)
	//SET INDEX($_ptr_FieldPointer->;True;100)  `100% optimize for queries cannot use ptrs
	//``
	$_l_TableNumber:=$1
	$_l_FieldNumber:=$2
	$_ptr_TablePointer:=Table:C252($_l_TableNumber)
	$_t_TableName:=Table name:C256($_ptr_TablePointer)
	$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
	$_t_FieldName:=Field name:C257($_ptr_FieldPointer)
	$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
	ARRAY POINTER:C280($_aptr_FieldPointerArray; 1)
	$_aptr_FieldPointerArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
	$_t_IndexName:=$_t_TableName+$_t_FieldName+"indx"
	$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
	CREATE INDEX:C966($_ptr_TablePointer->; $_aptr_FieldPointerArray; Default index type:K58:2; $_t_IndexName)
End if 
ERR_MethodTrackerReturn("AA_IndexoneField"; $_t_oldMethodName)
