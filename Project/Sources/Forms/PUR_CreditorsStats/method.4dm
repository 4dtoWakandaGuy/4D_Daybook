If (False:C215)
	//Project Form Method Name: PUR_CreditorsStats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PUR_bo_CANCEL)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM PUR_CreditorsStats"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Outside Call:K2:11)
		If (PUR_bo_CANCEL)
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM PUR_CreditorsStats"; $_t_oldMethodName)
