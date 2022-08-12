//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Option
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Option")

$0:=(Macintosh option down:C545) | (Windows Alt down:C563)
ERR_MethodTrackerReturn("Gen_Option"; $_t_oldMethodName)