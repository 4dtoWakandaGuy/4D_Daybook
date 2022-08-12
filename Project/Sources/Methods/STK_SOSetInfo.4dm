//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SOSetInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:04`Method: STK_SOSetInfo
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

$_t_oldMethodName:=ERR_MethodTracker("STK_SOSetInfo")
ERR_MethodTrackerReturn("STK_SOSetInfo"; $_t_oldMethodName)