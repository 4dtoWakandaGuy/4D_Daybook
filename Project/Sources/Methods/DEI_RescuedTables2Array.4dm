//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_RescuedTables2Array
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
	ARRAY TEXT:C222($_at_Documents; 0)
	//ARRAY TEXT(DEI_at_TempAllTables;0)
	C_BOOLEAN:C305($_bo_DisplayRecordsinTable)
	C_LONGINT:C283($_l_DocTypePosition; $_l_DocumentIndex; $_l_FilesRow; $_l_NextElement; $_l_NoOfDOcs; $_l_RecordsinSelection; $_l_SortArray; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Array2populate; $_ptr_ArrayRecords2populate; $_ptr_Table; $1; $3)
	C_TEXT:C284($_t_DisplayTableData; $_t_oldMethodName; $_t_RescueFile; $_t_RescueFolder; $_t_StructureFolder; $_t_TableName; $_t_TableNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_RescuedTables2Array")

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
		
		$_t_StructureFolder:=DB_StructureFolder
		$_t_RescueFolder:=$_t_StructureFolder+"Rescue"
		
		If (Test path name:C476($_t_RescueFolder)=Is a folder:K24:2)
			
			ARRAY TEXT:C222($_ptr_Array2populate->; 0)
			
			$_bo_DisplayRecordsinTable:=(Not:C34(Is nil pointer:C315($_ptr_ArrayRecords2populate)))
			
			If ($_bo_DisplayRecordsinTable)
				//Folder separator:=DB_DirSymbol 
				ARRAY TEXT:C222($_ptr_ArrayRecords2populate->; 0)
			End if 
			
			DOCUMENT LIST:C474($_t_RescueFolder; $_at_Documents)
			
			$_l_NoOfDOcs:=Size of array:C274($_at_Documents)
			
			ARRAY TEXT:C222(DEI_at_TempAllTables; 0)
			DEI_Tables2Array(->DEI_at_TempAllTables)
			
			For ($_l_DocumentIndex; 1; $_l_NoOfDOcs)
				$_t_TableNumber:=$_at_Documents{$_l_DocumentIndex}
				$_l_DocTypePosition:=Position:C15(".txt"; $_t_TableName)
				If ($_l_DocTypePosition>0)
					$_t_TableNumber:=Substring:C12($_t_TableNumber; 1; $_l_DocTypePosition-1)
				End if 
				
				$_l_TableNumber:=Num:C11($_t_TableNumber)
				$_t_TableName:=Table name:C256($_l_TableNumber)
				
				$_l_TableNumber:=Find in array:C230(DEI_at_TempAllTables; $_t_TableName)
				
				If ($_l_TableNumber>0)
					$_l_NextElement:=Size of array:C274($_ptr_Array2populate->)+1
					INSERT IN ARRAY:C227($_ptr_Array2populate->; $_l_NextElement; 1)
					$_ptr_Array2populate->{$_l_NextElement}:=$_t_TableName
					
					If ($_bo_DisplayRecordsinTable)
						$_t_RescueFile:=$_t_RescueFolder+Folder separator:K24:12+$_at_Documents{$_l_DocumentIndex}
						If (Test path name:C476($_t_RescueFile)=Is a document:K24:1)
							$_l_NextElement:=Size of array:C274($_ptr_ArrayRecords2populate->)+1
							INSERT IN ARRAY:C227($_ptr_ArrayRecords2populate->; $_l_NextElement; 1)
							SET CHANNEL:C77(11)
							SET CHANNEL:C77(10; $_t_RescueFile)
							RECEIVE VARIABLE:C81($_l_RecordsinSelection)
							If (OK=1)
								$_ptr_ArrayRecords2populate->{$_l_NextElement}:=$_t_TableName+" ("+String:C10($_l_RecordsinSelection)+")"
							Else 
								$_ptr_ArrayRecords2populate->{$_l_NextElement}:=$_t_TableName+" ("+String:C10(Get document size:C479($_t_RescueFile))+" KB)"
							End if 
							SET CHANNEL:C77(11)
						End if 
					End if 
					
				End if 
				
			End for 
			
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
ERR_MethodTrackerReturn("DEI_RescuedTables2Array"; $_t_oldMethodName)