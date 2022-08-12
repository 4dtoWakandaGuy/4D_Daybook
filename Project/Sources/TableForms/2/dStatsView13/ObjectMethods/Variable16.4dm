If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(bd12)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable16"; Form event code:C388)
If (bd12=0)
	StatsView_Cal2
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable16"; $_t_oldMethodName)
