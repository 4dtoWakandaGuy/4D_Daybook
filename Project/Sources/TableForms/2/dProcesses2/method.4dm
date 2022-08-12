If (False:C215)
	//Table Form Method Name: Object Name:      [COMPANIES].dProcesses2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
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
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; DB_bo_NoLoad; NORESIZE; PM_Min)
	C_LONGINT:C283(<>_l_ProcPaletteWinOpened; <>MenuProc; <>ProcProc; $_l_CurrentProcess; $_l_event; $_l_Index; $_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_SIzeofArray; PM_Bottom)
	C_LONGINT:C283(PM_Left; PM_Right; PM_Top)
	C_PICTURE:C286(PRC_Pi_DropDown)
	C_REAL:C285(<>_l_ProcPaletteWinSizeState)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dProcesses2"; Form event code:C388)
$_l_CurrentProcess:=Current process:C322
$_l_event:=Form event code:C388
SET TIMER:C645(60*2)


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (<>MenuProc=0)
			<>MenuProc:=1
		End if 
		//GET PICTURE FROM LIBRARY(22541; PRC_Pi_DropDown)
		PRC_Pi_DropDown:=Get_Picture(22541)
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dProcesses2")
		DB_MenuAction("Volumes"; "Windows Palette"; 4; "8"; <>menuProc; False:C215)
		ARRAY LONGINT:C221(PRC_al_ProcessNum; 0)
		ARRAY TEXT:C222(PRC_at_ProcessName; 0)
		ARRAY LONGINT:C221(PRC_al_ProcessCalledBy; 0)
		ARRAY LONGINT:C221(PRC_al_WindowReference; 0)
		ARRAY LONGINT:C221(PRC_al_UniqueID; 0)
		ARRAY LONGINT:C221(PRC_al_ProcessState; 0)
		$_l_Retries:=0
		While (Semaphore:C143("$ProcArr"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks($_l_Retries*2)
		End while 
		PROC_SetProcess(0)  //Just to make sure this is inited
		COPY ARRAY:C226(<>PRC_al_ProcessNum; PRC_al_ProcessNum)
		COPY ARRAY:C226(<>PRC_at_ProcessName; PRC_at_ProcessName)
		COPY ARRAY:C226(<>PRC_al_ProcessCalledBy; PRC_al_ProcessCalledBy)
		COPY ARRAY:C226(<>PRC_al_WindowReference; PRC_al_WindowReference)  // 3/12/02 pb
		COPY ARRAY:C226(<>PRC_al_UniqueID; PRC_al_UniqueID)
		COPY ARRAY:C226(<>PRC_al_ProcessState; PRC_al_ProcessState)
		CLEAR SEMAPHORE:C144("$ProcArr")
		If (Size of array:C274(PRC_al_UniqueID)>0)
			For ($_l_Index; Size of array:C274(PRC_al_UniqueID); 1; -1)
				If (PRC_al_WindowReference{$_l_Index}=0) | (PRC_al_ProcessState{$_l_Index}<0)
					DELETE FROM ARRAY:C228(PRC_al_ProcessNum; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_at_ProcessName; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_ProcessCalledBy; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_WindowReference; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_UniqueID; $_l_Index)
				End if 
			End for 
		End if 
		If (PM_Min=True:C214)
			//go any smaller than 29 and the zoom box hides!
			//WS_AutoscreenSize (2;23;32)
			WS_AutoscreenSize(2; 20; 21)
			FORM GOTO PAGE:C247(2)
			NORESIZE:=True:C214
		Else 
			WS_AutoscreenSize(2; 155; 121)
			FORM GOTO PAGE:C247(1)
			NORESIZE:=True:C214
		End if 
		
		GET WINDOW RECT:C443(PM_Left; PM_Top; PM_Right; PM_Bottom)
		
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(NORESIZE))
			PM_Min:=(PM_Min=False:C215)
			If (PM_Min=True:C214)
				NORESIZE:=True:C214
				FORM GOTO PAGE:C247(2)
				SET WINDOW RECT:C444(PM_Right-21; PM_Top; PM_Right; PM_Top+23)
				//go any smaller than 29 and the zoom box hides!
			Else 
				NORESIZE:=True:C214
				FORM GOTO PAGE:C247(1)
				SET WINDOW RECT:C444(PM_Right-121; PM_Top; PM_Right; PM_Top+155)
			End if 
		Else 
			NORESIZE:=False:C215
		End if 
		
	: ($_l_event=On Outside Call:K2:11) | ($_l_event=On Timer:K2:25)
		
		If (<>ProcProc=0) | (<>SYS_bo_QuitCalled)  //if quitng get out bsw 13/08/04
			CANCEL:C270
			
			
		Else 
			$_l_Retries:=0
			While (Semaphore:C143("$ProcArr"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
				
			End while 
			COPY ARRAY:C226(<>PRC_al_ProcessNum; PRC_al_ProcessNum)
			COPY ARRAY:C226(<>PRC_at_ProcessName; PRC_at_ProcessName)
			COPY ARRAY:C226(<>PRC_al_ProcessCalledBy; PRC_al_ProcessCalledBy)
			COPY ARRAY:C226(<>PRC_al_WindowReference; PRC_al_WindowReference)  // 3/12/02 pb
			COPY ARRAY:C226(<>PRC_al_UniqueID; PRC_al_UniqueID)
			COPY ARRAY:C226(<>PRC_al_ProcessState; PRC_al_ProcessState)
			CLEAR SEMAPHORE:C144("$ProcArr")
			For ($_l_Index; Size of array:C274(PRC_al_UniqueID); 1; -1)
				If (PRC_al_WindowReference{$_l_Index}=0) | (PRC_al_ProcessState{$_l_Index}<0)
					DELETE FROM ARRAY:C228(PRC_al_ProcessNum; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_at_ProcessName; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_ProcessCalledBy; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_WindowReference; $_l_Index)
					DELETE FROM ARRAY:C228(PRC_al_UniqueID; $_l_Index)
				End if 
			End for 
			If (False:C215)  //test with this off
				$_l_SIzeofArray:=Size of array:C274(PRC_al_ProcessNum)
				$_l_Index:=1
				While ($_l_Index<=Size of array:C274(PRC_al_ProcessNum))
					PROCESS PROPERTIES:C336(PRC_al_ProcessNum{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						DELETE FROM ARRAY:C228(PRC_al_ProcessNum; $_l_Index; 1)
						DELETE FROM ARRAY:C228(PRC_at_ProcessName; $_l_Index; 1)
						DELETE FROM ARRAY:C228(PRC_al_ProcessCalledBy; $_l_Index; 1)
						DELETE FROM ARRAY:C228(PRC_al_WindowReference; $_l_Index; 1)  // 3/12/02 pb
						DELETE FROM ARRAY:C228(PRC_al_UniqueID; $_l_Index; 1)
						$_l_SIzeofArray:=$_l_SIzeofArray-1
					Else 
						$_l_Index:=$_l_Index+1
					End if 
				End while 
				
			End if 
		End if 
		
		If (l_ProcPaletteWinSizeState#<>_l_ProcPaletteWinSizeState)
			l_ProcPaletteWinSizeState:=<>_l_ProcPaletteWinSizeState
			CANCEL:C270
		End if 
		DelayTicks(10)
		
		
	: ($_l_event=On Unload:K2:2)
		DB_MenuAction("Volumes"; "Windows Palette"; 4; ""; Current process:C322; False:C215)
		
		
		
End case 
ERR_MethodTrackerReturn("FM:dProcesses2"; $_t_oldMethodName)
