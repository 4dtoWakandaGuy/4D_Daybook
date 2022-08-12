//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       19/11/2010 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AreaType; $_l_Index; $_l_TableNumber)
	C_POINTER:C301($_Ptr_ListBox; $_ptr_Table; $1; $2)
	C_TEXT:C284($_t_NamedSelection; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GetSelect")
//LBi_GetSelect
// Replaces the ALP function AL_GetSelect
// 03/07/06 pb
//18/7/06 NG modified to use append to array and return 0 if no lines selected
//Parameters: $1 = Pointer to  the Listbox area
// $2 = pointer to an array tp return selected row nos. in (integer)
LISTBOX GET TABLE SOURCE:C1014($1->; $_l_TableNumber; $_t_NamedSelection)

If ($_l_TableNumber>0)
	$_l_AreaType:=3
	
Else 
	$_l_AreaType:=1
End if 
If ($_l_AreaType<3)
	
	$_Ptr_ListBox:=$1
	For ($_l_Index; 1; Size of array:C274($_Ptr_ListBox->))
		If ($_Ptr_ListBox->{$_l_Index}=True:C214)
			APPEND TO ARRAY:C911($2->; $_l_Index)
		End if 
	End for 
Else 
	If ($_t_NamedSelection#"")
		$_ptr_Table:=Table:C252($_l_TableNumber)->
		COPY NAMED SELECTION:C331(Table:C252($_l_TableNumber)->; "$tempSelection")
		If (Records in set:C195("ListboxSet0")>0)
			USE SET:C118("ListboxSet0")
		End if 
		SELECTION TO ARRAY:C260($_ptr_Table->; $2->)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("LB_GetSelect"; $_t_oldMethodName)