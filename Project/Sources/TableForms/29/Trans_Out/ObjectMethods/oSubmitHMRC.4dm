
If (False:C215)
	//Object Name:      [TRANSACTIONS].Trans_Out.oSubmitHMRC
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS]Trans_Out.oSubmitHMRC"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		Gen_Alert("This is a utility feature to create a submitable File for HMRC, this is an interim solution. From here no figures are Calculated so you can actually enter for any company.")
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS]Trans_Out.oSubmitHMRC"; $_t_oldMethodName)
