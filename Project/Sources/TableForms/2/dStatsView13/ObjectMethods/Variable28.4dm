If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable28
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable28"; Form event code:C388)
StatsView_View
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable28"; $_t_oldMethodName)
