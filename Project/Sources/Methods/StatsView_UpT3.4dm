//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_UpT3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(SV_at_CalcOption3;0)
	C_LONGINT:C283(vSVT2)
	C_REAL:C285(vSVT3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_UpT3")
If (SV_at_CalcOption3=2)
	If (vSVT2=0)
		vSVT3:=0
	Else 
		vSVT3:=Gen_Round((vSVT3/vSVT2); 2; 2)
	End if 
End if 
ERR_MethodTrackerReturn("StatsView_UpT3"; $_t_oldMethodName)