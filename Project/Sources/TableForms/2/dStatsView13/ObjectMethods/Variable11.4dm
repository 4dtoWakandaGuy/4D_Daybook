If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable11
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
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283(bd1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable11"; Form event code:C388)
//SV_at_FieldName1 Script
If (SV_at_FieldName1=0)
	If (bd1=0)
		SV_at_FieldName1:=1
	Else 
		SV_at_FieldName1:=bd1
	End if 
End if 
If (SV_at_FieldName1#bd1)
	StatsView_Cal1
	StatsView_Learn
End if 
bd1:=SV_at_FieldName1
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable11"; $_t_oldMethodName)