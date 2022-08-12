If (False:C215)
	//object Name: [USER]DM_SOAPSetup.oDisableAll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_bo_DisableSoap)
	C_LONGINT:C283($_l_event; DM_l_DIsableSoap)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DM_SOAPSetup.oDisableAll"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		DM_bo_DisableSoap:=(DM_l_DIsableSoap=1)
End case 
ERR_MethodTrackerReturn("OBJ [USER].DM_SOAPSetup.oDisableAll"; $_t_oldMethodName)
