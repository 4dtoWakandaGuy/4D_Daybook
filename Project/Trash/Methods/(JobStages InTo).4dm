//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages InTo
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_REAL:C285(vTot2; vTot3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages InTo")
If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	[JOB_STAGES:47]JT_Budget_Units:4:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Budget_Units:4)); 2; 2)
	[JOB_STAGES:47]AT_Actual_Units:5:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Actual_Units:5)); 2; 2)
	[JOB_STAGES:47]JT_Actual_Sales_Amount:6:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Act_Sales_Amount:6)); 2; 2)
	[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8)); 2; 2)
	[JOB_STAGES:47]JT_Actual_Cost_Amount:29:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10)); 2; 2)
	[JOB_STAGES:47]JT_Budget_Cost_Amount:30:=Gen_Round((Sum:C1([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)); 2; 2)
	JobStages_InT2
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)

vTot2:=0
vTot3:=1
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("JobStages InTo"; $_t_oldMethodName)