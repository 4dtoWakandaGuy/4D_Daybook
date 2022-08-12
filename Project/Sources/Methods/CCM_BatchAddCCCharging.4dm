//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_BatchAddCCCharging
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_BatchAddCCCharging")
//this very important method that my be required
// will adda line to a batch entry for the the amound
// chargin by the CC Companyt to process the charge
If (Count parameters:C259>=1)
End if 
ERR_MethodTrackerReturn("CCM_BatchAddCCCharging"; $_t_oldMethodName)