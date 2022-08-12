//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTime_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2010 08:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZTime_In")

DB_MenuNewRecord("DiaryTime")
//ZProc("Time_In"; DB_ProcessMemoryinit(2); "Enter Time")  //altered so that doesn't do check for WIP anymore, 12/03/07 -kmw
ERR_MethodTrackerReturn("ZTime_In"; $_t_oldMethodName)