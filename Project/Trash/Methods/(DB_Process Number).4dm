//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Process Number
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
	_O_C_INTEGER:C282($i)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Process Number")
$0:=-1
$_t_ProcessName:=""
$_l_ProcessState:=0
$_l_ProcessTime:=0
For ($i; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($i; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($1=$_t_ProcessName)
		If ($_l_ProcessState#-1)
			$0:=$i
			$i:=Count tasks:C335+1
		Else 
			$0:=-1
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("DB_Process Number"; $_t_oldMethodName)