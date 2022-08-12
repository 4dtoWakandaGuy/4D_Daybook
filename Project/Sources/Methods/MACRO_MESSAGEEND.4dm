//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_MESSAGEEND
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
	C_LONGINT:C283(CURMACWINDOW)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_MESSAGEEND")
CURMACWINDOW:=0
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("MACRO_MESSAGEEND"; $_t_oldMethodName)