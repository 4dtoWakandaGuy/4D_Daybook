//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_Close
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

$_t_oldMethodName:=ERR_MethodTracker("CW_Close")
//Project Method: CW_CloseCalWindow
//Cancels the open calendar window
//Created:  3/11/98 - Pelican Software Incorporated

CANCEL:C270
ERR_MethodTrackerReturn("CW_Close"; $_t_oldMethodName)