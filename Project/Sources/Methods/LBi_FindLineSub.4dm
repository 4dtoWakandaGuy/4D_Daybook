//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FindLineSub
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_KeyPosition; $_l_Result; $_l_Row; $_l_SizeofArray)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_ListBox; $_Ptr_SubTable; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindLineSub")

//NG 20/06/2006 This method is a replacement for ALfindLineSub
//ALFindLineSub - a single Subfile line only

If (Size of array:C274($1->)>0)
	$0:=False:C215
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_Ptr_SubTable:=$1->{8}
	ARRAY LONGINT:C221($_al_Lines; 0)
	LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
	
	//$_l_Result:=AL_GetSelect ($_Ptr_ListBox->;$_al_Lines)
	LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
	If (Size of array:C274($_al_Lines)>=1)
		$_l_SizeofArray:=Size of array:C274($_al_Lines)
		If ($_l_SizeofArray=0)
			//AL_ExitCell ($_Ptr_ListBox->)
			//AL_GetPrevCell ($_Ptr_ListBox->;bd36;bd37)
			// Is set when you click on an item in the list box area
			If ($_l_Row>0)
				ARRAY LONGINT:C221($_al_Lines; 1)
				$_al_Lines{1}:=$_l_Row
				$_l_SizeofArray:=1
			Else 
				
			End if 
		End if 
		If ($_l_SizeofArray>0)
			$_l_KeyPosition:=Size of array:C274($_ptr_ArrayFieldPointers->)
			If ($_l_KeyPosition>0)
				$_ptr_ArrayofArrayPointers:=$1->{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				$_l_Index:=1
				_O_ALL SUBRECORDS:C109($_Ptr_SubTable->)
				While (($0=False:C215) & (Not:C34(_O_End subselection:C37($_Ptr_SubTable->))))
					//IDLE  ` 03/04/03 pb
					If (Size of array:C274($_al_Lines)>=1)
						If (Size of array:C274($_Ptr_ThisColumnArray->)>=$_al_Lines{1})
							If ($_l_Index=$_Ptr_ThisColumnArray->{$_al_Lines{1}})
								$0:=True:C214
							Else 
								$_l_Index:=$_l_Index+1
								_O_NEXT SUBRECORD:C62($_Ptr_SubTable->)
							End if 
						Else 
							$0:=True:C214
						End if 
					Else 
						$0:=True:C214
					End if 
				End while 
			End if 
		End if 
	Else 
		If ($_l_Result=0)
			//Gen_Alert ("There is insufficient memory to complete that operation";"Cancel")
			Gen_Alert("There was no line selected"; "CANCEL")
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_FindLineSub"; $_t_oldMethodName)