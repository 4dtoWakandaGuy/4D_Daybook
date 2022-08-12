//%attributes = {}
If (False:C215)
	//Project Method Name:      Start_Semaphore
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/01/2011 19:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_Semaphore")
If ($1#"")
	While (Semaphore:C143($1))
		If (Not:C34(Is compiled mode:C492)) & (Current user:C182="Designer")
			//MESSAGE("Semaphore: "+$1+" in process number"+String(Current process))
		End if 
		DelayTicks(30)
	End while 
End if 
MESSAGES OFF:C175
ERR_MethodTrackerReturn("Start_Semaphore"; $_t_oldMethodName)