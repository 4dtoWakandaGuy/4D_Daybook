//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_P_Preferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($LWindowID)
	C_LONGINT:C283($LWindowID; $_l_ApplicationType; MIR_l_ProcessID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_P_Preferences")




// Declare local variables

If (Not:C34(Is compiled mode:C492))
	COMPILER_MIR
End if 

$_l_ApplicationType:=Application type:C494

If ($_l_ApplicationType=4D Remote mode:K5:5)
	MIR_l_ProcessID:=Process number:C372("MirroringProcess"; *)
	If (MIR_l_ProcessID=0)
		Gen_Alert("Mirroring Process_Not running on the Server.")
		MIR_l_ProcessID:=-1
	End if 
End if 

If (Not:C34(Is macOS:C1572))
	$LWindowID:=Open form window:C675([USER:15]; "MIR_Preferences"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
Else 
	$LWindowID:=Open form window:C675([USER:15]; "MIR_Preferences"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
End if 
DIALOG:C40([USER:15]; "MIR_Preferences")
CLOSE WINDOW:C154($LWindowID)

//End of method
ERR_MethodTrackerReturn("MIR_P_Preferences"; $_t_oldMethodName)
