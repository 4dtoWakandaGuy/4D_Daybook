//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetActionName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2011 08:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $0; $1; SD_t_ActionNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetActionName")
SD_t_ActionNAME:=""
If (Count parameters:C259=0)
	$_l_Process:=New process:C317("SD_GetActionname"; 256000; "GET ACTION"; [DIARY:12]Action_Code:9; Current process:C322)
	While (Process state:C330($_l_Process)>0) & (SD_t_ActionNAME="") & ($_l_Process>0)
		$_t_ProcessName:=Process_Name($_l_Process)
		
		If ($_t_ProcessName="GET ACTION")
			DelayTicks(2)
			//MESSAGE("Updating Service calls states")
		Else 
			$_l_Process:=0
		End if 
	End while 
	$0:=SD_t_ActionNAME
Else 
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$1)
	SET PROCESS VARIABLE:C370($2; SD_t_ActionNAME; [ACTIONS:13]Action_Name:2)
	
End if 
ERR_MethodTrackerReturn("SD_GetActionName"; $_t_oldMethodName)
