//%attributes = {"invisible":true}

If (False:C215)
	//Object Name:      DB_OutputForm.Button
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
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("___Orphan___7819")
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$_l_Process:=New process:C317("Trans Rec"; 12000; "Test Trans rec")
End case 
ERR_MethodTrackerReturn("___Orphan___7819"; $_t_oldMethodName)