If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable12
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
	//ARRAY TEXT(SV_at_FieldName3;0)
	C_LONGINT:C283(bd3)
	C_TEXT:C284($_t_oldMethodName; $Ex; vSVField3Ex)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable12"; Form event code:C388)
If (SV_at_FieldName3=0)
	If (bd3=0)
		SV_at_FieldName3:=1
	Else 
		SV_at_FieldName3:=bd3
	End if 
End if 
If (SV_at_FieldName3{SV_at_FieldName3}="Formula")
	$Ex:=Gen_RequestText("Formula:"; vSVField3Ex)
	If (OK=1)
		vSVField3Ex:=$Ex
		StatsView_Cal3
	Else 
		SV_at_FieldName3:=1
		StatsView_Cal3
	End if 
Else 
	If (SV_at_FieldName3#bd3)
		StatsView_Cal3
	End if 
End if 
bd3:=SV_at_FieldName3
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable12"; $_t_oldMethodName)