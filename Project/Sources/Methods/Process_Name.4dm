//%attributes = {}

If (False:C215)
	//Project Method Name:      Process_Name
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
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_Name")

//$_t_oldMethodName:=ERR_MethodTracker ("Process_Name")
//Returns a Process_Name from its No
If (Count parameters:C259>=1)
	PROCESS PROPERTIES:C336($1; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
Else   //NG modification made January 2008
	$_l_Process:=Current process:C322
	PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
End if 
$0:=$_t_ProcessName
//ERR_MethodTrackerReturn ("Process_Name";$_t_oldMethodName)