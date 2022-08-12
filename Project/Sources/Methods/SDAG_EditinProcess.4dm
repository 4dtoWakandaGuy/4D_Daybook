//%attributes = {}

If (False:C215)
	//Project Method Name:      SDAG_EditinProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CallBackProcess; $_l_ProcessState; DB_l_ButtonClickedFunction)
	C_REAL:C285($1; $2; $3)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; CO_t_RelatedContact; SD_t_CurrentDiaryInitials; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDAG_EditinProcess")

//This method will display a diary record in another process
If (Count parameters:C259>=2)
	$_l_CallBackProcess:=$2
Else 
	$_l_CallBackProcess:=0
End if 
CREATE EMPTY SET:C140([DIARY:12]; "Dmaster")

$_t_oldMethodName:=ERR_MethodTracker("SDAG_EditinProcess")
Start_Process
If (Diary_FileL)
	If ($1#0)
		If (Count parameters:C259>=3)
			If ($1<0)
				GOTO RECORD:C242([DIARY:12]; $3)
			Else 
				QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$1)
			End if 
		Else 
			QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$1)
		End if 
		
		Open_Pro_Window("View Diary"; 0; 2; ->[DIARY:12]; "Diary_InNEW")
		FORM SET INPUT:C55([DIARY:12]; "Diary_InNEW")
		WIN_t_CurrentInputForm:="Diary_InNEW"
		$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+"Diary_InNEW"
		
		
		MODIFY RECORD:C57([DIARY:12]; *)
		Close_ProWin($_t_FormReference)
		Process_End
		
		If (Count parameters:C259>=2)
			If ($_l_CallBackProcess>0)
				$_l_ProcessState:=Process state:C330($_l_CallBackProcess)
				If ($_l_ProcessState>=0)
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Refresh"))
					POST OUTSIDE CALL:C329($_l_CallBackProcess)
					
				End if 
				//call back to update 'parent process'(
				//if it is still running
			End if 
			
		End if 
	Else 
		ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [COMPANIES:2]Company_Code:1; CO_t_RelatedContact; "Diary_InNEW"; String:C10(!00-00-00!); Time string:C180(?00:00:00?*1); SD_t_CurrentDiaryInitials)
		
		
	End if 
End if 
//$
ERR_MethodTrackerReturn("SDAG_EditinProcess"; $_t_oldMethodName)
