//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddJSPAsResultOfTimeDiary
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

$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSPAsResultOfTimeDiary")

//added 23/02/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSPAsResultOfTimeDiary")


CREATE RECORD:C68([JOB PERSONNEL:48])

[JOB PERSONNEL:48]X_ID:14:=AA_GetNextID(->[JOB PERSONNEL:48]X_ID:14)  //added 27/02/07 -kmw (should do this in trigger anyway but just in case...)

[JOB PERSONNEL:48]Person:3:=[DIARY:12]Person:8
[JOB PERSONNEL:48]Job_Code:1:=[DIARY:12]Job_Code:19
[JOB PERSONNEL:48]Stage_Code:2:=[DIARY:12]Stage_Code:21

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)  //added 30/10/07 -kmw
[JOB PERSONNEL:48]X_Job_Person_Name:12:=[PERSONNEL:11]Name:2  //added 30/10/07 -kmw

[JOB PERSONNEL:48]Job_Personnel_Code:18:=String:C10(Gen_Code(Table:C252(->[JOB PERSONNEL:48])+255; ->[JOB PERSONNEL:48]Job_Personnel_Code:18))  //added 02/04/07 -kmw

[JOB PERSONNEL:48]JT_Sales_Rate:7:=[DIARY:12]Charge_Rate:22  //added 02/04/07 -kmw
[JOB PERSONNEL:48]JT_Cost_Rate:9:=[DIARY:12]Cost_Rate:74  //added 02/04/07 -kmw

//[JOB PERSONNEL]Job stage Code:=[DIARY]Job Code+"/"+[DIARY]Stage Code  `[DIARY]job Stage Code `(no [diary]job stage code as yet)
//******************above line altered to following block 02/04/07 -kmw (assign job stage value if job stage exists or geenrat ethe value if it does not yet ***************
JC_FindJSFromJSP  //even though this JSP didn't exist until a diary record referring to it forcedits creation there may be a Job Stage for the diary so check
If (Records in selection:C76([JOB_STAGES:47])>0)
	[JOB PERSONNEL:48]Job_stage_Code:17:=[JOB_STAGES:47]Job_Stage_code:52
Else 
	[JOB PERSONNEL:48]Job_stage_Code:17:=JC_GetNextUniqueJobStageCode  //no job stage yet exists for this JSP to fall under so generate the unqiue id now (we will of course need to assign it as key field value when we actually do create the Job Stage)
End if 
//************************************************************************************************************************
DB_SaveRecord(->[JOB PERSONNEL:48])  //added 05/03/07 kmw
If (False:C215)
	If ([JOBS:26]Actual_TR:29)
		[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=[DIARY:12]Value:16
		[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=([DIARY:12]Units:20*[JOB PERSONNEL:48]JT_Cost_Rate:9)
		[JOB PERSONNEL:48]JT_Actual_Units:5:=[DIARY:12]Units:20
	End if 
	If ([JOBS:26]Budget_TR:28)
		[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=([DIARY:12]Budget_Units:70*[DIARY:12]Charge_Rate:22)  //[DIARY]Value (there is currently no equiv budget field for actual value so just calc on the fly)
		[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=([DIARY:12]Budget_Units:70*[JOB PERSONNEL:48]JT_Cost_Rate:9)
		[JOB PERSONNEL:48]JT_Budget_Units:4:=[DIARY:12]Budget_Units:70
	End if 
	DB_SaveRecord(->[JOB PERSONNEL:48])  //the above update routines don't actually issue a save so do so now
End if 
ERR_MethodTrackerReturn("JC_AddJSPAsResultOfTimeDiary"; $_t_oldMethodName)