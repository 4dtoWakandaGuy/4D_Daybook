//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FindLines
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
	ARRAY LONGINT:C221($_al_FIeldValues; 0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY TEXT:C222($_at_FIeldValues; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_KeyPosition; $_l_Row; $_l_SizeofArray)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindLines")

//NG 21/07/2006 THIS METHOD IS a replacement for ALFindlines
//NG 20/7/06 This method is now replaced with LBi_FindLines
//ALFindLines - ie multiple

If (Size of array:C274($1->)>0)
	$0:=False:C215
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	DB_SaveRecord($_ptr_LBTable)
	ARRAY LONGINT:C221($_al_Lines; 0)
	
	LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
	
	LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
	If (Size of array:C274($_al_Lines)>=1)
		$_l_SizeofArray:=Size of array:C274($_al_Lines)
		If ($_l_SizeofArray=0)
			//AL_GetCurrCell ($_Ptr_ListBox->;$bd36;$bd37)  `Column; Row
			
			//NG TODO-Get previous cell
			
			
			If ($_l_Row>0)
				ARRAY LONGINT:C221($_al_Lines; 1)
				$_al_Lines{1}:=$_l_Row
				$_l_SizeofArray:=1
			End if 
		End if 
		If ($_l_SizeofArray>0)
			$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			If ($_l_KeyPosition>0)
				$_ptr_ArrayofArrayPointers:=$1->{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				
				ARRAY TEXT:C222($_at_FIeldValues; 0)
				ARRAY LONGINT:C221($_al_FIeldValues; 0)
				For ($_l_Index; 1; Size of array:C274($_al_Lines))
					If (Type:C295($_Ptr_KeyField->)=Is longint:K8:6)
						APPEND TO ARRAY:C911($_al_FIeldValues; $_Ptr_ThisColumnArray->{$_al_Lines{$_l_Index}})
					Else 
						APPEND TO ARRAY:C911($_at_FIeldValues; $_Ptr_ThisColumnArray->{$_al_Lines{$_l_Index}})
					End if 
				End for 
				If (Type:C295($_Ptr_KeyField->)=Is longint:K8:6)
					QUERY WITH ARRAY:C644($_Ptr_KeyField->; $_al_FIeldValues)
				Else 
					QUERY WITH ARRAY:C644($_Ptr_KeyField->; $_at_FIeldValues)
				End if 
				If (Records in selection:C76($_ptr_LBTable->)>0)
					$0:=True:C214
				Else 
					Gen_Alert("The record has been deleted by another Process or User"; "Cancel")
				End if 
			Else 
				REDUCE SELECTION:C351($_ptr_LBTable->; 0)
			End if 
		Else 
			REDUCE SELECTION:C351($_ptr_LBTable->; 0)
		End if 
	Else 
		//Gen_Alert ("There is insufficient memory to complete that operation";"Cancel")
		REDUCE SELECTION:C351($_ptr_LBTable->; 0)
	End if 
End if 
ERR_MethodTrackerReturn("LBi_FindLines"; $_t_oldMethodName)