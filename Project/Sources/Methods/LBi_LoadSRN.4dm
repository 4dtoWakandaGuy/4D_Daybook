//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_LoadSRN
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
	C_LONGINT:C283($_l_CountRecords; $_l_index)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadSRN")

//NG 19/7/06 this method is a direct replacemnt for ALLoadSRN
$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadSRN")
//ALLoadSRN    Loads dummy selected record numbers

$_l_CountRecords:=Records in selection:C76($2->)
$_l_index:=Size of array:C274($1->)
If ($_l_index<$_l_CountRecords)
	INSERT IN ARRAY:C227($1->; $_l_index; $_l_CountRecords-$_l_index)
End if 
For ($_l_index; 1; $_l_CountRecords)
	$1->{$_l_index}:=$_l_index
End for 
ERR_MethodTrackerReturn("LBi_LoadSRN"; $_t_oldMethodName)