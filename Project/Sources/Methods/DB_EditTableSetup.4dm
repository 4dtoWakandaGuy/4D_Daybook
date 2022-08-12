//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_EditTableSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/09/2012 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; DB_l_DisplayTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_EditTableSetup")

//This will display the data editor!!
//The purpose of the data editor is to allow
// set user overrides for field names
//import data
// validate indexes
//This will display the current data in a raw format-all fields(x and invisbile removed?)
//it will use an array based listbox for this(dynamic format-not stored-worked out from data structure at time of display
//it will show by default 1000 records at a time but allow that to be changed.

DB_l_DisplayTable:=$1
DIALOG:C40("CONFIG_TABLE")
ERR_MethodTrackerReturn("DB_EditTableSetup"; $_t_oldMethodName)