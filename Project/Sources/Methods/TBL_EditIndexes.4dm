//%attributes = {}

If (False:C215)
	//Project Method Name:      TBL_EditIndexes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(TBL_al_indexFieldNumbers;0)
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_isUnique; $2)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table)
	C_TEXT:C284($_t_IndexName; $_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("TBL_EditIndexes")

If (True:C214)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 2/6/10 8:14 AM
	//Method Name: TBL_EditIndexes
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TBL_EditIndexes")
// >> removes all indexes, except for unique fields
// >> for the table$_l_TableNumber
If (False:C215)
	If (Count parameters:C259>=2)
		
		
		
		$_bo_isUnique:=False:C215
		$_l_TableNumber:=$1
		If ($2=False:C215)
			ARRAY LONGINT:C221(TBL_al_indexFieldNumbers; 0)
			$_l_FieldCount:=Get last field number:C255($_l_TableNumber)
			For ($_l_FieldIndex; 1; $_l_FieldCount)
				If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
					
					$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldIndex)
					GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
					If (Not:C34($_bo_FieldUnique))
						If ($_bo_FieldIndexed)
							
							
							APPEND TO ARRAY:C911(TBL_al_indexFieldNumbers; $_l_FieldIndex)
						End if 
					Else 
						
					End if 
				End if 
			End for 
			
			For ($_l_FieldIndex; 1; Size of array:C274(TBL_al_indexFieldNumbers))
				$_ptr_FieldPointer:=Field:C253($_l_TableNumber; TBL_al_indexFieldNumbers{$_l_FieldIndex})
				SET INDEX:C344($_ptr_FieldPointer->; False:C215)
				//DELETE INDEX($_ptr_FieldPointer->;*)
			End for 
			
		Else 
			For ($_l_FieldIndex; 1; Size of array:C274(TBL_al_indexFieldNumbers))
				$_ptr_Table:=Table:C252($_l_TableNumber)
				$_t_TableName:=Table name:C256($_ptr_Table)
				$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
				$_ptr_FieldPointer:=Field:C253($_l_TableNumber; TBL_al_indexFieldNumbers{$_l_FieldIndex})
				ARRAY POINTER:C280($_aptr_FieldsArray; 1)
				$_aptr_FieldsArray{1}:=Field:C253($_l_TableNumber; TBL_al_indexFieldNumbers{$_l_FieldIndex})
				$_t_IndexName:=$_t_TableName+Field name:C257($_ptr_FieldPointer)+"indx"
				$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
				CREATE INDEX:C966($_ptr_Table->; $_aptr_FieldsArray; Default index type:K58:2; $_t_IndexName)
			End for 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("TBL_EditIndexes"; $_t_oldMethodName)