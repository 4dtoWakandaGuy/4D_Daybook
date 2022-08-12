//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_l_EditSubscriptionProduct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/04/2011 17:21 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_l_EditSubscriptionProduct")

//Open product in a new screen
ERR_MethodTrackerReturn("PRD_l_EditSubscriptionProduct"; $_t_oldMethodName)