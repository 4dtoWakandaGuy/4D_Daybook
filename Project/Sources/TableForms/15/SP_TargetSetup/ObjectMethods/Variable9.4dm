If (False:C215)
	//object Name: [USER]SP_TargetSetup.Variable9
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
	C_LONGINT:C283($_l_OK; SP_CB_SplitMonthly; SP_l_Continue; SP_l_STargetCount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Variable9"; Form event code:C388)
$_l_OK:=0
If (SP_D_SDateFrom#!00-00-00!) & (SP_D_SDateTo#!00-00-00!)
	If (SP_l_STargetCount>0) | (SP_CB_SplitMonthly>0)
		$_l_OK:=1
	Else 
		Gen_Alert("You must set a Number of targets")
	End if 
Else 
	Gen_Alert("You must set a from and to date")
End if 
If ($_l_OK>0)
	SP_l_Continue:=1
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Variable9"; $_t_oldMethodName)
