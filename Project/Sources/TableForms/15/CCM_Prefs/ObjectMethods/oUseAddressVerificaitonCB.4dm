If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable31
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CCM_bo_useAVS)
	C_LONGINT:C283($_l_event; CCM_l_useAVS)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable31"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		CCM_bo_useAVS:=(CCM_l_useAVS=1)
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Variable31"; $_t_oldMethodName)
