//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_InDel
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

$_t_oldMethodName:=ERR_MethodTracker("Personnel_InDel")
DB_SaveRecord(->[TIME_BUDGETS:49])
AA_CheckFileUnlocked(->[TIME_BUDGETS:49]X_ID:7)
DB_SaveRecord(->[MODULES:63])
Gen_Confirm("Are you sure?"; "No"; "Yes")
If (OK=0)
	DELETE SELECTION:C66([TIME_BUDGETS:49])
	DELETE SELECTION:C66([MODULES:63])
	DELETE RECORD:C58([PERSONNEL:11])
	CANCEL:C270
	ALL RECORDS:C47([PERSONNEL:11])
	Gen_InNoF(->[PERSONNEL:11])
End if 
ERR_MethodTrackerReturn("Personnel_InDel"; $_t_oldMethodName)