If (False:C215)
	//Table Form Method Name: [LAYERS]Layer_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/03/2011 22:39
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

$_t_oldMethodName:=ERR_MethodTracker("FM [LAYERS].Layer_In"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 210570)
		
End case 
Layers_InLP
ERR_MethodTrackerReturn("FM:Layer_In"; $_t_oldMethodName)
