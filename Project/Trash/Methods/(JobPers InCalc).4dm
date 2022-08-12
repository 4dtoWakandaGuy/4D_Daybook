//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers InCalc
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
	C_REAL:C285(vTot2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers InCalc")
[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Units:4*[JOB PERSONNEL:48]JT_Sales_Rate:7); 2; 2)
[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Units:4*[JOB PERSONNEL:48]JT_Cost_Rate:9); 2; 2)
[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=Gen_Round(([JOB PERSONNEL:48]JT_Actual_Units:5*[JOB PERSONNEL:48]JT_Sales_Rate:7); 2; 2)
[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=Gen_Round(([JOB PERSONNEL:48]JT_Actual_Units:5*[JOB PERSONNEL:48]JT_Cost_Rate:9); 2; 2)
vTot2:=1
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("JobPers InCalc"; $_t_oldMethodName)