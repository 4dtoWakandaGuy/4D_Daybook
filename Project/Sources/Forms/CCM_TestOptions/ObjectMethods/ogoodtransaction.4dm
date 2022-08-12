If (False:C215)
	//object Method Name: Object Name:      CCM_TestOptions.ogoodtransaction
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
	//ARRAY TEXT(CCM_at_ResponseReasons;0)
	C_LONGINT:C283(CCM_l_Badtransactions; opt_CCM_l_Goodtransactions_1; opt_CCM_l_Goodtransactions_2; opt_CCM_l_Goodtransactions_3; opt_CCM_l_Goodtransactions_4; $_l_Event; CCM_l_Badtransactions; opt_CCM_l_Goodtransactions_1; opt_CCM_l_Goodtransactions_2; opt_CCM_l_Goodtransactions_3; opt_CCM_l_Goodtransactions_4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CCM_TestOptions.ogoodtransaction"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (CCM_l_Badtransactions=1)
			OBJECT SET VISIBLE:C603(CCM_at_ResponseReasons; False:C215)
			OBJECT SET ENABLED:C1123(opt_CCM_l_Goodtransactions_1; True:C214)
			OBJECT SET ENABLED:C1123(opt_CCM_l_Goodtransactions_2; True:C214)
			OBJECT SET ENABLED:C1123(opt_CCM_l_Goodtransactions_3; True:C214)
			OBJECT SET ENABLED:C1123(opt_CCM_l_Goodtransactions_4; True:C214)
			CCM_l_Badtransactions:=0
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ CCM_TestOptions.ogoodtransaction"; $_t_oldMethodName)
