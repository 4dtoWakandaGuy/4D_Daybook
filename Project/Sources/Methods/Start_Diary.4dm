//%attributes = {}
If (False:C215)
	//Project Method Name:      Start_Diary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2011 11:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_WorkflowProcess)
	C_TEXT:C284($_t_FormUsage; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_Diary")



If (Count parameters:C259>=1)
	
	DelayTicks(4*60)
	
	$_t_FormUsage:=$1
	If ((($_t_FormUsage="1") | ($_t_FormUsage="2")) & ((DB_GetModuleSettingByNUM(2))>1))
		Case of 
			: (<>SD3_l_DiaryVersion=0)
				If ($_t_FormUsage="1")
					
					ZDiary_DiaryT1
				Else 
					
					ZDiary_DiaryT
				End if 
			Else 
				//new style diary
				//ZDiary_Mod
				
		End case 
	Else 
		$_l_WorkflowProcess:=New process:C317("Diary_Workflow_Manager"; 128000; "Task Manager Process")
		
	End if 
End if 
ERR_MethodTrackerReturn("Start_Diary"; $_t_oldMethodName)
