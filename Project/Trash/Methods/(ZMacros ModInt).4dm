//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZMacros_ModInt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2010 08:54
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

$_t_oldMethodName:=ERR_MethodTracker("ZMacros_ModInt")
ZProc("Macros_ModInt"; DB_ProcessMemoryinit(2); "Internet Macros")  //Rollo 3/9/2004
ERR_MethodTrackerReturn("ZMacros_ModInt"; $_t_oldMethodName)