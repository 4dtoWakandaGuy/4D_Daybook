//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_Scrollonresize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    16/11/2010 20:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_TableBased)
	C_LONGINT:C283($_l_AssociatedTableNumber; $_l_ColumnIndex; $_l_ColumnsCount; $_l_ColumnWidth; $_l_FieldNumber; $_l_HeightPerCell; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_ObjectWIdth; $_l_RecordsCount; $_l_TableNumber; $_l_TotalHeightNeeded; $_l_TotalWidth)
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_Scrollonresize")
//This method is called when a form is resized or the number of columns or rows is changed in a listbox. It will calculate whether to show the Scroll bars
If (Count parameters:C259>=1)
	
	$_Ptr_ListBox:=$1
	OBJECT GET COORDINATES:C663($_Ptr_ListBox->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectWIdth:=$_l_ObjectRight-$_l_ObjectLeft
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	$_l_AssociatedTableNumber:=-1
	If (Not:C34(Is nil pointer:C315($1)))
		LISTBOX GET TABLE SOURCE:C1014($1->; $_l_AssociatedTableNumber)
	End if 
	$_bo_TableBased:=($_l_AssociatedTableNumber>0)
	If (Not:C34($_bo_TableBased)) | (True:C214)
		LISTBOX GET ARRAYS:C832($_Ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		$_l_TotalWidth:=0
		$_l_ColumnWidth:=0
		For ($_l_ColumnIndex; 1; Size of array:C274($_aptr_ColumnVariables))
			If ($_abo_ColumnsVisible{$_l_ColumnIndex}=True:C214)
				LB_GetWidths($_Ptr_ListBox; $_l_ColumnIndex; ->$_l_ColumnWidth)
				$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWidth
			End if 
			
		End for 
		If (Size of array:C274($_aptr_ColumnVariables)>0)
			
			$_l_HeightPerCell:=LISTBOX Get rows height:C836($_Ptr_ListBox->)
			RESOLVE POINTER:C394($_aptr_ColumnVariables{1}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_TableNumber>0)
				
				$_l_RecordsCount:=Records in selection:C76(Table:C252($_l_TableNumber)->)
				$_l_TotalHeightNeeded:=(($_l_RecordsCount)*$_l_HeightPerCell)+$_l_HeightPerCell
			Else 
				$_l_TotalHeightNeeded:=((Size of array:C274($_aptr_ColumnVariables{1}->))*$_l_HeightPerCell)+$_l_HeightPerCell
			End if 
		Else 
			$_l_TotalHeightNeeded:=0
		End if 
		
		If ($_l_ObjectWIdth<($_l_TotalWidth+10))
			If ($_l_ObjectHeight<($_l_TotalHeightNeeded+10))
				LB_SetScroll($_Ptr_ListBox; -2; -2)
			Else 
				LB_SetScroll($_Ptr_ListBox; -2; -3)
			End if 
		Else 
			If ($_l_ObjectHeight<($_l_TotalHeightNeeded+10))
				LB_SetScroll($_Ptr_ListBox; -3; -2)
			Else 
				LB_SetScroll($_Ptr_ListBox; -3; -3)
			End if 
			
		End if 
	Else 
		$_l_ColumnsCount:=LISTBOX Get number of columns:C831($1->)
		$_l_TotalWidth:=0
		$_l_ColumnWidth:=0
		For ($_l_ColumnIndex; 1; $_l_ColumnsCount)
			$_t_ColumnName:="Column"+String:C10($_l_ColumnIndex)
			$_l_ColumnWidth:=LISTBOX Get column width:C834(*; $_t_ColumnName)
			$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWidth
		End for 
		If ($_l_ColumnsCount>0)
			$_l_HeightPerCell:=LISTBOX Get rows height:C836($_Ptr_ListBox->)
			$_l_RecordsCount:=Records in selection:C76(Table:C252($_l_AssociatedTableNumber)->)
			$_l_TotalHeightNeeded:=(($_l_RecordsCount)*$_l_HeightPerCell)+$_l_HeightPerCell
			
		Else 
			$_l_TotalHeightNeeded:=0
		End if 
		
		If ($_l_ObjectWIdth<($_l_TotalWidth+10))
			If ($_l_ObjectHeight<($_l_TotalHeightNeeded+10))
				LB_SetScroll($_Ptr_ListBox; -2; -2)
			Else 
				LB_SetScroll($_Ptr_ListBox; -2; -3)
			End if 
		Else 
			If ($_l_ObjectHeight<($_l_TotalHeightNeeded+10))
				LB_SetScroll($_Ptr_ListBox; -3; -2)
			Else 
				LB_SetScroll($_Ptr_ListBox; -3; -3)
			End if 
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("LBI_Scrollonresize"; $_t_oldMethodName)