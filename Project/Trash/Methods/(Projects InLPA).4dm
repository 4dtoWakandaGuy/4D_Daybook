//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects_InLPA
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
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_InLPA")
If (Modified record:C314([JOBS:26]))
	DB_SaveRecord(->[JOBS:26])
	AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
End if 
<>CompCode:=[PROJECTS:89]Company_Code:3
<>ContCode:=[PROJECTS:89]Contact_Code:4
ERR_MethodTrackerReturn("Projects_InLPA"; $_t_oldMethodName)