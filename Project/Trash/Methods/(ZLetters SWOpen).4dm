//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZLetters_SWOpen
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZLetters_SWOpen")
ZProc("Letters_SWOpen"; DB_ProcessMemoryinit(3); "Open_Document")
ERR_MethodTrackerReturn("ZLetters_SWOpen"; $_t_oldMethodName)