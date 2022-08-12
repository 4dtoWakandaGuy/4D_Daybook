//%attributes = {}
If (False:C215)
	//Project Method Name:      Clear_Vs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCP; vCT; vDY; vIN; vJB; vOR; vPS; vPT; vSC)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Clear_Vs")
vCT:=0
vCP:=0
vOR:=0
vDY:=0
vPT:=0
vIN:=0
vPS:=0
vSC:=0
vJB:=0
ERR_MethodTrackerReturn("Clear_Vs"; $_t_oldMethodName)