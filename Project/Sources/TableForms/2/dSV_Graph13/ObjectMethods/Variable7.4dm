If (False:C215)
	//object Name: [COMPANIES]dSV_Graph13.Variable7
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
	C_LONGINT:C283(ch2; ch3; ch4; vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dSV_Graph13.Variable7"; Form event code:C388)
If (ch3=1)
	If (vSNo=7)
		ch4:=0
	End if 
	ch2:=0
	StatsView_GrCal
Else 
	If (SV_at_FieldName4=1)
		ch2:=1
		ch4:=0
	Else 
		ch4:=1
		ch2:=0
	End if 
	StatsView_GrCal
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dSV_Graph13.Variable7"; $_t_oldMethodName)
