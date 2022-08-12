//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Process_Started
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Process; $_l_ProcessMemory; $2)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_ProcessName; $1; $3; vDRR_ThisProcess)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Process_Started")
$0:=False:C215
$_t_MethodName:=$1
$_l_ProcessMemory:=$2
$_t_ProcessName:=$3
$_l_Process:=DB_Process_Number($_t_ProcessName)
Case of 
	: ($_l_Process=-1)
		$_l_Process:=New process:C317($_t_MethodName; $_l_ProcessMemory; $_t_ProcessName)
		
	: ($_l_Process#Current process:C322)
		
	: (vDRR_ThisProcess#$_t_MethodName)
		vDRR_ThisProcess:=$_t_MethodName
		$0:=True:C214
		
End case 
SHOW PROCESS:C325($_l_Process)
BRING TO FRONT:C326($_l_Process)
ERR_MethodTrackerReturn("DB_Process_Started"; $_t_oldMethodName)