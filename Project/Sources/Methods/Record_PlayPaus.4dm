//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayPaus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_ThisWindowPalette; $_l_UniqueProcessID; $_l_UniqueProcessID2; $CurrProc; $RPU; SCPT_l_ExecutionState; SCPT_l_ThisWindowPalette)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayPaus")
//Record_PlayPaus
//<>SCPT_l_ExecutionProcess:=Current process



If (False:C215)
	//Changed-so now if this was not called from the palette there is no palette to interacte with(regardless of the existendce of any palette
	//there for we dont car about the state of any palette other than one that is interacting with this process
	//if there is a palette the pause button will be disable and the play button enabled
	//if there is no palette we will launch one and set the buttons-such a palette launched here will die as soon as we unpause or stop this process
	
Else 
	If (SCPT_l_ThisWindowPalette>0)
		//This macro was called from a palette
		//so we can set the state of the palette and it can resume this process
		PROCESS PROPERTIES:C336(SCPT_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
		If ($_l_UniqueProcessID2=$_l_UniqueProcessID) & ($_l_ProcessState>=0)
			SET PROCESS VARIABLE:C370(SCPT_l_ThisWindowPalette; SCPT_l_ExecutionState; 2)
			POST OUTSIDE CALL:C329(SCPT_l_ThisWindowPalette)
		Else 
			//Process aint there so launch a new one
			PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
			//`we need to launch a palette for this process to enable the resume of the macro.
			$_l_ThisWindowPalette:=New process:C317("SCPT_minimacros"; 256000; "Controls For "+$_t_processName; Current process:C322; $_t_processName)
			PROCESS PROPERTIES:C336(SCPT_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
			PAUSE PROCESS:C319(Current process:C322)
			PROCESS PROPERTIES:C336($_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
			If ($_l_UniqueProcessID2=$_l_UniqueProcessID) & ($_l_ProcessState>=0)
				SET PROCESS VARIABLE:C370($_l_ThisWindowPalette; SCPT_l_ExecutionState; 3)
				POST OUTSIDE CALL:C329($_l_ThisWindowPalette)
			End if 
		End if 
		PAUSE PROCESS:C319(Current process:C322)
		
	Else 
		PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
		//`we need to launch a palette for this process to enable the resume of the macro.
		$_l_ThisWindowPalette:=New process:C317("SCPT_minimacros"; 256000; "Controls For "+$_t_processName; Current process:C322; $_t_processName)
		PROCESS PROPERTIES:C336(SCPT_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
		PAUSE PROCESS:C319(Current process:C322)
		PROCESS PROPERTIES:C336($_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
		If ($_l_UniqueProcessID2=$_l_UniqueProcessID) & ($_l_ProcessState>=0)
			SET PROCESS VARIABLE:C370($_l_ThisWindowPalette; SCPT_l_ExecutionState; 3)
			POST OUTSIDE CALL:C329($_l_ThisWindowPalette)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayPaus"; $_t_oldMethodName)
