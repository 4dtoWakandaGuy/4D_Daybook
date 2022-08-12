If (False:C215)
	//object Name: [COMPANIES]dStatsView13.Variable13
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
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(bd4)
	C_TEXT:C284($_t_oldMethodName; $Ex; vSVField4Ex)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.Variable13"; Form event code:C388)
If (SV_at_FieldName4=0)
	If (bd4=0)
		SV_at_FieldName4:=1
	Else 
		SV_at_FieldName4:=bd4
	End if 
End if 
If (SV_at_FieldName4{SV_at_FieldName4}="Formula")
	$Ex:=Gen_RequestText("Formula:"; vSVField4Ex)
	If (OK=1)
		vSVField4Ex:=$Ex
		StatsView_Cal4
	Else 
		SV_at_FieldName4:=1
		StatsView_Cal4
	End if 
Else 
	If (SV_at_FieldName4#bd4)
		StatsView_Cal4
	End if 
End if 
bd4:=SV_at_FieldName4
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.Variable13"; $_t_oldMethodName)