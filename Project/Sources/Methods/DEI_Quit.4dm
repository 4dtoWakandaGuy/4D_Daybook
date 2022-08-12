//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_Quit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_Quit")
FLUSH CACHE:C297
CONFIRM:C162("Are you sure you want to quit Daybook tools?")
If (OK=1)
	QUIT 4D:C291
End if 
ERR_MethodTrackerReturn("DEI_Quit"; $_t_oldMethodName)