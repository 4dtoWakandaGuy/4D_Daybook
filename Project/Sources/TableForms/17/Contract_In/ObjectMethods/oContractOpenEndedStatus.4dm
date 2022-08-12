If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oContractOpenEndedStatus
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
	C_LONGINT:C283($_l_event; CON_l_OpenEndedStatus)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oContractOpenEndedStatus"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CON_l_OpenEndedStatus=1)
			[CONTRACTS:17]End_Date:6:=!00-00-00!
			OBJECT SET VISIBLE:C603(*; "oEndDate@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oEndDate@"; True:C214)
		End if 
End case 
[CONTRACTS:17]xOpenEndedStatus:16:=CON_l_OpenEndedStatus
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oContractOpenEndedStatus"; $_t_oldMethodName)