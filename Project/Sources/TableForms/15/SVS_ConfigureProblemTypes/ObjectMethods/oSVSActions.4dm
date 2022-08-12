If (False:C215)
	//object Name: [USER]SVS_ConfigureProblemTypes.oSVSActions
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_ConfigureProblemTypes.oSVSActions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
	: ($_l_event=On Double Clicked:K2:5)
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_ConfigureProblemTypes.oSVSActions"; $_t_oldMethodName)
