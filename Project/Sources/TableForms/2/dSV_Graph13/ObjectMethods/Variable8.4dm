If (False:C215)
	//object Name: [COMPANIES]dSV_Graph13.Variable8
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
	C_LONGINT:C283(ch2; ch3; ch4; vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dSV_Graph13.Variable8"; Form event code:C388)
If (ch4=1)
	If (vSNo=7)
		ch3:=0
	End if 
	ch2:=0
	StatsView_GrCal
Else 
	ch3:=1
	ch2:=0
	StatsView_GrCal
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dSV_Graph13.Variable8"; $_t_oldMethodName)
