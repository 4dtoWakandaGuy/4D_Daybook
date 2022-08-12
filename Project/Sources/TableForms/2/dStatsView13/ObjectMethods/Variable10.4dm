If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable10
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
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283(bd11)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable10"; Form event code:C388)
If (DB_at_TableName>1)
	If (bd11=1)
		StatsView_Find
	End if 
	StatsView_Cal2
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable10"; $_t_oldMethodName)
