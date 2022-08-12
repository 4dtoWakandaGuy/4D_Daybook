If (False:C215)
	//object Method Name: Object Name:      [USER].ACC_PeriodControl.Variable11
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
	C_DATE:C307(Acc_D_SelectedYearEndDate)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PeriodControl.Variable11"; Form event code:C388)


$_l_Process:=New process:C317("Year_Close2"; DB_ProcessMemoryinit(4); "Close Year"; Acc_D_SelectedYearEndDate)
ERR_MethodTrackerReturn("OBJ [USER].ACC_PeriodControl.Variable11"; $_t_oldMethodName)
