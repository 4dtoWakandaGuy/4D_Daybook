//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FindLine
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
	ARRAY LONGINT:C221($_al_Lines; 0)
	C_BOOLEAN:C305($_bo_TableBased; $0)
	C_LONGINT:C283($_l_AreaType; $_l_AssociatedTableNum; $_l_Column; $_l_FirstLine; $_l_KeyPosition; $_l_Row; $_l_SizeofArray; bd37)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_HighlightSet; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_HighlightSetName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindLine")

//NG 20/07/06 This is a replacement method for ALfindLine
//ALFindLine

If (Size of array:C274($1->)>0)
	$0:=False:C215
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	If (Size of array:C274($1->)>=19)
		
		$_ptr_areaTypeVariable:=$1->{19}
		$_l_AreaType:=$_ptr_areaTypeVariable->
	Else 
		$_l_AreaType:=1
		If (Not:C34(Is nil pointer:C315($_Ptr_ListBox)))
			LISTBOX GET TABLE SOURCE:C1014($_Ptr_ListBox->; $_l_AssociatedTableNum)
		End if 
		$_bo_TableBased:=($_l_AssociatedTableNum>0)
		If ($_bo_TableBased)
			$_l_AreaType:=3
		End if 
	End if 
	If ($_l_AreaType>=3)
		//TRACE
		If (Size of array:C274($1->)>=20)
			$_ptr_HighlightSet:=$1->{20}
			$_t_HighlightSetName:=$_ptr_HighlightSet->
			If (Records in set:C195($_t_HighlightSetName)>0)
				USE SET:C118($_t_HighlightSetName)
				
			End if 
		End if 
	Else 
		DB_SaveRecord($_ptr_LBTable)
		//$_l_FirstLine:=AL_GetLine ($_Ptr_ListBox»)
		ARRAY LONGINT:C221($_al_Lines; 0)
		
		LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
		LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
		$_l_SizeofArray:=Size of array:C274($_al_Lines)
		If ($_l_SizeofArray=0)
			//NG TODO
			//AL_GetPrevCell ($_Ptr_ListBox->;bd36;bd37)
			If (bd37>0)
				ARRAY LONGINT:C221($_al_Lines; 1)
				$_al_Lines{1}:=$_l_Row
				$_l_SizeofArray:=1
			End if 
		End if 
		If ($_l_SizeofArray>0)
			If ($_l_SizeofArray>1)
				Gen_Alert("NB: Only the first highlighted line has been selected"; "OK")
			End if 
			$_l_FirstLine:=$_al_Lines{1}
			$_l_Row:=$_l_FirstLine
			$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			If ($_l_KeyPosition>0)
				$_ptr_ArrayofArrayPointers:=$1->{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_FirstLine})
				If (Records in selection:C76($_ptr_LBTable->)>0)
					$0:=True:C214
				Else 
					Gen_Alert("The record has been deleted by another Process or User"; "Cancel")
				End if 
			End if 
		End if 
	End if 
Else 
	Gen_Alert("This cannot be done"; "CANCEL")
End if 
ERR_MethodTrackerReturn("LBi_FindLine"; $_t_oldMethodName)