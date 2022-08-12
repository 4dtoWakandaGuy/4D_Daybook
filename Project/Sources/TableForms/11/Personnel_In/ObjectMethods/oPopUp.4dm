If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_PricingOptions;0)
	//ARRAY TEXT(STK_at_PricingOptions;0)
	C_LONGINT:C283($_l_event; STK_l_PricingOption)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oPopUp"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		STK_l_PricingOption:=STK_al_PricingOptions{STK_at_PricingOptions}
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oPopUp"; $_t_oldMethodName)
