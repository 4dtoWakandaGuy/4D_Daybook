//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_WaitForBooleanVar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 12:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_BooleanValue; $_bo_CallbackVar; $_bo_Exit)
	C_LONGINT:C283($_l_MaxWaitTime; $_l_ProcessID; $_l_Retries; $1; $3)
	C_POINTER:C301($_Ptr_BooleanVar)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $2; $4)
	C_TIME:C306($_ti_CurrentTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_WaitForBooleanVar")

$_l_Retries:=$_l_Retries+1
If ($_l_ProcessID>0)
	If (Count parameters:C259>=4)
		$_l_ProcessID:=$1
		$_t_ProcessName:=$2
		$_l_MaxWaitTime:=$3
		If ($_l_MaxWaitTime=0)
			$_l_MaxWaitTime:=60  //seconds
		End if 
		
		$_Ptr_BooleanVar:=Get pointer:C304($4)
		
		$_ti_CurrentTime:=Current time:C178
		$_bo_Exit:=False:C215
		While (Not:C34(<>SYS_bo_QuitCalled)) & (Process_Name($_l_ProcessID)=$2) & (Process state:C330($_l_ProcessID)>=0) & (Current time:C178#($_l_MaxWaitTime+$_ti_CurrentTime)) & (Not:C34($_bo_Exit))
			
			
			If ($_l_Retries>60)
				$_l_Retries:=1
			End if 
			
			$_bo_BooleanValue:=$_Ptr_BooleanVar->
			
			If (Not:C34($_bo_BooleanValue))
				DelayTicks(1*($_l_Retries+3))
			Else 
				$_bo_Exit:=True:C214
			End if 
			
			$_l_Retries:=$_l_Retries+1
		End while 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_WaitForBooleanVar"; $_t_oldMethodName)