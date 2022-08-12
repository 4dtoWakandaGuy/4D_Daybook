//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_Main
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2011 15:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_LicenceProcess; $1; LR_l_CalledFromProcess; LR_l_MainWinRef)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_Main")

If (Count parameters:C259=0)
	HIDE PROCESS:C324(Current process:C322)
	$_l_LicenceProcess:=New process:C317("LR_Main"; 256000; "LR_Main"; Current process:C322)  //re-call itself in new process (presumably it has currently been called directly from a menu and so is currently running in the user runtime process)
	While (Process state:C330($_l_LicenceProcess)>=0) & ($_l_LicenceProcess=0)
		
		
		$_t_ProcessName:=Process_Name($_l_LicenceProcess)
		If ($_t_ProcessName="LR_Main")
			
			DelayTicks(2)
		Else 
			$_l_LicenceProcess:=0
		End if 
	End while 
Else 
	LR_l_CalledFromProcess:=$1
	//
	//
	//
	
	LR_l_MainWinRef:=Open form window:C675([USER:15]; "LR_Setup"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	//
	
	//
	DIALOG:C40([USER:15]; "LR_Setup")
	SHOW PROCESS:C325(LR_l_CalledFromProcess)
End if 
ERR_MethodTrackerReturn("LR_Main"; $_t_oldMethodName)
