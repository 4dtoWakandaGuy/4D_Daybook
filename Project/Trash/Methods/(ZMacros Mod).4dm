//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZMacros_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 19:18
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

$_t_oldMethodName:=ERR_MethodTracker("ZMacros_Mod")
//ZProc ("Macros_Mod";◊K2;"View Macros")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SCRIPTS:80])))
ERR_MethodTrackerReturn("ZMacros_Mod"; $_t_oldMethodName)