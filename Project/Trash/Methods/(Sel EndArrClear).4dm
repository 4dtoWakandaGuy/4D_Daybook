//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel EndArrClear
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
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel EndArrClear")
ARRAY TEXT:C222(SYS_at_RecordStateNames; 0)
ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; 0)
ERR_MethodTrackerReturn("Sel EndArrClear"; $_t_oldMethodName)