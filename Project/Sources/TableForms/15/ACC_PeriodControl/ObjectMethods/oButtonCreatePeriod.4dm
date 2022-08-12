If (False:C215)
	//object Name: [USER]ACC_PeriodControl.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.Variable7"; Form event code:C388)
$_l_Process:=New process:C317("ACC_PeriodMod"; 32000; "Create Period"; "-----------------"; Current process:C322; *)
BRING TO FRONT:C326($_l_Process)
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.Variable7"; $_t_oldMethodName)
