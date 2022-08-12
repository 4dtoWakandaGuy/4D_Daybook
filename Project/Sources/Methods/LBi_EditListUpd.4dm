//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_EditListUpd
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
	C_POINTER:C301($_ptr_ArrayReferences; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_EditListUpd")

//NG 20/7/06 This method is a replacement for ALEditListUpd
$_t_oldMethodName:=ERR_MethodTracker("LBi_EditListUpd")
//ALEditListUpd - Update everything after editing the Definitions

If (Size of array:C274($1->)>=9)
	$_ptr_ArrayReferences:=$1->{9}
	
	
	LBi_RemoveAll($1)
	LBi_ArrDefClear($1)
	LBi_InclFields($1; False:C215)
	If ($_ptr_ArrayReferences->{8}="")
		LBi_LoadArrays($1->{2}; $1->{3}; True:C214; $1->{7})
		
		LBi_LoadFmul($1)
		LBi_InclSetupClHe($1)
		LBi_inclSetup($1)
		LBi_LoadFtrs($1)
	Else 
		//TRACE
		//this should not happen
		LBi_LoadArrSub($1)
		LBi_InclSetupClHe($1)
		LBi_inclSetup($1)
		LBi_LoadFtrs($1)
	End if 
Else 
	//TRACE
End if 
ERR_MethodTrackerReturn("LBi_EditListUpd"; $_t_oldMethodName)