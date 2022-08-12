//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_Diary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 17:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>JobCode; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_Diary")
DB_SaveRecord(->[JOBS:26])
AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
<>AutoFind:=True:C214
<>DB_bo_AutoOut:=True:C214
<>AutoFile:="Jobs"
Gen_FindVars
<>JobCode:=[JOBS:26]Job_Code:1
<>CompCode:=[COMPANIES:2]Company_Code:1
<>ContCode:=[CONTACTS:1]Contact_Code:2
SD3_t_DiaryRelatedRecord:=[JOBS:26]Job_Code:1
SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
SD3_l_CallActionNum:=1
ZDiary_Mod
SD3_l_CallActionNum:=0
ERR_MethodTrackerReturn("Jobs_Diary"; $_t_oldMethodName)