//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetResultName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/07/2011 09:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $0; $1; SD_t_RESULTNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetResultName")
SD_t_RESULTNAME:=""

If (Count parameters:C259=0)
	$_l_Process:=New process:C317("SD_GetResultname"; 128000; "GET RESULT"; [DIARY:12]Result_Code:11; Current process:C322)
	While (Process state:C330($_l_Process)>0) & (SD_t_RESULTNAME="") & ($_l_Process>0)
		$_t_ProcessName:=Process_Name($_l_Process)
		If ($_t_ProcessName="GET RESULT")
			DelayTicks(2)
			//MESSAGE("Updating Service calls states")
		Else 
			$_l_Process:=0
		End if 
	End while 
	$0:=SD_t_RESULTNAME
Else 
	QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=$1)
	SET PROCESS VARIABLE:C370($2; SD_t_RESULTNAME; [RESULTS:14]Result_Name:2)
	
End if 
ERR_MethodTrackerReturn("SD_GetResultName"; $_t_oldMethodName)
