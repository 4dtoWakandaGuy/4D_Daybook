If (False:C215)
	//object Name: [USER]CCM_Activity.aPSPTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 14:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_PSPs;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CCM_t_PSPName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Activity.aPSPTab"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (CCM_at_PSPs{CCM_at_PSPs}="Authorize net")
				CCM_t_PSPName:="Authorize net"
				CCM_DisplayActivityAN("Authorize.net")  //the parameter is just to prevent invalid calls
			: (CCM_at_PSPs{CCM_at_PSPs}="Transax")
				CCM_t_PSPName:="Transax"
				CCM_DisplayActivityTransax("Transax")
			: (CCM_at_PSPs{CCM_at_PSPs}="Paypal")
				CCM_t_PSPName:="Paypal"
				CCM_DisplayActivityPP("Paypal")
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Activity.aPSPTab"; $_t_oldMethodName)
