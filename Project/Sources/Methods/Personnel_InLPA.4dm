//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_InLPA
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
	C_BOOLEAN:C305(vMod2; vMod3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_InLPA")
If (Modified record:C314([TIME_BUDGETS:49]))
	DB_SaveRecord(->[TIME_BUDGETS:49])
	AA_CheckFileUnlocked(->[TIME_BUDGETS:49]X_ID:7)
End if 
If (vMod3)
	//TRACE
	Modules_ArrApp([PERSONNEL:11]Initials:1)
End if 
If (vMod2)
	FurthFldP_InLPA
End if 
ERR_MethodTrackerReturn("Personnel_InLPA"; $_t_oldMethodName)