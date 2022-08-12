If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oIncomingDelSelector
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
	//ARRAY LONGINT(SVS_al_InvDeliveryIDS;0)
	//ARRAY TEXT(SVS_at_IncDeliveryNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oIncomingDelSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		[SERVICE_CALLS:20]xIncomingDeliveryMethodName:35:=SVS_at_IncDeliveryNames{SVS_at_IncDeliveryNames}
		[SERVICE_CALLS:20]xIncomingDeliveryMethod:34:=SVS_al_InvDeliveryIDS{SVS_at_IncDeliveryNames}
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oIncomingDelSelector"; $_t_oldMethodName)
