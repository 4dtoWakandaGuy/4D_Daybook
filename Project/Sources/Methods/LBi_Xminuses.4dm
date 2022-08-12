//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_Xminuses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 14:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Lines; 0)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_Index; $_l_Last; $_l_LastColumn; $_l_LastRowNumber; $_l_Row; $_l_SizeofArray; $_l_SIzeofArray2)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_LastArrayColumn; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_Xminuses")

//NG 18/7/2006 This method replacces ALxMinuses and can be used in circumstances where the AL area has been replaced with a listbox area

//ALxMinuses - ie multiple lines
$_Ptr_ListBox:=$1->{1}
$_ptr_ArrayofArrayPointers:=$1->{3}
$_ptr_ArrayReferences:=$1->{9}
If (Size of array:C274($1->)>=19)
	$_ptr_areaTypeVariable:=$1->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
	$_l_AreaType:=$_ptr_areaTypeVariable->
Else 
	$_l_AreaType:=1
End if 
//$line:=AL_GetLine ($_Ptr_ListBox»)
If ($_l_AreaType<3)
	ARRAY LONGINT:C221($_al_Lines; 0)
	LB_GetSelect($_Ptr_ListBox; ->$_al_Lines)
	LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
	
	$_l_SizeofArray:=Size of array:C274($_al_Lines)
	
	If ($_l_SizeofArray=0)
		//NG-Here we need to know the reference of the  row IF the area is in editable mode
		//TODO:AL_GetPrevCell ($_Ptr_ListBox->;bd36;bd37)
		If ($_l_Row>0)
			ARRAY LONGINT:C221($_al_Lines; 1)
			$_al_Lines{1}:=$_l_Row
			$_l_SizeofArray:=1
		End if 
	End if 
	If ($_l_SizeofArray>0)
		
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
		$_l_Last:=$_al_Lines{1}
		
		If ($_ptr_ArrayReferences->{8}#"")  //if a subfile
			$_l_LastColumn:=Size of array:C274($_ptr_ArrayofArrayPointers->)
			$_Ptr_LastArrayColumn:=$_ptr_ArrayofArrayPointers->{$_l_LastColumn}
			$_l_LastRowNumber:=$_Ptr_LastArrayColumn->{$_l_Last}
		End if 
		
		For ($_l_Index; $_l_SizeofArray; 1; -1)
			LBi_DeleteElem($1; $_al_Lines{$_l_Index})
		End for 
		If ($_ptr_ArrayReferences->{8}#"")  //if a subfile
			LBi_SubKeyUp($1; $_l_LastRowNumber)
		End if 
		
		$_l_SIzeofArray2:=Size of array:C274($_Ptr_ThisColumnArray->)
		
		
		If ($_l_Last>$_l_SIzeofArray2)
			$_l_Last:=$_l_SIzeofArray2
		End if 
		
		LBi_LoadFtrs($1)
		LBi_SetSelect1($_Ptr_ListBox; $_l_Last)
	End if 
	
	If (False:C215)
		//******** added 26/03/07 -kmw (as per similar change Nigel made to LBi_xPlus - programmatically ensure that list box has no lines selected) **********
		For ($_l_Index; 1; Size of array:C274($_Ptr_ListBox->))
			$_Ptr_ListBox->{$_l_Index}:=False:C215
		End for 
		//********************************************************************************************************
	End if 
Else 
	LBi_LoadFtrs($1)
End if 
ERR_MethodTrackerReturn("LBi_Xminuses"; $_t_oldMethodName)