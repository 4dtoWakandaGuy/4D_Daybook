//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_End
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      27/11/2010 11:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_InStartup; vNoEnd)
	C_LONGINT:C283(<>MenuProc; <>SCPT_l_PaletteWIndow; $_l_BarProcess; $_l_CurrentProcess; $_l_Index; $_l_ProcessState; $_l_ProcessTime; $_l_WIndowCount)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_End")
//Process_End

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_l_CurrentProcess:=Current process:C322
If (vNoEnd=False:C215)
	PROC_SetProcess(Current process:C322; 0; 0; -100)
	If (Frontmost process:C327(*)=<>MenuProc) | (True:C214)  //Bring the next one to front  if possible
		$_l_Index:=Size of array:C274(<>PRC_al_ProcessNum)  //Copied to ScrnSav_Proc
		While ($_l_Index>0)
			If ($_l_Index#$_l_CurrentProcess)
				PROCESS PROPERTIES:C336(<>PRC_al_ProcessNum{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				// $_l_ProcessState:=Process state(◊PRC_al_ProcessNum{$_l_Index})
				If ($_l_ProcessState=5)
					Processes_PopUp($_l_Index)
					$_l_Index:=0
				End if 
			End if 
			$_l_Index:=$_l_Index-1
		End while 
	End if 
	
Else 
	vNoEnd:=False:C215
End if 

While (Semaphore:C143("$ProcArr"))
	DelayTicks(5)
End while 
$_l_WIndowCount:=0
If (Size of array:C274(<>PRC_al_ProcessNum)>0)
	For ($_l_Index; 1; Size of array:C274(<>PRC_al_ProcessNum))
		If (<>PRC_al_ProcessNum{$_l_Index}#Current process:C322) & (Position:C15("Modules_Palette"; <>PRC_at_ProcessName{$_l_Index})=0) & (<>PRC_al_WindowReference{$_l_Index}#0) & (Process state:C330(<>PRC_al_ProcessNum{$_l_Index})>=0) & (Process state:C330(<>PRC_al_ProcessNum{$_l_Index})#6)
			
			$_l_WIndowCount:=$_l_WIndowCount+1
		End if 
	End for 
End if 

CLEAR SEMAPHORE:C144("$ProcArr")
If ($_l_WIndowCount=0) & (Not:C34(<>SYS_bo_QuitCalled))
	$_bo_InStartup:=Test semaphore:C652("$DuringLogin")
	If (Not:C34($_bo_InStartup))
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			
			SHOW PROCESS:C325($_l_BarProcess)
			If (<>SCPT_l_PaletteWIndow>0)
				SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; SCPT_l_ParentProcess; 0)
				SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; 0)
				POST OUTSIDE CALL:C329(<>SCPT_l_PaletteWIndow)
			End if 
		Else 
			$_l_BarProcess:=New process:C317("Menu_ModBar2"; 256000; "Modules_Palette"; *)  //see ZMenuModBar
			
		End if 
	End if 
Else 
	
End if 
ERR_MethodTrackerReturn("Process_End"; $_t_oldMethodName)
