If (False:C215)
	//Table Form Method Name: [TYPES]types_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
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


$_t_oldMethodName:=ERR_MethodTracker("FM [TYPES].types_in"; Form event code:C388)
$_l_event:=Form event code:C388
Types_InLP($_l_event)
ERR_MethodTrackerReturn("FM [TYPES].types_in"; $_t_oldMethodName)