//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Message
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Message")
If (Count parameters:C259>=1)
	If ([USER:15]Town:4#"*NEW")
		MESSAGE:C88($1)
	End if 
End if 
ERR_MethodTrackerReturn("User Message"; $_t_oldMethodName)