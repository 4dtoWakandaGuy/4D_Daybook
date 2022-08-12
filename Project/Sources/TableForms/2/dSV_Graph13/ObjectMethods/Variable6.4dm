If (False:C215)
	//object Name: [COMPANIES]dSV_Graph13.Variable6
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
	C_LONGINT:C283(ch2; ch3; ch4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dSV_Graph13.Variable6"; Form event code:C388)
If (ch2=1)
	ch3:=0
	ch4:=0
	StatsView_GrCal
Else 
	If (SV_at_FieldName3=1)
		ch2:=1
	Else 
		ch3:=1
		ch4:=0
		StatsView_GrCal
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dSV_Graph13.Variable6"; $_t_oldMethodName)
