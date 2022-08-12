If (False:C215)
	//Project Form Method Name: Cal4D_Cal_CalenderwithMinis_d
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM Cal4D_Cal_CalenderwithMinis_d"; Form event code:C388)

Cal4D_FM_CalWithMinis(Form event code:C388; Self:C308)


//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("FM Cal4D_Cal_CalenderwithMinis_d"; $_t_oldMethodName)
