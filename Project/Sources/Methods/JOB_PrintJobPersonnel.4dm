//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_PrintJobPersonnel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   15/11/2010 14:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_PrintJobPersonnel")
CREATE SET:C116([JOB PERSONNEL:48]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([JOB PERSONNEL:48])>0)
	
	If (Not:C34(SR_ReportOK("JobPeList")))
		FORM SET OUTPUT:C54([JOB PERSONNEL:48]; "JobPers_List")
		ORDER BY:C49([JOB PERSONNEL:48]Job_Code:1; >; [JOB PERSONNEL:48]Stage_Code:2; >; [JOB PERSONNEL:48]Person:3; >)
		BREAK LEVEL:C302(2)
		ACCUMULATE:C303([JOB PERSONNEL:48]JT_Actual_Units:5; [JOB PERSONNEL:48]JT_Act_Sales_Amount:6; [JOB PERSONNEL:48]JT_Budget_Units:4; [JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; [JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; [JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
		PRINT SELECTION:C60([JOB PERSONNEL:48])
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("JOB_PrintJobPersonnel"; $_t_oldMethodName)