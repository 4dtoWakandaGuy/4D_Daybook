//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetLine
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_SelectedRow; $2)
	C_POINTER:C301($_Ptr_ListBoxArea; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetLine")
// LB_SetLine
//` replacement for AL_SetLine
// 06/07/06 pb
// selects ONE row in the listbox area

// parameters: $1 = poinmter to the area
// $2 = the line to select (integer)

// example: LB_SetLine (->EW_lb_DataExports;$_l_Number)

$_Ptr_ListBoxArea:=$1
$_l_SelectedRow:=$2
For ($_l_Index; 1; Size of array:C274($_Ptr_ListBoxArea->))
	If ($_l_Index=$_l_SelectedRow)
		$_Ptr_ListBoxArea->{$_l_Index}:=True:C214
	Else 
		$_Ptr_ListBoxArea->{$_l_Index}:=False:C215
	End if 
End for 
ERR_MethodTrackerReturn("LB_SetLine"; $_t_oldMethodName)