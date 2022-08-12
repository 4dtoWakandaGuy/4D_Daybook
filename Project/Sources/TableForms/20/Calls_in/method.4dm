If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]Calls_in
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].Calls_in"; Form event code:C388)
$_l_event:=Form event code:C388
Calls_InLP($_l_event)
ERR_MethodTrackerReturn("FM [SERVICE_CALLS].Calls_in"; $_t_oldMethodName)