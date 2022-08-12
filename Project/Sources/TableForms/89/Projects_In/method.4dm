If (False:C215)
	//Table Form Method Name: [PROJECTS]Projects_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/03/2011 19:39
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

$_t_oldMethodName:=ERR_MethodTracker("FM [PROJECTS].Projects_In"; Form event code:C388)
$_l_event:=Form event code:C388

Projects_InLP($_l_event)
ERR_MethodTrackerReturn("FM:Projects_In"; $_t_oldMethodName)
