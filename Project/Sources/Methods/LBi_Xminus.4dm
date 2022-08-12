//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_Xminus
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
	C_BOOLEAN:C305($_bo_Get; $2)
	C_LONGINT:C283($_l_FirstLine; $_l_LastLine; $_l_LastRowNumber; $_l_SIzeofArray; $_l_SizeofArray2; LB_l_SelectedRow)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_LastArrayColumn; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_Xminus")

//NG 19/7/06 this method is a direct replacement for ALxMinus $_t_oldMethodName:=ERR_MethodTracker ("LBi_Xminus")
//ALxMinus
//TRACE
$_Ptr_ListBox:=$1->{1}
$_ptr_ArrayofArrayPointers:=$1->{3}
$_ptr_ArrayReferences:=$1->{9}
//$_l_FirstLine:=AL_GetLine ($_Ptr_ListBox»)

ARRAY LONGINT:C221($_al_Lines; 0)
If (Count parameters:C259<2)
	$_bo_Get:=True:C214
Else 
	$_bo_Get:=$2
End if 
If ($_bo_Get)
	LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
End if 
$_l_SIzeofArray:=Size of array:C274($_al_Lines)

If ($_l_SIzeofArray=0)
	
	//NG 19/7/2006 todo;; need to track the last selected field
	//AL_GetPrevCell ($_Ptr_ListBox->;bd36;bd37)
	If (LB_l_SelectedRow>0)
		ARRAY LONGINT:C221($_al_Lines; 1)
		$_al_Lines{1}:=LB_l_SelectedRow
		$_l_SIzeofArray:=1
	End if 
	
End if 
If (Size of array:C274($_al_Lines)>0)
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
	$_l_FirstLine:=$_al_Lines{1}
	$_l_LastLine:=$_al_Lines{1}
	
	If ($_ptr_ArrayReferences->{8}#"")  //if a subfile
		$_l_SizeofArray2:=Size of array:C274($_ptr_ArrayofArrayPointers->)
		$_Ptr_LastArrayColumn:=$_ptr_ArrayofArrayPointers->{$_l_SizeofArray2}
		$_l_LastRowNumber:=$_Ptr_LastArrayColumn->{$_l_LastLine}
	End if 
	
	$_l_SIzeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
	If ($_l_FirstLine>0) & ($_l_FirstLine<=$_l_SIzeofArray)
		LBi_DeleteElem($1; $_l_FirstLine; 1)
		
		If ($_ptr_ArrayReferences->{8}#"")  //if a subfile
			LBi_SubKeyUp($1; $_l_LastRowNumber)
		End if 
		
		$_l_SIzeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
		
		If ($_l_FirstLine>$_l_SIzeofArray)
			$_l_FirstLine:=$_l_SIzeofArray
		End if 
		// AL_SetLine ($_Ptr_ListBox»;$_l_FirstLine)
		LBi_LoadFtrs($1)
		LBI_Scrollonresize($_Ptr_ListBox)
		LBi_SetSelect1($_Ptr_ListBox; $_l_FirstLine)
	End if 
End if 
ERR_MethodTrackerReturn("LBi_Xminus"; $_t_oldMethodName)