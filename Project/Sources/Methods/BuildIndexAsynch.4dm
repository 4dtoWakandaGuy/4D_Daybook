//%attributes = {}
If (False:C215)
	//Project Method Name:      BuildIndexAsynch
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
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $1; $2)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_FieldName; $_t_IndexName; $_t_oldMethodName; $_t_TableName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BuildIndexAsynch")

// BuildIndexAsynch
// Parameters: $1 = table num
//                     $2 = field num
//$3 indexing semaphore
// 30/09/03 pb
If (False:C215)  //bsw 16/04/04 crashes so modified
	//If (Not(Semaphore($2)))
	// SET INDEX($1->;True;100)  ` fast mode, synchronous
	// CLEAR SEMAPHORE($2)
	//End if
Else 
	If (Count parameters:C259>2)
		If ($1>0) & ($2>0)
			If (Not:C34(Semaphore:C143($3)))
				$_ptr_Field:=Field:C253($1; $2)
				//SET INDEX($_ptr_Field->;True;100)  ` fast mode, synchronous
				$_l_TableNumber:=$1
				$_l_FieldNumber:=$2
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				$_t_TableName:=Table name:C256($_Ptr_Table)
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_t_FieldName:=Field name:C257($_ptr_Field)
				$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
				ARRAY POINTER:C280($_aptr_FieldsArray; 1)
				$_aptr_FieldsArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_t_IndexName:=$_t_TableName+$_t_FieldName+"indx"
				$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
				CREATE INDEX:C966($_Ptr_Table->; $_aptr_FieldsArray; Default index type:K58:2; $_t_IndexName)
				
				CLEAR SEMAPHORE:C144($3)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("BuildIndexAsynch"; $_t_oldMethodName)
