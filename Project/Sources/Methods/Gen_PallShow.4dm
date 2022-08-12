//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PallShow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2011 09:05
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
	ARRAY LONGINT:C221($_al_ProcessID; 0)
	ARRAY LONGINT:C221($_al_ProcessState; 0)
	ARRAY LONGINT:C221($_al_ProcessTime; 0)
	ARRAY LONGINT:C221($_al_UniquePID; 0)
	ARRAY TEXT:C222($_at_ProcessName; 0)
	C_BOOLEAN:C305($_bo_ProcessVIsible; Proc_bo_IgnoreCalledBy)
	C_LONGINT:C283(<>BUTTPROC; <>ButtProcV; <>ProcProc; <>SCPT_l_PaletteWIndow; $_l_BarProcess; $_l_CountTasks; $_l_Index; $_l_ProcessID; $_l_ProcessOrigin; $_l_ProcessPosition; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_SubCount; $_l_UniqueProcessID; $_l_WindowCount)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PallShow")
//`````
ARRAY LONGINT:C221($_al_ProcessID; 0)
ARRAY TEXT:C222($_at_ProcessName; 0)
ARRAY LONGINT:C221($_al_ProcessState; 0)
ARRAY LONGINT:C221($_al_ProcessTime; 0)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; 0)
ARRAY LONGINT:C221($_al_UniquePID; 0)
ARRAY LONGINT:C221($_al_OriginID; 0)

$_l_CountTasks:=Count tasks:C335
ARRAY LONGINT:C221($_al_ProcessID; $_l_CountTasks)
ARRAY TEXT:C222($_at_ProcessName; $_l_CountTasks)
ARRAY LONGINT:C221($_al_ProcessState; $_l_CountTasks)
ARRAY LONGINT:C221($_al_ProcessTime; $_l_CountTasks)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; $_l_CountTasks)
ARRAY LONGINT:C221($_al_UniquePID; $_l_CountTasks)
ARRAY LONGINT:C221($_al_OriginID; $_l_CountTasks)
$_l_SubCount:=0
$_t_ProcessName:=""
$_l_ProcessState:=0
$_l_ProcessTime:=0
$_bo_ProcessVIsible:=False:C215
$_l_UniqueProcessID:=0
$_l_ProcessOrigin:=0
For ($_l_Index; 1; $_l_CountTasks)
	PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVIsible; $_l_UniqueProcessID; $_l_ProcessOrigin)
	If ($_l_ProcessOrigin#Internal timer process:K36:29) & ($_l_ProcessOrigin#Client manager process:K36:31) & ($_l_ProcessOrigin#Server interface process:K36:20)
		$_l_SubCount:=$_l_SubCount+1
		//$_al_ProcessID{$_l_SubCount}:=
		$_at_ProcessName{$_l_SubCount}:=$_t_ProcessName
		$_al_ProcessState{$_l_SubCount}:=$_l_ProcessState
		$_al_ProcessTime{$_l_SubCount}:=$_l_ProcessTime
		$_abo_ProcessVisible{$_l_SubCount}:=$_bo_ProcessVIsible
		$_al_UniquePID{$_l_SubCount}:=$_l_UniqueProcessID
		$_al_OriginID{$_l_SubCount}:=$_l_ProcessOrigin
		$_al_ProcessID{$_l_SubCount}:=$_l_Index
	End if 
	//PROCESS PROPERTIES($_l_Index;$_at_ProcessName{$_l_Index};$_al_ProcessState{$_l_Index};$_al_ProcessTime{$_l_Index};$_abo_ProcessVisible{$_l_Index};$_al_UniquePID{$_l_Index};$_al_OriginID{$_l_Index})
	
End for 
ARRAY LONGINT:C221($_al_ProcessID; $_l_SubCount)
ARRAY TEXT:C222($_at_ProcessName; $_l_SubCount)
ARRAY LONGINT:C221($_al_ProcessState; $_l_SubCount)
ARRAY LONGINT:C221($_al_ProcessTime; $_l_SubCount)
ARRAY BOOLEAN:C223($_abo_ProcessVisible; $_l_SubCount)
ARRAY LONGINT:C221($_al_UniquePID; $_l_SubCount)
ARRAY LONGINT:C221($_al_OriginID; $_l_SubCount)
$_l_WindowCount:=0
For ($_l_Index; 1; Size of array:C274($_al_ProcessID))
	//here put ALL the other process into the array except locals
	//in the pop-up though only put processes that have a window reference
	
	If ($_at_ProcessName{$_l_Index}#"")
		If ($_at_ProcessName{$_l_Index}[[1]]#"$")
			Proc_bo_IgnoreCalledBy:=True:C214
			PROC_SetProcess($_al_ProcessID{$_l_Index})
			$_l_ProcessPosition:=Find in array:C230(<>PRC_al_ProcessNum; $_al_ProcessID{$_l_Index})
			If ($_l_ProcessPosition>0)
				If (<>PRC_al_WindowReference{$_l_ProcessPosition}#0)
					$_l_WindowCount:=$_l_WindowCount+1
				End if 
			End if 
			Proc_bo_IgnoreCalledBy:=False:C215
		End if 
	End if 
End for 
//````
If ($_l_WindowCount>0)
	If (<>ButtProc>0)
		HIDE PROCESS:C324(<>ButtProc)
	End if 
	If (<>ButtProcV>0)
		HIDE PROCESS:C324(<>ButtProcV)
	End if 
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	If ($_l_BarProcess>0)
		HIDE PROCESS:C324($_l_BarProcess)
	End if 
	If (<>SCPT_l_PaletteWIndow>0)
		HIDE PROCESS:C324(<>SCPT_l_PaletteWIndow)
	End if 
Else 
	If (<>ButtProc>0)
		SHOW PROCESS:C325(<>ButtProc)
	End if 
	If (<>ButtProcV>0)
		SHOW PROCESS:C325(<>ButtProcV)
	End if 
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	If ($_l_BarProcess>0)
		SHOW PROCESS:C325($_l_BarProcess)
	End if 
	If (<>SCPT_l_PaletteWIndow>0)
		SHOW PROCESS:C325(<>SCPT_l_PaletteWIndow)
	End if 
End if 
If (<>ProcProc>0)
	SHOW PROCESS:C325(<>ProcProc)
End if 
ERR_MethodTrackerReturn("Gen_PallShow"; $_t_oldMethodName)
