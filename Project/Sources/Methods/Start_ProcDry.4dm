//%attributes = {}
If (False:C215)
	//Project Method Name:      Start_ProcDry
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
	C_LONGINT:C283(vCalActions)
	C_TEXT:C284($_t_oldMethodName; vCalPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_ProcDry")
vCalPeriod:=""
vCalActions:=0
ERR_MethodTrackerReturn("Start_ProcDry"; $_t_oldMethodName)