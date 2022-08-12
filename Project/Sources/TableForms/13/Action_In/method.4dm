If (False:C215)
	//Table Form Method Name: Object Name:      [ACTIONS].Action_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 20:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ACTIONS].Action_In"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Actions_InLP($_l_FormEvent)
ERR_MethodTrackerReturn("FM [ACTIONS].Action_In"; $_t_oldMethodName)