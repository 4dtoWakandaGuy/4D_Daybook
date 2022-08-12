//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPA
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
	C_LONGINT:C283(vAB; vJB)
	C_TEXT:C284(<>JobCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPA")
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
DB_SaveRecord(->[JOB_STAGES:47])
vJB:=0
<>JobCode:=[JOBS:26]Job_Code:1
vAB:=0
ERR_MethodTrackerReturn("Jobs_InLPA"; $_t_oldMethodName)