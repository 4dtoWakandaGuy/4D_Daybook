//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_lockFile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CloseWindow; $_bo_HasFileID; $_bo_OpenWindow)
	C_LONGINT:C283($_l_Count; $_l_CurrentWIndowRef; $_l_TableNumber; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_InputParameter; $1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname; Sem_t_SemaphoreName; Sem_t_SemaphoreName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_lockFile")
DB_t_Methodname:=Current method name:C684
//DB_lockFile
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		$_ptr_InputParameter:=$1
		If (Is a variable:C294($_ptr_InputParameter))
			
			$_bo_HasFileID:=AA_CheckFileID($_ptr_InputParameter->)
			$_l_TableNumber:=$_ptr_InputParameter->
		Else 
			$_bo_HasFileID:=AA_CheckFileID(Table:C252($_ptr_InputParameter))
			$_l_TableNumber:=Table:C252($_ptr_InputParameter)
		End if 
	End if 
Else 
	$_bo_HasFileID:=AA_CheckFileID
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		$_l_TableNumber:=Table:C252(Current default table:C363)
	Else 
		$_l_TableNumber:=0
	End if 
	
End if 
If ($_bo_HasFileID)
	While (Semaphore:C143("Locked"+String:C10($_l_TableNumber)))
		DelayTicks(2)
	End while 
	Sem_t_SemaphoreName:="Save_"+String:C10($_l_TableNumber)
	If (Not:C34(In transaction:C397))
		Sem_t_SemaphoreName2:="Busy_"+String:C10($_l_TableNumber)
	Else 
		Sem_t_SemaphoreName2:=""
	End if 
	
	$_bo_OpenWindow:=True:C214
	$_bo_CloseWindow:=False:C215
	$_l_Count:=0
	While (Semaphore:C143(Sem_t_SemaphoreName)) & (Not:C34(<>SYS_bo_QuitCalled))
		$_l_Count:=$_l_Count+1
		DelayTicks(2)
		$_bo_CloseWindow:=False:C215
		If (Application type:C494#4D Server:K5:6) & ($_l_Count>50)
			If ($_bo_OpenWindow)
				//TRACE
				//$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				$_l_CurrentWIndowRef:=Open window:C153(30; 100; 950; 120; -1984)
				$_bo_OpenWindow:=False:C215
				$_bo_CloseWindow:=True:C214
			End if 
			ERASE WINDOW:C160
			MESSAGE:C88("Waiting for record unlocked Flag "+Sem_t_SemaphoreName)
		End if 
	End while 
	If ($_bo_CloseWindow)
		CLOSE WINDOW:C154
	End if 
	If (Sem_t_SemaphoreName2#"")
		$_bo_CloseWindow:=False:C215
		$_bo_OpenWindow:=True:C214
		While (Semaphore:C143(Sem_t_SemaphoreName2)) & (Not:C34(<>SYS_bo_QuitCalled))
			$_l_Count:=$_l_Count+1
			DelayTicks(2)
			If (Application type:C494#4D Server:K5:6) & ($_l_Count>50)
				If ($_bo_OpenWindow)
					//TRACE
					//$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					$_l_CurrentWIndowRef:=Open window:C153(30; 100; 950; 120; -1984)
					$_bo_OpenWindow:=False:C215
					$_bo_CloseWindow:=True:C214
				End if 
				ERASE WINDOW:C160
				MESSAGE:C88("Waiting for record unlocked Flag"+Sem_t_SemaphoreName2)
			End if 
		End while 
		If ($_bo_CloseWindow)
			CLOSE WINDOW:C154
		End if 
	End if 
	CLEAR SEMAPHORE:C144("Locked"+String:C10($_l_TableNumber))
	
	If ($_bo_CloseWindow)
		//CLOSE WINDOW
		//WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
End if 
ERR_MethodTrackerReturn("DB_lockFile"; $_t_oldMethodName)