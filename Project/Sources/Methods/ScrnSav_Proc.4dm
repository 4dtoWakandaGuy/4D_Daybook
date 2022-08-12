//%attributes = {}
If (False:C215)
	//Project Method Name:      ScrnSav_Proc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>PER_bo_ScrnSaveId; <>PersAnOver; <>SYS_bo_Active; <>SYS_bo_CurrentWindowModal; $_bo_Show; GEN_bo_Autoquit; GEN_bo_ShowChangeAccess; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>AutoProc; <>MENU_l_BarModule; <>MenuProc; <>SYS_l_CancelProcess; <>SYS_l_WindowTop; $_l_CurrentProcess; $_l_Index; $_l_ProcessState; $_l_ProcessTime; $_l_ScreenSaverProcess; $_l_WindowReferenceRow)
	C_LONGINT:C283($cp; $h; $left; $pm; $top; $w; $WindHoriz; $WindVert; $WPosNoH; $WPosNoV; $WPosSt)
	C_LONGINT:C283(bd1; bd10; bd12; bd2; bd3; bd4; bd5; bd6; bd7; bd8; i)
	C_LONGINT:C283(j; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284(<>DB_t_Password; <>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_ProcessName; $Title)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ScrnSav_Proc")
//ScrnSav_Procedure
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

If (<>SYS_bo_CurrentWindowModal=False:C215)
	$_l_CurrentProcess:=Current process:C322
	If (<>SYS_bo_Active=False:C215)
		PAUSE PROCESS:C319($_l_CurrentProcess)
		$_bo_Show:=False:C215
	Else 
		$_bo_Show:=True:C214
	End if 
	OK:=1
	If (($_bo_Show) | ((<>DB_t_Password#"") & (DB_GetModuleSettingByNUM(1)#5) & (<>PER_bo_ScrnSaveId)))  //($_bo_Show) `if removing password
		Process_GenAll("Hide"; 0)
		If (OK=1)
			DB_SetMenuBar(""; 86)
		End if 
	End if 
	If (($_bo_Show) & (OK=1))
		ON EVENT CALL:C190("")
		<>SYS_l_CancelProcess:=0
		ON EVENT CALL:C190("On_EventSS"; "$Events")
		If ((<>Per_t_CurrentDefaultAnalCode#"") & (<>PersAnOver))
			If (DB_GetOrganisationScreenName#"")
				$Title:=DB_GetOrganisationScreenName+" :"+<>Per_t_CurrentDefaultAnalCode+"/"+<>PER_t_CurrentUserInitials
			Else 
				$Title:=<>Per_t_CurrentDefaultAnalCode+"/"+<>PER_t_CurrentUserInitials
			End if 
		Else 
			If (DB_GetOrganisationScreenName#"")
				$Title:=DB_GetOrganisationScreenName+" :"+<>PER_t_CurrentUserInitials
			Else 
				$Title:=<>PER_t_CurrentUserInitials
			End if 
		End if 
		$pm:=Process_No("$_l_Process_Manager")
		If ($pm>0)
			PAUSE PROCESS:C319($pm)
		End if 
		OK:=1
		bd1:=Random:C100%(2)
		<>AutoProc:=bd1
		$cp:=New process:C317("ScrnSav_Change"; 128000; "$ScrnSaveChange")
		While (Semaphore:C143("$BarMod"))
			DelayTicks
		End while 
		j:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
		If (j>0)
			i:=j
			bd2:=1
			bd3:=1
			bd4:=0
			bd5:=0
			bd6:=1
			bd7:=Screen height:C188
			bd8:=Screen width:C187
			bd9:=<>SYS_l_WindowTop+50
			bd10:=53
			bd12:=1
			//OPEN WINDOW(2000;2000;2001;2001;2)`Was to prevent Pal from coming to front
			bd11:=Open window:C153(53; bd9; 486; <>SYS_l_WindowTop+322; 4; $Title)
			// bd11:=GetWRef
			// bd11 :=wt_Get ID
			//If (DB_GetModuleSetting(1)=5)
			//  DIALOG([COMPANIES];"dModuleSilver")
			//  Else
			DIALOG:C40([COMPANIES:2]; "dScreenSaver")  // "+String(◊MOD_al_ModuleBarNum{$_l_Index}))
			//  End if
			CLOSE WINDOW:C154
			OK:=1
			//   CLOSE WINDOW
		End if 
		CLEAR SEMAPHORE:C144("$BarMod")
		If ($cp>0)
			<>SYS_l_CancelProcess:=$_l_CurrentProcess
			RESUME PROCESS:C320($cp)
		End if 
		If ($pm>0)
			RESUME PROCESS:C320($pm)
		End if 
		ON EVENT CALL:C190("")
	End if 
	If ((<>DB_t_Password#"") & (OK=1) & (DB_GetModuleSettingByNUM(1)#5) & (<>PER_bo_ScrnSaveId))
		// If (Gen_Option )  `remove when want to reimpose the password
		i:=1
		GEN_bo_Autoquit:=True:C214
		GEN_bo_ShowChangeAccess:=True:C214
		Open_AnyTypeWindow(100; 320; 1; "")  //;"User: "+◊User)
		vRequest:="Please confirm "+<>PER_t_CurrentUserInitials+"'s Id"
		<>DB_t_Password:=""
		DIALOG:C40([COMPANIES:2]; "dAsk_Id")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		
		If (xNext=1)
			Change_AccessP
		Else 
			Start_Event
		End if 
		
		// End if
	Else 
		Start_Event
	End if 
	If ((($_bo_Show) | ((<>DB_t_Password#"") & (DB_GetModuleSettingByNUM(1)#5) & (<>PER_bo_ScrnSaveId))) & (OK=1))  //(($_bo_Show) & (OK=1))
		Process_GenAll("Show"; 0)
		RESUME PROCESS:C320(Frontmost process:C327(*))
	End if 
	$_l_ScreenSaverProcess:=Process_No("$ScreenSaver")  //Resume the timer process, that was paused
	If ($_l_ScreenSaverProcess>0)
		RESUME PROCESS:C320($_l_ScreenSaverProcess)
	End if 
	
	If (OK=1)
		$_l_ScreenSaverProcess:=Frontmost process:C327(*)
		If ($_l_ScreenSaverProcess=<>MenuProc)  //Bring the next one to front  if possible
			$_l_Index:=Size of array:C274(<>PRC_al_ProcessNum)
			While ($_l_Index>0)
				IDLE:C311  // 7/04/03 pb
				PROCESS PROPERTIES:C336(<>PRC_al_ProcessNum{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				// $_l_ProcessState:=Process state(◊PRC_al_ProcessNum{$_l_Index})
				If ($_l_ProcessState=5)
					Processes_PopUp($_l_Index)
					$_l_Index:=0
				End if 
				$_l_Index:=$_l_Index-1
			End while 
		Else 
			BRING TO FRONT:C326($_l_ScreenSaverProcess)  //Makes it Activated
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ScrnSav_Proc"; $_t_oldMethodName)
