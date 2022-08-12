//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp NextCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_Count; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; SD_l_SetEventSource; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiarySourceProcess; vCM)
	C_LONGINT:C283(vDY; xCount)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CloseSave; $_t_oldMethodName; $_t_ProcessName; $_t_SDProcName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDis)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp NextCall")
//Comp NextCall
//MODNG 67-2


If (xCount=1)
	If (vCM=0)
		If (([COMPANIES:2]Sales_Person:29#"") | ([COMPANIES:2]Taken_By:26#""))
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager)=2) | (DB_GetModuleSettingByNUM(Module_DiaryManager)=4))
				If (<>SD3_l_DiaryVersion=0)  //| (True)
					$_t_CloseSave:=DB_t_CallOnCloseorSave
					READ WRITE:C146([DIARY:12])
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
					CREATE EMPTY SET:C140([DIARY:12]; "DMaster")
					FORM SET INPUT:C55([DIARY:12]; "Diary_In13")  //NG April 2004 removed reference to ◊screen
					
					DB_t_CurrentFormUsage:="CallBack"
					ADD RECORD:C56([DIARY:12]; *)
					DB_t_CurrentFormUsage:=""
					
					vDY:=0
					DB_t_CallOnCloseorSave:=$_t_CloseSave
					READ ONLY:C145([DIARY:12])
				Else 
					$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						$_l_ProcessNumber:=0
						$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					End if 
					DB_t_CallOnCloseorSave:="File"
					vButtDis:="A DPMONPFSSSRCADT"
					Input_Buttons(->[USER:15]; ->vButtDis)
					If ($_l_ProcessNumber>0)
						
						SD3_l_CallActionNum:=4
						SD_l_SetEventSource:=Current process:C322
						PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
							SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; SD_l_SetEventSource)
							SHOW PROCESS:C325($_l_ProcessNumber)
							RESUME PROCESS:C320($_l_ProcessNumber)
							BRING TO FRONT:C326($_l_ProcessNumber)
							$_l_Count:=0
							Repeat 
								POST OUTSIDE CALL:C329($_l_ProcessNumber)
								GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								If (SD3_l_CallActionNum=0)
									$_l_Count:=$_l_Count+1
									DelayTicks(10*$_l_Count)
								End if 
							Until (SD3_l_CallActionNum=0) | ($_l_Count>100)
						End if 
						SD3_l_CallActionNum:=0
					Else 
						ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcName)
						$_l_Retries:=0
						Repeat 
							
							$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
							$_t_SDProcName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
							$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
							If ($_l_ProcessNumber=0)
								$_l_Retries:=$_l_Retries+1
								DelayTicks(10*(1+$_l_Retries))
							End if 
						Until ($_l_ProcessNumber>0)
						PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
						SD3_l_CallActionNum:=4
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
							SHOW PROCESS:C325($_l_ProcessNumber)
							RESUME PROCESS:C320($_l_ProcessNumber)
							BRING TO FRONT:C326($_l_ProcessNumber)
							POST OUTSIDE CALL:C329($_l_ProcessNumber)
						End if 
						SD3_l_CallActionNum:=0
						
					End if 
				End if 
				
			Else 
				Gen_Alert("You do not have access to Enter to the Diary"; "Cancel")
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Comp NextCall"; $_t_oldMethodName)