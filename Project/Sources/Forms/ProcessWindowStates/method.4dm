If (False:C215)
	//Project Form Method Name:      ProcessWindowStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/05/2013 13:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>PRC_abo_FirstWindow;0)
	//ARRAY BOOLEAN(PRC_abo_ProcessFirstWindow;0)
	//ARRAY BOOLEAN(PROC_lb_ProcessWindows;0)
	//ARRAY LONGINT(<>DB_al_LastCall;0)
	//ARRAY LONGINT(<>DB_al_MemoryProcess;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY LONGINT(PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY LONGINT(PRC_al_ProcessState;0)
	//ARRAY LONGINT(PRC_al_UniqueID;0)
	//ARRAY LONGINT(PRC_al_WindowReference;0)
	//ARRAY LONGINT(PROC_al_LastTimeCall;0)
	//ARRAY REAL(<>DB_ar_MemoryFree;0)
	//ARRAY REAL(Prc_ar_ProcessFreeMemory;0)
	//ARRAY TEXT(<>DB_at_LastMethod;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	//ARRAY TEXT(Proc_at_LastMethodCalled;0)
	C_BOOLEAN:C305(<>DB_bo_MemoryTrackInited; <>ProcInited; <>SYS_bo_QuitCalled; $_bo_InStartup)
	C_LONGINT:C283(<>ProcProc; $_l_event; $_l_Height; $_l_ProcessIndex; $_l_ProcessRow; $_l_Retries; $_l_Width; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_LONGINT:C283(PROC_l_BUT1; PROC_l_But2; PROC_l_BUT3; PROC_l_BUT4; PROC_l_BUT5; PROC_l_BUT6; PROC_l_BUT7; PROC_l_BUT8; PROC_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; PROC_t_COL1; PROC_t_COL2; PROC_t_COL3; PROC_t_COL4; PROC_t_COL5; PROC_t_COL6; PROC_t_COL7; PROC_t_COL8; PROC_t_COL9; PROC_t_HED1)
	C_TEXT:C284(PROC_t_HED2; PROC_t_HED3; PROC_t_HED4; PROC_t_HED5; PROC_t_HED6; PROC_t_HED7; PROC_t_HED8; PROC_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM ProcessWindowStates"; Form event code:C388)
$_l_event:=Form event code:C388
SET TIMER:C645(60*5)
Case of 
	: ($_l_event=On Load:K2:1)
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			//TRACE
			ARRAY BOOLEAN:C223(PRC_abo_ProcessFirstWindow; 0)
			ARRAY LONGINT:C221(PRC_al_ProcessNum; 0)
			ARRAY TEXT:C222(PRC_at_ProcessName; 0)
			ARRAY REAL:C219(Prc_ar_ProcessFreeMemory; 0)
			ARRAY LONGINT:C221(PRC_al_ProcessCalledBy; 0)
			ARRAY LONGINT:C221(PRC_al_WindowReference; 0)
			ARRAY LONGINT:C221(PRC_al_UniqueID; 0)
			ARRAY LONGINT:C221(PRC_al_ProcessState; 0)
			$_l_Retries:=0
			While (Semaphore:C143("$ProcArr"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
				
			End while 
			COPY ARRAY:C226(<>PRC_abo_FirstWindow; PRC_abo_ProcessFirstWindow)
			COPY ARRAY:C226(<>PRC_al_ProcessNum; PRC_al_ProcessNum)
			COPY ARRAY:C226(<>PRC_at_ProcessName; PRC_at_ProcessName)
			COPY ARRAY:C226(<>PRC_al_ProcessCalledBy; PRC_al_ProcessCalledBy)
			COPY ARRAY:C226(<>PRC_al_WindowReference; PRC_al_WindowReference)
			COPY ARRAY:C226(<>PRC_al_UniqueID; PRC_al_UniqueID)
			COPY ARRAY:C226(<>PRC_al_ProcessState; PRC_al_ProcessState)
			ARRAY REAL:C219(Prc_ar_ProcessFreeMemory; Size of array:C274(PRC_at_ProcessName))
			ARRAY TEXT:C222(Proc_at_LastMethodCalled; Size of array:C274(PRC_at_ProcessName))
			ARRAY LONGINT:C221(PROC_al_LastTimeCall; Size of array:C274(PRC_at_ProcessName))
			If (Not:C34(<>DB_bo_MemoryTrackInited))
				ARRAY LONGINT:C221(<>DB_al_MemoryProcess; 0)
				ARRAY REAL:C219(<>DB_ar_MemoryFree; 0)
				ARRAY TEXT:C222(<>DB_at_LastMethod; 0)
				ARRAY LONGINT:C221(<>DB_al_LastCall; 0)
				<>DB_bo_MemoryTrackInited:=True:C214
			End if 
			For ($_l_ProcessIndex; 1; Size of array:C274(Prc_ar_ProcessFreeMemory))
				$_l_ProcessRow:=Find in array:C230(<>DB_al_MemoryProcess; PRC_al_ProcessNum{$_l_ProcessIndex})
				If ($_l_ProcessRow>0)
					Prc_ar_ProcessFreeMemory{$_l_ProcessIndex}:=Round:C94(<>DB_ar_MemoryFree{$_l_ProcessRow}; 2)
					Proc_at_LastMethodCalled{$_l_ProcessIndex}:=<>DB_at_LastMethod{$_l_ProcessRow}
					PROC_al_LastTimeCall{$_l_ProcessIndex}:=<>DB_al_LastCall{$_l_ProcessRow}
				End if 
			End for 
			SORT ARRAY:C229(PROC_al_LastTimeCall; PRC_abo_ProcessFirstWindow; PRC_al_ProcessNum; Prc_ar_ProcessFreeMemory; Proc_at_LastMethodCalled; PRC_at_ProcessName; PRC_al_ProcessCalledBy; PRC_al_WindowReference; PRC_al_UniqueID; PRC_al_ProcessState; PROC_al_LastTimeCall; <)
			
			CLEAR SEMAPHORE:C144("$ProcArr")
			LB_SetupListbox(->PROC_lb_ProcessWindows; "PROC_S55"; "PROC_L"; 1; ->PRC_abo_ProcessFirstWindow; ->PRC_al_ProcessNum; ->Prc_ar_ProcessFreeMemory; ->Proc_at_LastMethodCalled; ->PRC_at_ProcessName; ->PRC_al_ProcessCalledBy; ->PRC_al_WindowReference; ->PRC_al_UniqueID; ->PRC_al_ProcessState; ->PROC_al_LastTimeCall)
			LB_SetColumnHeaders(->PROC_lb_ProcessWindows; "PROC_L"; 1; "first window in process"; "Process Number"; "Free memory"; "Project Method"; "Name"; "Called by"; "Window Reference"; "Process Unique ID"; "Current process State"; "Last Call")
			LB_SetEnterable(->PROC_lb_ProcessWindows; False:C215; 0)
			LB_SetColumnWidths(->PROC_lb_ProcessWindows; "PROC_S55"; 1; 20; 87; 87; 187; 187; 88; 50; 100; 2)
			$_l_Width:=(459-355)+(87+87+187+88+50+100+20+20)+10+187
			$_l_Height:=400
			WS_AutoscreenSize(3; $_l_Height; $_l_Width)
			LB_SetScroll(->PROC_lb_ProcessWindows; -3; -2)
			LB_StyleSettings(->PROC_lb_ProcessWindows; "Black"; 9; "PROC_S55"; ->[DIARY:12])
			INT_SetDialog
		End if 
		
	: ($_l_event=On Outside Call:K2:11) | ($_l_event=On Timer:K2:25)
		$_bo_InStartup:=Test semaphore:C652("$DuringLogin")
		If (<>SYS_bo_QuitCalled) | ($_bo_InStartup)
			
			
			DelayTicks(60*10)
			
			$_bo_InStartup:=Test semaphore:C652("$DuringLogin")
			If (Not:C34($_bo_InStartup)) & ((<>SYS_bo_QuitCalled))
				//TRACE
				
				CANCEL:C270
			End if 
			
		Else 
			If (<>ProcInited)
				$_l_Retries:=0
				While (Semaphore:C143("$ProcArr"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks($_l_Retries*2)
				End while 
				COPY ARRAY:C226(<>PRC_abo_FirstWindow; PRC_abo_ProcessFirstWindow)
				COPY ARRAY:C226(<>PRC_al_ProcessNum; PRC_al_ProcessNum)
				COPY ARRAY:C226(<>PRC_at_ProcessName; PRC_at_ProcessName)
				COPY ARRAY:C226(<>PRC_al_ProcessCalledBy; PRC_al_ProcessCalledBy)
				COPY ARRAY:C226(<>PRC_al_WindowReference; PRC_al_WindowReference)
				COPY ARRAY:C226(<>PRC_al_UniqueID; PRC_al_UniqueID)
				COPY ARRAY:C226(<>PRC_al_ProcessState; PRC_al_ProcessState)
				ARRAY REAL:C219(Prc_ar_ProcessFreeMemory; Size of array:C274(PRC_at_ProcessName))
				ARRAY TEXT:C222(Proc_at_LastMethodCalled; Size of array:C274(PRC_at_ProcessName))
				ARRAY LONGINT:C221(PROC_al_LastTimeCall; Size of array:C274(PRC_at_ProcessName))
				If (Not:C34(<>DB_bo_MemoryTrackInited))
					ARRAY LONGINT:C221(<>DB_al_MemoryProcess; 0)
					ARRAY REAL:C219(<>DB_ar_MemoryFree; 0)
					ARRAY TEXT:C222(<>DB_at_LastMethod; 0)
					ARRAY LONGINT:C221(<>DB_al_LastCall; 0)
					<>DB_bo_MemoryTrackInited:=True:C214
				End if 
				For ($_l_ProcessIndex; 1; Size of array:C274(Prc_ar_ProcessFreeMemory))
					$_l_ProcessRow:=Find in array:C230(<>DB_al_MemoryProcess; PRC_al_ProcessNum{$_l_ProcessIndex})
					If ($_l_ProcessRow>0)
						Prc_ar_ProcessFreeMemory{$_l_ProcessIndex}:=Round:C94(<>DB_ar_MemoryFree{$_l_ProcessRow}; 2)
						
						Proc_at_LastMethodCalled{$_l_ProcessIndex}:=<>DB_at_LastMethod{$_l_ProcessRow}
						PROC_al_LastTimeCall{$_l_ProcessIndex}:=<>DB_al_LastCall{$_l_ProcessRow}
					End if 
				End for 
				SORT ARRAY:C229(PROC_al_LastTimeCall; PRC_abo_ProcessFirstWindow; PRC_al_ProcessNum; Prc_ar_ProcessFreeMemory; Proc_at_LastMethodCalled; PRC_at_ProcessName; PRC_al_ProcessCalledBy; PRC_al_WindowReference; PRC_al_UniqueID; PRC_al_ProcessState; PROC_al_LastTimeCall; <)
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom+1)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				CLEAR SEMAPHORE:C144("$ProcArr")
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM ProcessWindowStates"; $_t_oldMethodName)
