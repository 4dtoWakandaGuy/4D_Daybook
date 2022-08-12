//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclFind
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
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_KeyPosition; $_l_SelectedLine; LB_l_RowNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclFind")

//NG20/7/06 This method is a direct replacemnt for ALinclFind
//This method is not called

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclFind")
//ALInclFind - find the record but don't Edit - nearly same as ALInclEdit
If (Size of array:C274($1->)>0)
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	$_ptr_ArrayReferences:=$1->{9}
	If ($_ptr_ArrayReferences->{5}#"")
		If ($_ptr_ArrayReferences->{8}="")
			//=main file
			ARRAY LONGINT:C221($_al_SelectedLines; 0)
			LB_GetSelect($_Ptr_ListBox; ->$_al_SelectedLines)
			
			$_l_ArraySize:=Size of array:C274($_al_SelectedLines)
			If ($_l_ArraySize=0)
				//AL_GetPrevCell ($_Ptr_ListBox->;bd36;bd37)
				//NG todo need to know what the last element is
				
				If (LB_l_RowNumber>0)
					ARRAY LONGINT:C221($_al_SelectedLines; 1)
					$_al_SelectedLines{1}:=LB_l_RowNumber
					$_l_ArraySize:=1
				End if 
			End if 
			If ($_l_ArraySize>0)
				$_l_SelectedLine:=$_al_SelectedLines{1}
				
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				If ($_l_KeyPosition>0)
					$_ptr_ArrayofArrayPointers:=$1->{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
					
					If ($_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_SelectedLine})
						DB_SaveRecord($_ptr_LBTable)
						If (Read only state:C362($_ptr_LBTable->))
							READ WRITE:C146($_ptr_LBTable->)
						End if 
					Else 
						DB_SaveRecord($_ptr_LBTable)
						READ WRITE:C146($_ptr_LBTable->)
						QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_SelectedLine})
					End if 
					
				End if 
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_InclFind"; $_t_oldMethodName)