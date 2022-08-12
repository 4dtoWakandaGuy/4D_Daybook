//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ListtoLists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ListEntry; 0)
	ARRAY TEXT:C222($_at_ListName; 0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListtoLists")

LIST TO ARRAY:C288($1; $_at_ListEntry)
$_l_SizeofArray:=Size of array:C274($_at_ListEntry)
ARRAY TEXT:C222($_at_ListName; $_l_SizeofArray)
For ($_l_Index; 1; $_l_SizeofArray)
	$_at_ListName{$_l_Index}:=$2
End for 
ARRAY TO SELECTION:C261($_at_ListName; [LIST_ITEMS:95]List_Name:1; $_at_ListEntry; [LIST_ITEMS:95]List_Entry:2)
REDUCE SELECTION:C351([LIST_ITEMS:95]; 0)
ERR_MethodTrackerReturn("Gen_ListtoLists"; $_t_oldMethodName)