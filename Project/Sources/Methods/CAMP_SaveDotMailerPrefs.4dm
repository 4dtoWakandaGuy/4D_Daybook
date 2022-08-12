//%attributes = {}

If (False:C215)
	//Project Method Name:      CAMP_SaveDotMailerPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_DataFieldLabels; $_ptr_DataFieldValues; $1; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CAMP_SaveDotMailerPrefs")

$_ptr_DataFieldLabels:=$1
$_ptr_DataFieldValues:=$2
ERR_MethodTrackerReturn("CAMP_SaveDotMailerPrefs"; $_t_oldMethodName)