//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs SubLPB
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
	C_BOOLEAN:C305(<>PersAnOver)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs SubLPB")
//Jobs SubLPB
If ([JOBS:26]Project_Code:27="")
	Jobs_Code
	[JOBS:26]Project_Code:27:=[PROJECTS:89]Project_Code:1
	[JOBS:26]Company_Code:3:=[PROJECTS:89]Company_Code:3
	[JOBS:26]Contact_Code:4:=[PROJECTS:89]Contact_Code:4
	[JOBS:26]Job_Type:21:=[PROJECTS:89]Project_Type:7
	[JOBS:26]Person:19:=[PROJECTS:89]Person:8
	[JOBS:26]Start_Date:6:=[PROJECTS:89]Start_Date:5
	[JOBS:26]End_Date:7:=[PROJECTS:89]End_Date:6
	If (<>PersAnOver)
		[JOBS:26]Analysis_Code:24:=<>Per_t_CurrentDefaultAnalCode
	End if 
	If ([JOBS:26]Currency_Code:25="")
		[JOBS:26]Currency_Code:25:=<>SYS_t_BaseCurrency
	End if 
	Layer_Fill(->[JOBS:26]Layer_Code:26)
	DB_SaveRecord(->[JOBS:26])
	AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
End if 
ERR_MethodTrackerReturn("Jobs SubLPB"; $_t_oldMethodName)