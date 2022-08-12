//%attributes = {}
If (False:C215)
	//Project Method Name:      Sequences_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/10/2009 13:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sequences_Mod")
READ ONLY:C145([ACTIONS:13])
READ ONLY:C145([RESULTS:14])
READ ONLY:C145([DOCUMENTS:7])
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([WORKFLOW_CONTROL:51]; "sequenceFound")
	QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$1)
	If (Records in selection:C76([WORKFLOW_CONTROL:51])>0)
		CREATE SET:C116([WORKFLOW_CONTROL:51]; "sequenceFound")
	End if 
	$_t_SetName:="sequenceFound"
End if 

Minor_Mod(->[WORKFLOW_CONTROL:51]; "Workflow_Control"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Sequences_Mod"; $_t_oldMethodName)
