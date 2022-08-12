//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_CurrentDiaryInitials;0)
	C_DATE:C307(SD_D_DateDO)
	C_LONGINT:C283($_l_Count; $_l_DiaryActionNum; $_l_ProcessState; DB_l_ButtonClickedFunction; SD_l_DiaryInState; SD_l_GenwindowBottom; SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop; SD_l_ParentProcess; SD3_l_CallActionNum)
	C_LONGINT:C283(SD3_l_DiaryActionNum; vAdd; vMod)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $2; $3; $4; $5; $6; $7; $8; DB_t_CallOnCloseorSave)
	C_TEXT:C284(SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_DiaryActionCode; SD_t_DiaryPersonInitials; SD_t_InputFormName; WIN_t_CurrentInputForm)
	C_TIME:C306(SD_ti_TimeDo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary In")
//Diary In
ARRAY TEXT:C222(SD2_at_CurrentDiaryInitials; 0)


SD_l_DiaryInState:=1
If (Count parameters:C259>=1)
	SD_l_ParentProcess:=Num:C11($1)
End if 
If (Count parameters:C259>=2)
	SD_t_CallingCompanyCode:=$2
End if 
If (Count parameters:C259>=3)
	SD_t_CallingContactCode:=$3
End if 
If (Count parameters:C259>=4)
	SD_t_InputFormName:=$4
End if 
If (Count parameters:C259>=5)
	SD_D_DateDO:=Date:C102($5)
End if 
If (Count parameters:C259>=6)
	SD_ti_TimeDo:=Time:C179($6)
End if 
If (Count parameters:C259>=7)
	SD_t_DiaryPersonInitials:=$7
	If (SD_t_DiaryPersonInitials="MULTI")
		//SD_t_DiaryPersonInitials:=""
		//in which case SD2_at_CurrentDiaryInitials should have some data
	End if 
End if 
If (Count parameters:C259>=8)
	SD_t_DiaryActionCode:=$8
End if 
$_t_WindowTitle:="Enter to Diary"
Start_Process
If (Diary_File)  // modified NG June 2004
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([DIARY:12]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	
	If (In_Allowed($_t_WindowTitle; ->[DIARY:12]))
		CREATE SET:C116([DIARY:12]; "DMaster")
		REDUCE SELECTION:C351([DIARY:12]; 0)
		vAdd:=1
		vMod:=1
		OK:=1
		If (SD_l_ParentProcess>0)
			HIDE PROCESS:C324(Current process:C322)  //the load method will show process
			$_l_ProcessState:=Process state:C330(SD_l_ParentProcess)
			
			If ($_l_ProcessState>=0)
				$_l_DiaryActionNum:=18
				While ($_l_DiaryActionNum>0)
					GET PROCESS VARIABLE:C371(SD_l_ParentProcess; SD3_l_DiaryActionNum; $_l_DiaryActionNum)
					If ($_l_DiaryActionNum>0)
						DelayTicks
					End if 
				End while 
				SD3_l_CallActionNum:=18
				SD_l_GenwindowBottom:=0
				SD_l_GenwindowTop:=0
				SD_l_GenwindowRight:=0
				SD_l_GenwindowLeft:=0
				SET PROCESS VARIABLE:C370(SD_l_ParentProcess; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
				POST OUTSIDE CALL:C329(SD_l_ParentProcess)
				$_l_Count:=0
				While (SD_l_GenwindowBottom=0) & ($_l_Count<5)
					$_l_Count:=$_l_Count+1
					GET PROCESS VARIABLE:C371(SD_l_ParentProcess; SD_l_GenwindowLeft; SD_l_GenwindowLeft)
					GET PROCESS VARIABLE:C371(SD_l_ParentProcess; SD_l_Genwindowtop; SD_l_Genwindowtop)
					GET PROCESS VARIABLE:C371(SD_l_ParentProcess; SD_l_GenwindowRight; SD_l_GenwindowRight)
					GET PROCESS VARIABLE:C371(SD_l_ParentProcess; SD_l_Genwindowbottom; SD_l_Genwindowbottom)
					If (SD_l_Genwindowbottom=0)
						DelayTicks
					End if 
				End while 
				SD3_l_CallActionNum:=0
				If (SD_l_GenwindowRight>0)
					
					Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm; ""; SD_l_GenwindowRight)
				Else 
					Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
				End if 
			End if 
		Else 
			Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
		End if 
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			ADD RECORD:C56([DIARY:12]; *)
			
			Diary_FileI
			ADD TO SET:C119([DIARY:12]; "DMaster")
			Gen_InOne
		End while 
		Close_ProWin(Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		If (Count parameters:C259>=1)
			If (SD_l_ParentProcess>0)
				$_l_ProcessState:=Process state:C330(SD_l_ParentProcess)
				If ($_l_ProcessState>=0)
					SET PROCESS VARIABLE:C370(SD_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Refresh"))
					
					POST OUTSIDE CALL:C329(SD_l_ParentProcess)
					
				End if 
				//call back to update 'parent process'(
				//if it is still running
			End if 
			
		End if 
		vAdd:=0
	End if 
End if 
Comp_Unload
Process_End
ERR_MethodTrackerReturn("Diary In"; $_t_oldMethodName)