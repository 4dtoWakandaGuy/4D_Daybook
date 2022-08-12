//%attributes = {}

If (False:C215)
	//Project Method Name:      VER_4DServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_4DServer")

//$_t_oldMethodName:=ERR_MethodTracker ("VER_4DServer")

$0:=(Application type:C494=4D Server:K5:6)
//ERR_MethodTrackerReturn ("VER_4DServer";$_t_oldMethodName)