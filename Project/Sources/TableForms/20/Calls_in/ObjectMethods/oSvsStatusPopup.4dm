If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oSvsStatusPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_StateCodes;0)
	//ARRAY TEXT(SVS_at_StatesNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oSvsStatusPopup"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		[SERVICE_CALLS:20]Table_State:29:=SVS_at_StateCodes{SVS_at_StatesNames}
		[SERVICE_CALLS:20]Resolved:9:=SVS_SetResolved([SERVICE_CALLS:20]Table_State:29)
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oSvsStatusPopup"; $_t_oldMethodName)
