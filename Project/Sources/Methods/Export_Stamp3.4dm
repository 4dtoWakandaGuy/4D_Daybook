//%attributes = {}
If (False:C215)
	//Project Method Name:      Export_Stamp3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Export_Stamp3")
If (Count parameters:C259>=1)
	
	If ($1<":")
		$0:=Export_Stamp+<>PER_t_CurrentUserInitials
	Else 
		$0:=$1
	End if 
End if 
ERR_MethodTrackerReturn("Export_Stamp3"; $_t_oldMethodName)