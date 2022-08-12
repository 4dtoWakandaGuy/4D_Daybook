//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SCPT_ButtonDragger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SCPT_ButtonDragger")
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Drop:K2:12)
		
End case 
ERR_MethodTrackerReturn("SM_SCPT_ButtonDragger"; $_t_oldMethodName)