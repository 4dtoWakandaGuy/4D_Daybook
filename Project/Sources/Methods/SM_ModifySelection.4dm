//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_ModifySelection
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
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $1; $2; SM_l_CallBack; SM_l_MonitorCall; SM_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; SM_t_loadedsetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_ModifySelection")
//To keep this simple!!!
//this will just tell the frontmost process to load the list
//otherwise we need to know what methods to launch everything with
//and that is gonna take a lot of work

If (SM_l_TableNumber#$1)
	//the frontmost process does
	//not have a matching table
	Gen_Alert("This List is not in the same table as the current selection")
Else 
	//Load the list
	REDUCE SELECTION:C351(Table:C252($1)->; 0)
	SM_t_loadedsetName:=SM_LoadSet($2; True:C214)
	//the list is now loaded-
	//we now pass it to the selection
	If (SM_t_loadedsetName#"")
		RESUME PROCESS:C320(SM_l_CallBack)
		
		BRING TO FRONT:C326(SM_l_CallBack)
		USE SET:C118(SM_t_loadedsetName)
		While (Semaphore:C143("$SetInuse"))
			DelayTicks(2)
		End while 
		CREATE SET:C116(Table:C252($1)->; "<>SaveSet"+String:C10($1))
		PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		CLEAR SEMAPHORE:C144("$SetInuse")
		
		If ($_l_ProcessState>=0)  // 29/05/02
			SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 7)
			If (Application type:C494#4D Server:K5:6)
				POST OUTSIDE CALL:C329(SM_l_CallBack)
			End if 
		End if 
		CLEAR SET:C117(SM_t_loadedsetName)
	End if 
End if 
ERR_MethodTrackerReturn("SM_ModifySelection"; $_t_oldMethodName)
