//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Process No
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
	C_LONGINT:C283($_l_CountTasks; $_l_Number; $_l_ProcessIndex; $_l_ProcessState; $_l_ProcessTime; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_ProcessNameIN; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process No")
//Gets the Process No from its Name
$_l_CountTasks:=Count tasks:C335
$_l_ProcessIndex:=1
$0:=0
If (Count parameters:C259>=1)
	$_t_ProcessNameIN:=$1
	$_l_Number:=Process number:C372($_t_ProcessNameIN)
	If ($_l_Number>0)
		PROCESS PROPERTIES:C336($_l_Number; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		If (($_t_ProcessName=$_t_ProcessNameIN) & ($_l_ProcessState>-1))
			$0:=$_l_Number
			
		End if 
	Else 
		While ($_l_ProcessIndex<=$_l_CountTasks)
			IDLE:C311  // 7/04/03 pb
			PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If (($_t_ProcessName=$_t_ProcessNameIN) & ($_l_ProcessState>-1))
				$0:=$_l_ProcessIndex
				$_l_ProcessIndex:=$_l_CountTasks+1
			End if 
			$_l_ProcessIndex:=$_l_ProcessIndex+1
		End while 
	End if 
End if 
ERR_MethodTrackerReturn("Process No"; $_t_oldMethodName)
