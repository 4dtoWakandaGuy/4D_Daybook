//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ShowCurrentState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    23/08/2011 16:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Stk_bo_Pause; <>Stk_bo_PauseWorking; <>Stk_bo_PauseWorkingClient; $_bo_Set)
	C_TEXT:C284($_t_ClientPauseMessage; $_t_oldMethodName; $_t_RecordsDone; $_t_ServerPauseMessage; SClientPause)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ShowCurrentState")
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
$_t_RecordsDone:=String:C10(Records in selection:C76([PRODUCTS:9]))
GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorking; $_bo_Set)
If ($_bo_Set)
	$_t_ServerPauseMessage:="Server is paused during working hours"
Else 
	$_t_ServerPauseMessage:="Server is not paused"
End if 
GET PROCESS VARIABLE:C371(-1; <>Stk_bo_Pause; $_bo_Set)
If ($_bo_Set)
	$_t_ServerPauseMessage:="All processing is Paused"
End if 
GET PROCESS VARIABLE:C371(-1; <>Stk_bo_PauseWorkingClient; $_bo_Set)
SClientPause:=""
If ($_bo_Set)
	If ($_t_ServerPauseMessage="All processing is Paused")
	Else 
		$_t_ClientPauseMessage:="Clients are paused during working hours"
	End if 
End if 
Gen_Alert("Records processed "+$_t_RecordsDone+Char:C90(13)+" Server Status "+$_t_ServerPauseMessage+Char:C90(13)+$_t_ClientPauseMessage)
ERR_MethodTrackerReturn("STK_ShowCurrentState"; $_t_oldMethodName)
