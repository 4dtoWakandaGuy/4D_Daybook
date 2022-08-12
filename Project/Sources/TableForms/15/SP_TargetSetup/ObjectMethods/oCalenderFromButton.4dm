If (False:C215)
	//object Name: [USER]SP_TargetSetup.Highlight Button1
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
	C_DATE:C307(SP_D_SDateFrom; SP_D_SDateTo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Highlight Button1"; Form event code:C388)
HIDE WINDOW:C436
GEN_CalInProcess(0; SP_D_SDateFrom; "SP_D_SDateFrom")
SHOW WINDOW:C435

If (SP_D_SDateTo=!00-00-00!)
	SP_D_SDateTo:=SP_D_SDateFrom
End if 
If (SP_D_SDateFrom>SP_D_SDateTo)
	SP_D_SDateTo:=SP_D_SDateFrom
	//  ALERT("Note: The to date has been changed")
	Gen_Alert("Note: The to date has been changed.")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Highlight Button1"; $_t_oldMethodName)
