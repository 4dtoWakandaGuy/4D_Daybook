//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddJSAsResultOfJSP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSAsResultOfJSP")

//added 28/02/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSAsResultOfJSP")


CREATE RECORD:C68([JOB_STAGES:47])

[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)

[JOB_STAGES:47]Job_Code:1:=[JOB PERSONNEL:48]Job_Code:1
[JOB_STAGES:47]Stage_Code:2:=[JOB PERSONNEL:48]Stage_Code:2
[JOB_STAGES:47]Job_Stage_code:52:=[JOB PERSONNEL:48]Job_stage_Code:17

QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOB PERSONNEL:48]Stage_Code:2)  //added 30/10/07 -kmw
[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2  //added 30/10/07 -kmw

DB_SaveRecord(->[JOB_STAGES:47])  //added 05/03/07 kmw
ERR_MethodTrackerReturn("JC_AddJSAsResultOfJSP"; $_t_oldMethodName)