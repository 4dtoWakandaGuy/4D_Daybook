//%attributes = {}
If (False:C215)
	//Project Method Name:      TICK_IMPORT_SUPPLIERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/08/2009 10:02
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

$_t_oldMethodName:=ERR_MethodTracker("TICK_IMPORT_SUPPLIERS")
ERR_MethodTrackerReturn("TICK_IMPORT_SUPPLIERS"; $_t_oldMethodName)