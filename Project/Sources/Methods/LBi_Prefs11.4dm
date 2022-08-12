//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_Prefs11
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
	C_POINTER:C301($_ptr_ArrayReferences; $1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_Prefs11")

//NG 19/7/06 this method is a direct replacement for ALpRefs11

$_t_oldMethodName:=ERR_MethodTracker("LBi_Prefs11")
//ALpRefs11 `called from ß procedures to reset all Refs arrays' elem 11
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	If (Size of array:C274($1->)>0)
		$_ptr_ArrayReferences:=$1->{9}
		$_ptr_ArrayReferences->{11}:=""
	End if 
End if 
If ($_l_CountParameters>1)
	If (Size of array:C274($2->)>0)
		$_ptr_ArrayReferences:=$2->{9}
		$_ptr_ArrayReferences->{11}:=""
	End if 
End if 
If ($_l_CountParameters>2)
	If (Size of array:C274($3->)>0)
		$_ptr_ArrayReferences:=$3->{9}
		$_ptr_ArrayReferences->{11}:=""
	End if 
End if 
If ($_l_CountParameters>3)
	If (Size of array:C274($4->)>0)
		$_ptr_ArrayReferences:=$4->{9}
		$_ptr_ArrayReferences->{11}:=""
	End if 
End if 
If ($_l_CountParameters>4)
	If (Size of array:C274($5->)>0)
		$_ptr_ArrayReferences:=$5->{9}
		$_ptr_ArrayReferences->{11}:=""
	End if 
End if 
If ($_l_CountParameters>5)
	Gen_Alert("Please add another parameter to ALpRefs11")
End if 
ERR_MethodTrackerReturn("LBi_Prefs11"; $_t_oldMethodName)