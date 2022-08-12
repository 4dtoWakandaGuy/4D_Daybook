//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_FileI
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_FileI")
//NG April 2004 removed reference to ◊screen
//NG APRIL 2004 also removed silver references
//If (DB_GetModuleSetting(1)=5)
//INPUT FORM([JOBS];"Jobs_In"+◊Screen+"S")
//Else
FORM SET INPUT:C55([JOBS:26]; "Jobs_In13")
WIN_t_CurrentInputForm:="Jobs_In13"
//End if
ERR_MethodTrackerReturn("Jobs_FileI"; $_t_oldMethodName)