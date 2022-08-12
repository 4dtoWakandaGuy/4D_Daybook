//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 23:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vJ; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers List")
//Job Personnel List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
JobPers_File
While (vJ=1)
	JobPers_Sel
	If (vJ=1)
		If (Records in selection:C76([JOB PERSONNEL:48])>0)
			CREATE SET:C116([JOB PERSONNEL:48]; "Master")
			vNo:=Records in selection:C76([JOB PERSONNEL:48])
			
			DB_t_CurrentFormUsage:="Print"
			Open_Pro_Window("Job Personnel List"; 0; 1; ->[JOB PERSONNEL:48]; WIN_t_CurrentOutputform)
			FS_SetFormSort(WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[JOB PERSONNEL:48]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([JOB PERSONNEL:48]; *)  //NG may 2004 added table
			If (OK=1)
				If (Not:C34(SR_ReportOK("JobPeList")))
					FORM SET OUTPUT:C54([JOB PERSONNEL:48]; "JobPers List")
					ORDER BY:C49([JOB PERSONNEL:48]Job_Code:1; >; [JOB PERSONNEL:48]Stage_Code:2; >; [JOB PERSONNEL:48]Person:3; >)
					BREAK LEVEL:C302(2)
					ACCUMULATE:C303([JOB PERSONNEL:48]JT_Actual_Units:5; [JOB PERSONNEL:48]JT_Act_Sales_Amount:6; [JOB PERSONNEL:48]JT_Budget_Units:4; [JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; [JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; [JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
					PRINT SELECTION:C60([JOB PERSONNEL:48])
				End if 
			End if 
			Close_ProWin
			vJ:=0
		Else 
			Gen_None("Job Personnel"; ->vJ)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("JobPers List"; $_t_oldMethodName)