//%attributes = {}
If (False:C215)
	//Project Method Name:      SET MENU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MenuIndex; $_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SET MENU")
$_l_Process:=Num:C11(Request:C163("PROCESS"; ""))

For ($_l_MenuIndex; 1; 103)
	SET MENU BAR:C67($_l_MenuIndex; $_l_Process)
	MESSAGE:C88("MENU"+String:C10($_l_MenuIndex))
	DelayTicks(60*5)
End for 
ERR_MethodTrackerReturn("SET MENU"; $_t_oldMethodName)
