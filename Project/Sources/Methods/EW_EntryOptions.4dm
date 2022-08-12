//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_EntryOptions
	//------------------ Method Notes ------------------
	// EW_entryOptions
	// Sets the display of the Details area
	// 26/09/02 pb
	// parameters: $1=the Arealist area
	//                     $2="select" or "modify"
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_l_Mode; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_EntryOptions")


If ($2="select")
	$_l_Mode:="s"
Else 
	$_l_Mode:="m"
End if 
ERR_MethodTrackerReturn("EW_EntryOptions"; $_t_oldMethodName)