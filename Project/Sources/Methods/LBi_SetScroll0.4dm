//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_SetScroll0
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
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SetScroll0")

//NG 19/7/06 this method replaces ALSetScroll0
$_t_oldMethodName:=ERR_MethodTracker("LBi_SetScroll0")
//ALSetScroll0 - set the scroll bars to 0;0 to avoid AL page-turning bug
If (Size of array:C274($1->)>0)
	$_Ptr_ListBox:=$1->{1}
	LB_SetScroll($_Ptr_ListBox->; 0; 0)
End if 
ERR_MethodTrackerReturn("LBi_SetScroll0"; $_t_oldMethodName)