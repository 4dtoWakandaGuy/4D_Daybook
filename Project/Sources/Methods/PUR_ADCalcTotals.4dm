//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_ADCalcTotals
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_Companies;0)
	C_POINTER:C301($_ptr_Arrays)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_ADCalcTotals")

//$_ptr_Arrays:=DB_aptr_Companies
ERR_MethodTrackerReturn("PUR_ADCalcTotals"; $_t_oldMethodName)
