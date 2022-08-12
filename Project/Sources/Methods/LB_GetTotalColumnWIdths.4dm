//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_GetTotalColumnWIdths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_UseVarName)
	C_LONGINT:C283($_l_Index; $_l_TotalWidth; $0)
	C_POINTER:C301($_Ptr_Object; $2)
	C_TEXT:C284($_t_objectName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LB_GetTotalColumnWIdths")
$_t_objectName:=$1
If (Count parameters:C259>=2)
	$_Ptr_Object:=$2
	$_bo_UseVarName:=True:C214
End if 
ARRAY TEXT:C222($_at_ColumNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
If ($_bo_UseVarName)
	LISTBOX GET ARRAYS:C832($_Ptr_Object->; $_at_ColumNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
Else 
	LISTBOX GET ARRAYS:C832(*; $_t_objectName; $_at_ColumNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
End if 
$_l_TotalWidth:=0
For ($_l_Index; 1; Size of array:C274($_at_ColumNames))
	$_l_TotalWidth:=$_l_TotalWidth+LISTBOX Get column width:C834(*; $_at_ColumNames{$_l_Index})
End for 
$0:=$_l_TotalWidth
ERR_MethodTrackerReturn("LB_GetTotalColumnWIdths"; $_t_oldMethodName)