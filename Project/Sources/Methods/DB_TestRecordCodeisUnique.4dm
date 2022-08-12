//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TestRecordCodeisUnique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/12/2010 18:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_RecordCount; $_l_TableNumber; $_l_Value; $1)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TestRecordCodeisUnique")

$_l_TableNumber:=$1
If ($_l_TableNumber>0) & ($_l_TableNumber#Table:C252(->[PREFERENCES:116]))
	
	
	$_l_FieldNumber:=AA_GetIDFieldNum($_l_TableNumber)
	If ($_l_FieldNumber>0)
		Repeat 
			SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordCount)
			$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
			$_ptr_Table:=Table:C252($_l_TableNumber)
			$_l_Value:=$_ptr_Field->
			QUERY:C277($_ptr_Table->; $_ptr_Field->=$_l_Value)
			SET QUERY DESTINATION:C396(Into current selection:K19:1)
			If ($_l_RecordCount=0)
				//TRACE
			End if 
			If (Record number:C243($_ptr_Table->)=-3)
				
				If ($_l_RecordCount>0)
					$_ptr_Field->:=0
					AA_SetIDbyTableNum($_l_TableNumber)
				End if 
			Else 
				If ($_l_RecordCount>1)
					$_ptr_Field->:=0
					AA_SetIDbyTableNum($_l_TableNumber)
				End if 
			End if 
		Until ($_l_RecordCount<=1)
		
	End if 
	If ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		$_l_FieldNumber:=Field:C253(->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
		If ($_l_FieldNumber>0)
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordCount)
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_ptr_Table:=Table:C252($_l_TableNumber)
				$_l_Value:=$_ptr_Field->
				QUERY:C277($_ptr_Table->; $_ptr_Field->=$_l_Value)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_RecordCount=0)
					//TRACE
				End if 
				If (Record number:C243($_ptr_Table->)=-3)
					
					If ($_l_RecordCount>0)
						$_ptr_Field->:=0
						$_ptr_Field->:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
						
					End if 
				Else 
					If ($_l_RecordCount>1)
						$_ptr_Field->:=0
						$_ptr_Field->:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
					End if 
				End if 
			Until ($_l_RecordCount<=1)
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_TestRecordCodeisUnique"; $_t_oldMethodName)