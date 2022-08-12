
If (False:C215)
	//Object Name:      DB_OutputForm.oLBReconcileMessage
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oLBReconcileMessage"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$_l_Process:=New process:C317("Trans_Rec"; 12000; "SHowOldScreen")
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_OutputForm/oLBReconcileMessage"; $_t_oldMethodName)
