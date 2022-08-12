//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPRel
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
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_oldMethodName; vAnalysisCodeDesc; vCurrencyName; vCurrentStageDesc; vLayerCodeDesc; vName; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPRel")
Jobs_CompRel
If ([JOBS:26]Person:19=<>PER_t_CurrentUserInitials)
	vName:=<>PER_t_CurrentUserName
Else 
	RELATE ONE:C42([JOBS:26]Person:19)
	vName:=[PERSONNEL:11]Name:2
End if 
If ([JOBS:26]Job_Type:21#"")
	RELATE ONE:C42([JOBS:26]Job_Type:21)
	vType:=[JOB_TYPES:65]Type_Name:2
Else 
	vType:=""
End if 
//********************** added 22/03/07 -kmw **********************
If ([JOBS:26]Stage_Code:18#"")
	QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOBS:26]Stage_Code:18)
	vCurrentStageDesc:=[STAGES:45]Stage_Name:2
Else 
	vCurrentStageDesc:=""
End if 
//***********************************************************
//********************** added 23/03/07 -kmw **********************
If ([JOBS:26]Analysis_Code:24#"")
	QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=[JOBS:26]Analysis_Code:24)
	vAnalysisCodeDesc:=[ANALYSES:36]Analysis_Name:2
Else 
	vAnalysisCodeDesc:=""
End if 
If ([JOBS:26]Currency_Code:25#"")
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[JOBS:26]Currency_Code:25)
	vCurrencyName:=[CURRENCIES:71]Currency_Name:2
Else 
	vCurrencyName:=""
End if 
If ([JOBS:26]Layer_Code:26#"")
	QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=[JOBS:26]Layer_Code:26)
	vLayerCodeDesc:=[LAYERS:76]Layer_Name:2
Else 
	vLayerCodeDesc:=""
End if 
//***********************************************************
ERR_MethodTrackerReturn("Jobs_InLPRel"; $_t_oldMethodName)