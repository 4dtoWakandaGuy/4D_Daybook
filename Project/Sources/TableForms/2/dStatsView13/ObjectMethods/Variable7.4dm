If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable7
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
	//ARRAY TEXT(SV_at_CalcOption3;0)
	C_LONGINT:C283(bd5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable7"; Form event code:C388)
If (SV_at_CalcOption3=0)
	If (bd5=0)
		SV_at_CalcOption3:=1
	Else 
		SV_at_CalcOption3:=bd5
	End if 
End if 
If (SV_at_CalcOption3#bd5)
	StatsView_Cal3
End if 
bd5:=SV_at_CalcOption3
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable7"; $_t_oldMethodName)