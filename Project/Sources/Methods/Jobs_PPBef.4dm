//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPBef
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPBef")
DB_SaveRecord(->[JOBS:26])
AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
DB_SaveRecord(->[JOB_STAGES:47])
ERR_MethodTrackerReturn("Jobs_PPBef"; $_t_oldMethodName)