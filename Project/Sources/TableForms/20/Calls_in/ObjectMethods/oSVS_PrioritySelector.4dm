If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oSVS_PrioritySelector
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
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SVS_t_CallPriority)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oSVS_PrioritySelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SVS_t_CallPriority:=SVS_at_priorityNames{SVS_at_priorityNames}
		[SERVICE_CALLS:20]Priority:10:=String:C10(SVS_al_PriorityNumbers{SVS_at_priorityNames})  //Yes its a number stored as a string
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oSVS_PrioritySelector"; $_t_oldMethodName)
