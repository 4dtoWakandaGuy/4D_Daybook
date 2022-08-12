//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_Tables2Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/09/2009 14:51:24If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_DisplayRecordsinTable)
	C_LONGINT:C283($_l_CurrentRow; $_l_FilesRow; $_l_NumberofTables; $_l_SortArray; $_l_TableIndex; $2)
	C_POINTER:C301($_ptr_Array2populate; $_ptr_ArrayRecords2populate; $_ptr_Table; $1; $3)
	C_TEXT:C284($_t_DisplayTableData; $_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_Tables2Array")

If (Count parameters:C259>0)
	$_ptr_Array2populate:=$1
	
	If (Count parameters:C259>1)
		$_l_SortArray:=$2
	Else 
		$_l_SortArray:=0
	End if 
	
	If (Count parameters:C259>2)
		$_ptr_ArrayRecords2populate:=$3
	End if 
	
	If (Not:C34(Is nil pointer:C315($_ptr_Array2populate)))
		$_l_NumberofTables:=Get last table number:C254
		
		ARRAY TEXT:C222($_ptr_Array2populate->; $_l_NumberofTables)
		
		$_bo_DisplayRecordsinTable:=(Not:C34(Is nil pointer:C315($_ptr_ArrayRecords2populate)))
		
		If ($_bo_DisplayRecordsinTable)
			ARRAY TEXT:C222($_ptr_ArrayRecords2populate->; $_l_NumberofTables)
		End if 
		$_l_CurrentRow:=0
		For ($_l_TableIndex; $_l_NumberofTables; 1; -1)
			If (Is table number valid:C999($_l_TableIndex))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_t_TableName:=Table name:C256(Table:C252($_l_TableIndex))
				$_ptr_Array2populate->{$_l_CurrentRow}:=$_t_TableName
				If ($_bo_DisplayRecordsinTable)
					$_ptr_Table:=Table:C252($_l_TableIndex)
					$_ptr_ArrayRecords2populate->{$_l_CurrentRow}:=$_t_TableName+" ("+String:C10(Records in table:C83($_ptr_Table->))+")"
				End if 
			Else 
				
			End if 
		End for 
		ARRAY TEXT:C222($_ptr_Array2populate->; $_l_CurrentRow)
		
		$_bo_DisplayRecordsinTable:=(Not:C34(Is nil pointer:C315($_ptr_ArrayRecords2populate)))
		
		If ($_bo_DisplayRecordsinTable)
			ARRAY TEXT:C222($_ptr_ArrayRecords2populate->; $_l_CurrentRow)
		End if 
		
		Case of 
			: ($_l_SortArray>0)
				SORT ARRAY:C229($_ptr_Array2populate->; >)
				If ($_bo_DisplayRecordsinTable)
					SORT ARRAY:C229($_ptr_ArrayRecords2populate->; >)
				End if 
			: ($_l_SortArray<0)
				SORT ARRAY:C229($_ptr_Array2populate->; <)
				If ($_bo_DisplayRecordsinTable)
					SORT ARRAY:C229($_ptr_ArrayRecords2populate->; <)
				End if 
		End case 
		
		If ($_bo_DisplayRecordsinTable)
			$_l_FilesRow:=Find in array:C230($_ptr_Array2populate->; "FILES")
			If ($_l_FilesRow>0)
				$_t_TableName:=$_ptr_Array2populate->{$_l_FilesRow}
				$_t_DisplayTableData:=$_ptr_ArrayRecords2populate->{$_l_FilesRow}
				DELETE FROM ARRAY:C228($_ptr_Array2populate->; $_l_FilesRow)
				DELETE FROM ARRAY:C228($_ptr_ArrayRecords2populate->; $_l_FilesRow)
				INSERT IN ARRAY:C227($_ptr_Array2populate->; 1; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayRecords2populate->; 1; 1)
				$_ptr_Array2populate->{1}:=$_t_TableName
				$_ptr_ArrayRecords2populate->{1}:=$_t_DisplayTableData
			End if 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("DEI_Tables2Array"; $_t_oldMethodName)