//%attributes = {}

If (False:C215)
	//Project Method Name:      LB_SetSelect
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
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($_ptr_Lines; $_Ptr_ListBoxArea; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetSelect")

// LB-SetSelect
// replacement for AL_SetSelect
// 06/07/06 pb

// parameters: $1 = pointer to the LB area
//    $2 = pointer to array (integer) of line nos. to select

// example: LB_SetSelect (->MyListBox;->$arrint)

$_t_oldMethodName:=ERR_MethodTracker("LB_SetSelect")



$_Ptr_ListBoxArea:=$1
$_ptr_Lines:=$2

If (Type:C295($_Ptr_ListBoxArea->)=Boolean array:K8:21)
	For ($_l_Index; 1; Size of array:C274($_Ptr_ListBoxArea->))
		//If (Find in array($2->;$_l_Index)>0)
		If (Find in array:C230($_ptr_Lines->; $_l_Index)>0)  //changed to use named local 03/07/08 -kmw
			$_Ptr_ListBoxArea->{$_l_Index}:=True:C214
		Else 
			$_Ptr_ListBoxArea->{$_l_Index}:=False:C215
		End if 
	End for 
Else 
End if 
ERR_MethodTrackerReturn("LB_SetSelect"; $_t_oldMethodName)