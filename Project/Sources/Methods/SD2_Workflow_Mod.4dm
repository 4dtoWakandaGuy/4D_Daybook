//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_Workflow_Mod
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
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; SD2_bo_ShowSelection; SYS_bo_StatsView; VAutoFind)
	C_LONGINT:C283(<>SYS_l_WorkflowProcess; VD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1; SD2_T_SearchValue; SYS_t_AccessType; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_Workflow_Mod")

//The method will display the diary view-a searchable list of diary items, not workflow or schedule
$_t_oldMethodName:=ERR_MethodTracker("SD2_Workflow_Mod")
Start_Process
SYS_t_AccessType:=""  //temporary
VD:=1
<>DB_bo_AutoOut:=True:C214
VAutoFind:=True:C214  // to get the window to dsiplay an emptry selection
SYS_bo_StatsView:=False:C215

ARRAY POINTER:C280(SD2_aptr_ListControl; 0)
If (Count parameters:C259>=1)  // This would be more likely to be a call to show a type of work
	SD2_T_SearchValue:=$1
	SD2_bo_ShowSelection:=True:C214
Else 
	SD2_T_SearchValue:=""
End if 
SD2_t_CurrentUserID:=<>PER_t_CurrentUserInitials
WIN_t_CurrentInputForm:="SD2_Viewer"
//Gen_ModMidAL ("View Diary";"DMaster";->[DIARY];->vD;"Diary Items";"";->[DIARY];"SD2_Viewer")
Gen_ModMidAL("View Diary"; "DMaster"; ->[DIARY:12]; ->vD; "Worflow Manager"; ""; ->[USER:15]; "SD2_WorkflowViewer")
//Gen_Mod ("View Diary";"SD2_Diary_File";"DMaster";->[DIARY];->vD;"";"Diary Items")
//diary Unload
UNLOAD RECORD:C212([DIARY:12])
If (Current process:C322=<>SYS_l_WorkflowProcess)  //we are ending the proces for the current users workflow
	<>SYS_l_WorkflowProcess:=0
End if 
ERR_MethodTrackerReturn("SD2_Workflow_Mod"; $_t_oldMethodName)