//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_Monitor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2010 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ProcessVisible; 0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	ARRAY LONGINT:C221($_al_OriginID; 0)
	ARRAY LONGINT:C221($_al_ProcessNum; 0)
	ARRAY LONGINT:C221($_al_ProcessState; 0)
	ARRAY LONGINT:C221($_al_ProcessTime; 0)
	ARRAY LONGINT:C221($_al_UniqueID; 0)
	ARRAY TEXT:C222($_at_ProcessName; 0)
	C_BOOLEAN:C305(<>_bo_HidePalletteBar; <>ProcInited; $_bo_ProcessVisible; Proc_bo_IgnoreCalledBy)
	C_LONGINT:C283(<>ButtProc; $_l_BarProcess; $_l_Index; $_l_ProcessID; $_l_ProcessIDPosition; $_l_ProcessOrigin; $_l_ProcessTime; $_l_ProcessUniqueiD; $_l_RelevantTasks; $_l_State; $_l_Tasks)
	C_LONGINT:C283($_l_WindowCount; $_t_ProcessState)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_Monitor")

ARRAY LONGINT:C221($_al_ProcessNum; 0)
ARRAY TEXT:C222($_at_ProcessName; 0)
ARRAY LONGINT:C221($_al_ProcessState; 0)
ARRAY LONGINT:C221($_al_ProcessTime; 0)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; 0)
ARRAY LONGINT:C221($_al_UniqueID; 0)
ARRAY LONGINT:C221($_al_OriginID; 0)

$_l_Tasks:=Count tasks:C335
ARRAY LONGINT:C221($_al_ProcessNum; $_l_Tasks)
ARRAY TEXT:C222($_at_ProcessName; $_l_Tasks)
ARRAY LONGINT:C221($_al_ProcessState; $_l_Tasks)
ARRAY LONGINT:C221($_al_ProcessTime; $_l_Tasks)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; $_l_Tasks)
ARRAY LONGINT:C221($_al_UniqueID; $_l_Tasks)
ARRAY LONGINT:C221($_al_OriginID; $_l_Tasks)
$_l_RelevantTasks:=0
$_t_ProcessName:=""
$_t_ProcessState:=0
$_l_ProcessTime:=0
$_bo_ProcessVisible:=False:C215
$_l_ProcessUniqueiD:=0
$_l_ProcessOrigin:=0
For ($_l_Index; 1; $_l_Tasks)
	PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessName; $_t_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_ProcessUniqueiD; $_l_ProcessOrigin)
	If ($_l_ProcessOrigin#Internal timer process:K36:29) & ($_l_ProcessOrigin#Client manager process:K36:31) & ($_l_ProcessOrigin#Server interface process:K36:20)
		$_l_RelevantTasks:=$_l_RelevantTasks+1
		//$_al_ProcessNum{$_l_RelevantTasks}:=
		$_at_ProcessName{$_l_RelevantTasks}:=$_t_ProcessName
		$_al_ProcessState{$_l_RelevantTasks}:=$_t_ProcessState
		$_al_ProcessTime{$_l_RelevantTasks}:=$_l_ProcessTime
		$_abo_ProcessVisible{$_l_RelevantTasks}:=$_bo_ProcessVisible
		$_al_UniqueID{$_l_RelevantTasks}:=$_l_ProcessUniqueiD
		$_al_OriginID{$_l_RelevantTasks}:=$_l_ProcessOrigin
		$_al_ProcessNum{$_l_RelevantTasks}:=$_l_Index
	End if 
	//PROCESS PROPERTIES($_l_Index;$_at_ProcessName{$_l_Index};$_al_ProcessState{$_l_Index};$_al_ProcessTime{$_l_Index};$_abo_ProcessVisible{$_l_Index};$_al_UniqueID{$_l_Index};$_al_OriginID{$_l_Index})
	
End for 
ARRAY LONGINT:C221($_al_ProcessNum; $_l_RelevantTasks)
ARRAY TEXT:C222($_at_ProcessName; $_l_RelevantTasks)
ARRAY LONGINT:C221($_al_ProcessState; $_l_RelevantTasks)
ARRAY LONGINT:C221($_al_ProcessTime; $_l_RelevantTasks)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; $_l_RelevantTasks)
ARRAY LONGINT:C221($_al_UniqueID; $_l_RelevantTasks)
ARRAY LONGINT:C221($_al_OriginID; $_l_RelevantTasks)

While (Semaphore:C143("$ProcArr"))
	DelayTicks(2)
End while 
PROC_SetProcess(0)

If (Size of array:C274(<>PRC_al_ProcessNum)>0)
	For ($_l_Index; Size of array:C274(<>PRC_al_ProcessNum); 1; -1)
		Proc_bo_IgnoreCalledBy:=True:C214
		PROC_SetProcess(<>PRC_al_ProcessNum{$_l_Index})
		Proc_bo_IgnoreCalledBy:=False:C215
	End for 
End if 
CLEAR SEMAPHORE:C144("$ProcArr")
$_l_WindowCount:=0
For ($_l_Index; 1; Size of array:C274($_al_ProcessNum))
	//here put ALL the other process into the array except locals
	//in the pop-up though only put processes that have a window reference
	
	If ($_at_ProcessName{$_l_Index}#"")
		If ($_at_ProcessName{$_l_Index}[[1]]#"$")
			Proc_bo_IgnoreCalledBy:=True:C214
			PROC_SetProcess($_al_ProcessNum{$_l_Index})
			$_l_ProcessIDPosition:=Find in array:C230(<>PRC_al_ProcessNum; $_al_ProcessNum{$_l_Index})
			If ($_l_ProcessIDPosition>0)
				If (<>PRC_al_WindowReference{$_l_ProcessIDPosition}#0)
					$_l_State:=Process state:C330(<>PRC_al_ProcessNum{$_l_ProcessIDPosition})
					If ($_l_State=Aborted:K13:1)
						<>PRC_al_WindowReference{$_l_ProcessIDPosition}:=0
						
					Else 
						
						$_l_WindowCount:=$_l_WindowCount+1
					End if 
				End if 
			End if 
			Proc_bo_IgnoreCalledBy:=False:C215
		End if 
	End if 
End for 

If ($_l_WindowCount>0)
	
	<>_bo_HidePalletteBar:=False:C215
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	If ($_l_BarProcess>0)
		HIDE PROCESS:C324($_l_BarProcess)
	End if 
	If (<>ButtProc>0)
		HIDE PROCESS:C324(<>ButtProc)
	End if 
Else 
	If (<>_bo_HidePalletteBar)
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			HIDE PROCESS:C324($_l_BarProcess)
		End if 
		
		
	Else 
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			
			SHOW PROCESS:C325($_l_BarProcess)
		End if 
		If (<>ButtProc>0)
			HIDE PROCESS:C324(<>ButtProc)
		End if 
	End if 
	
End if 



//Delayticks(60*10)
ERR_MethodTrackerReturn("Process_Monitor"; $_t_oldMethodName)
