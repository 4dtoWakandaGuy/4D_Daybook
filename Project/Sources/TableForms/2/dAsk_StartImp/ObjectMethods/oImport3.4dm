
If (False:C215)
	//Object Name:      [COMPANIES].dAsk_StartImp.oImport3
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/04/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]dAsk_StartImp.oImport3"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES]dAsk_StartImp.oImport3"; $_t_oldMethodName)
