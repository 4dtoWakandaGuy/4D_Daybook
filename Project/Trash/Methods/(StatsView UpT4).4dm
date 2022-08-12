//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView UpT4
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
	//ARRAY TEXT(SV_at_CalcOption4;0)
	C_LONGINT:C283(vSVT2)
	C_REAL:C285(vSVT4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView UpT4")
If (SV_at_CalcOption4=2)
	If (vSVT2=0)
		vSVT4:=0
	Else 
		vSVT4:=Gen_Round((vSVT4/vSVT2); 2; 2)
	End if 
End if 
ERR_MethodTrackerReturn("StatsView UpT4"; $_t_oldMethodName)