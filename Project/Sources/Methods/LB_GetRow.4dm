//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetRow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2011 23:26
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
	C_LONGINT:C283($_l_AssociatedTableNumber; $_l_LineNumber; $0)
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GetRow")




$_Ptr_ListBox:=$1


//$columns:=Get number of listbox columns($_Ptr_ListBox->)
//$0:=Find in array($_Ptr_ListBox->;True)
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
If (Not:C34($_bo_TableBased))
	LISTBOX GET ARRAYS:C832($_Ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	If (Size of array:C274($_aptr_ColumnVariables)>0)
		$_l_LineNumber:=$_aptr_ColumnVariables{1}->
		$0:=$_l_LineNumber
	Else 
		$0:=0
	End if 
Else 
	$0:=Selected record number:C246(Table:C252($_l_AssociatedTableNumber)->)
End if 
ERR_MethodTrackerReturn("LB_GetRow"; $_t_oldMethodName)