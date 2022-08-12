//%attributes = {}

If (False:C215)
	//Database Method Name:      WF_LaunchWorkflowAction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordsinNewProcess)
	C_LONGINT:C283($_l_CallingProces; $_l_CurrentDisplayedForm; $_l_FromDIsplayedForm; S2)
	C_TEXT:C284($_t_CompanyCode; $_t_DiaryCode; $1; DB_t_CurrentContext; DB_t_DiaryCode)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("WF_LaunchWorkflowAction")
If (Count parameters:C259>=1)
	$_t_DiaryCode:=$1
	$_l_CallingProces:=S2
	QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
	$_t_CompanyCode:=[DIARY:12]Company_Code:1
	$_l_CurrentDisplayedForm:=Table:C252(->[COMPANIES:2])
	$_l_FromDIsplayedForm:=0
	DB_bo_RecordsinNewProcess:=True:C214
	DB_t_CurrentContext:="Workflow"
	DB_t_DiaryCode:=$_t_DiaryCode
	DB_OpenRecordFromSelection($_l_CurrentDisplayedForm; $_l_FromDIsplayedForm; $_t_CompanyCode)
End if 
ERR_MethodTrackerReturn("WF_LaunchWorkflowAction"; $_t_oldMethodName)