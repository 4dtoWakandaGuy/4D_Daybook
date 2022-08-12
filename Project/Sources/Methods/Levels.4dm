//%attributes = {}
If (False:C215)
	//Project Method Name:      Levels
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
	C_LONGINT:C283(<>BAR)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Levels")
//Levels
Levels2
//Bring up first available Menu bar if none already loaded
If (<>Bar=0)
	
	Module_First(1)
End if 
//Copied to AAAA
ERR_MethodTrackerReturn("Levels"; $_t_oldMethodName)