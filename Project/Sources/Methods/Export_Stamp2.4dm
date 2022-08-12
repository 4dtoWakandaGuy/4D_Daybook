//%attributes = {}
If (False:C215)
	//Project Method Name:      Export_Stamp2
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Export_Stamp2")
If ($1<":")
	$0:=Export_Stamp
	
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Export_Stamp2"; $_t_oldMethodName)