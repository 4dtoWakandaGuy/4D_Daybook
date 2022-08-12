//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_SetScroll0s
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
	C_LONGINT:C283($_l_CountParameters)
	C_POINTER:C301($_Ptr_ListBox; $1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SetScroll0s")

If (True:C214)
	//this method is a direct replacement for ALSetScroll0s
	$_t_oldMethodName:=ERR_MethodTracker("LBi_SetScroll0s")
	//ALSetScroll0 - set more than one scroll bars to 0;0 to avoid AL page-turning bug
	$_l_CountParameters:=Count parameters:C259
	If ($_l_CountParameters>0)
		If (Size of array:C274($1->)>0)
			$_Ptr_ListBox:=$1->{1}
			LB_SetScroll($_Ptr_ListBox; 0; 0)
		End if 
	End if 
	If ($_l_CountParameters>1)
		If (Size of array:C274($2->)>0)
			$_Ptr_ListBox:=$2->{1}
			LB_SetScroll($_Ptr_ListBox; 0; 0)
		End if 
	End if 
	If ($_l_CountParameters>2)
		If (Size of array:C274($3->)>0)
			$_Ptr_ListBox:=$3->{1}
			LB_SetScroll($_Ptr_ListBox; 0; 0)
		End if 
	End if 
	If ($_l_CountParameters>3)
		If (Size of array:C274($4->)>0)
			$_Ptr_ListBox:=$4->{1}
			LB_SetScroll($_Ptr_ListBox; 0; 0)
		End if 
	End if 
	If ($_l_CountParameters>4)
		If (Size of array:C274($5->)>0)
			$_Ptr_ListBox:=$5->{1}
			LB_SetScroll($_Ptr_ListBox; 0; 0)
		End if 
	End if 
	If ($_l_CountParameters>5)
		Gen_Alert("Please add another Level to ALSetScroll0s")
	End if 
	
End if 
ERR_MethodTrackerReturn("LBi_SetScroll0s"; $_t_oldMethodName)