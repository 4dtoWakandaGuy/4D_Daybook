If (False:C215)
	//object Name: [CONTRACT_TYPES]ContractType_In.oOpenEndedPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CONT_at_OpenEndedStatus;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CONT_t_OpenEndedStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACT_TYPES].ContractType_In.oOpenEndedPopUp"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		[CONTRACT_TYPES:19]xOpenEndedStatus:12:=CONT_at_OpenEndedStatus-1
		CONT_t_OpenEndedStatus:=CONT_at_OpenEndedStatus{[CONTRACT_TYPES:19]xOpenEndedStatus:12+1}
End case 
ERR_MethodTrackerReturn("OBJ [CONTRACT_TYPES].ContractType_In.oOpenEndedPopUp"; $_t_oldMethodName)
