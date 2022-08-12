//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel ServerPres
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_NumberofTasks; $_l_ProcessIndex; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel ServerPres")
//ServerPresent - Tel ServerPres
//The server is there IF a process called VPU is running

$0:=False:C215
$_l_NumberofTasks:=Count tasks:C335
For ($_l_ProcessIndex; 1; $_l_NumberofTasks)
	PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_t_ProcessName="VPU")
		//This is the process
		$0:=True:C214
		$_l_ProcessIndex:=$_l_NumberofTasks+1
	End if 
End for 
ERR_MethodTrackerReturn("Tel ServerPres"; $_t_oldMethodName)