If (False:C215)
	//Database Method Name:      On Server Shutdown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2012 10:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Exit; <>SYS_bo_DataChangeLog; <>SYS_bo_QuitCalled; $_bo_Exit)
	C_LONGINT:C283($_l_Retries; $_l_Index; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("onServerShutdown")


<>SYS_bo_QuitCalled:=True:C214
<>SYS_bo_QuitCalled:=True:C214
$_l_Retries:=0
Repeat 
	
	If (<>SYS_bo_DataChangeLog)
		$_bo_Exit:=True:C214
		For ($_l_Index; 1; Size of array:C274(<>SYS_al_ModifiedTable))
			If (<>SYS_al_ModifiedTable{$_l_Index}>0)
				$_bo_Exit:=False:C215
				IDLE:C311
			End if 
		End for 
		If ($_bo_Exit=False:C215)
			CONFIRM:C162("Shut Down is delayed whilst data-logs are written"; "Wait"; "Exit now")
			If (OK=0)
				$_bo_Exit:=True:C214
			Else 
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*$_l_Retries)
				
				
			End if 
		End if 
	Else 
		$_bo_Exit:=True:C214
	End if 
	If ($_bo_Exit=False:C215)
		
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End if 
Until ($_bo_Exit=True:C214)


PW_CHECKUSERS

ERR_MethodTracker("Clean Exit - On Server Shutdown")


ERR_MethodTrackerReturn("onServerShutdown"; $_t_oldMethodName)
