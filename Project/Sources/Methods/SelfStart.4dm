//%attributes = {}
If (False:C215)
	//Project Method Name:      SelfStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $0)
	C_LONGINT:C283($_l_ProcessID; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_l_NewProcessName; $_t_MethodName; $_t_oldMethodName; $_t_ProcessName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SelfStart")
// Project Method: SelfStart (method name; Process_Name)
// Used to cause the calling method to re-run in a new Process

If (Count parameters:C259>=2)
	$_t_MethodName:=$1
	$_l_NewProcessName:=$2
	
	PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	
	If ($_l_NewProcessName#$_t_ProcessName)  // This is not in its own process
		$_l_ProcessID:=New process:C317($_t_MethodName; 64*1024; $_l_NewProcessName)
		$_bo_Continue:=False:C215
	Else 
		$_bo_Continue:=True:C214
	End if 
End if 

$0:=$_bo_Continue
ERR_MethodTrackerReturn("SelfStart"; $_t_oldMethodName)
