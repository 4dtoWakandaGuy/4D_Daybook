//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Export
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 22:05
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

$_t_oldMethodName:=ERR_MethodTracker("Gen Export")
//Gen Export
//NG June 2010-this is not called

SET CHANNEL:C77(12; "")
If (OK=1)
	FIRST RECORD:C50
	While (Not:C34(End selection:C36))
		SEND RECORD:C78
		NEXT RECORD:C51
	End while 
End if 
SET CHANNEL:C77(11)
ERR_MethodTrackerReturn("Gen Export"; $_t_oldMethodName)