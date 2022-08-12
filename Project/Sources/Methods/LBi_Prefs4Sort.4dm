//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_Prefs4Sort
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
	C_LONGINT:C283($_l_Index; $_l_KeyPosition; $_l_NumberofColumns; $_l_SortFieldNumber; vALLevels)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_Ptr_CurrentSortField; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_AreaHandlingSettings; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_Prefs4Sort")

//NG 19/7/06 this method is a direct replacement for ALpRefs4sort
//ALpRefs4Sort - Update the changes made to Sort order / row dragging
//TRACE
If (vALLevels>0)
	If (Not:C34(Is nil pointer:C315($1)))
		
		If (Size of array:C274($1->)>0)
			$_ptr_ArrayReferences:=$1->{9}
			$_t_AreaHandlingSettings:=$_ptr_ArrayReferences->{4}
			
			If ($_t_AreaHandlingSettings[[7]]="2")  //if rows have been dragged or Sorted & Sort Order field needs updating
				$_l_SortFieldNumber:=Num:C11(Substring:C12($_ptr_ArrayReferences->{4}; 8; 2))
				If ($_l_SortFieldNumber>0)
					$_ptr_ArrayFieldPointers:=$1->{2}
					$_Ptr_ArrayofColumnFormulas:=$1->{6}
					$_ptr_LBTable:=$1->{7}
					$_Ptr_KeyField:=$1->{8}
					$_Ptr_CurrentSortField:=Field:C253(Table:C252($_ptr_LBTable); $_l_SortFieldNumber)
					$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
					If ($_l_KeyPosition>0)
						$_ptr_ArrayofArrayPointers:=$1->{3}
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
						$_l_NumberofColumns:=Size of array:C274($_Ptr_ThisColumnArray->)
						
						For ($_l_Index; 1; $_l_NumberofColumns)
							QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Index})
							$_Ptr_CurrentSortField->:=$_l_Index
							DB_SaveRecord($_ptr_LBTable)
						End for 
						
					End if 
				End if 
				$_ptr_ArrayReferences->{4}[[7]]:="1"
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_Prefs4Sort"; $_t_oldMethodName)