//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Pro_Window
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/02/2010 17:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY LONGINT(<>WIN_al_WindowID;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>ProWindowInit; $_bo_Bar; $_bo_DoNotCountWindow; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>SYS_l_WindowTop; <>SYS_l_Windowx; <>SYS_l_Windowy; <>WIN_MINLEFT; $_l_AbsoluteLeft; $_l_BottomLimit; $_l_BottomLimit2; $_l_CountWindows; $_l_DockLB; $_l_DockLL)
	C_LONGINT:C283($_l_DockLR; $_l_DockP; $_l_FC; $_l_Functionality; $_l_Height; $_l_LimitBottom; $_l_LimitLeft; $_l_LimitRight; $_l_LimitTop; $_l_NewLeft; $_l_ScreenHeight)
	C_LONGINT:C283($_l_ScreenNumber; $_l_ScreenWIdth; $_l_Width; $_l_WindowBottom; $_l_WindowID; $_l_WindowLeft; $_l_WindowNumber; $_l_WindowReferenceRow; $_l_WindowRight; $_l_WindowRow; $_l_WindowRow2)
	C_LONGINT:C283($_l_WindowTop; $_l_WindowType; $2; $3; $7; PRC_l_WindowBottom; PRC_l_WindowLeft; PRC_l_WindowRight; PRC_l_WindowTop; vProc; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_OBJECT:C1216($_Obj_GetUser)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_Pro_Window")
//Open_Pro_Window
$_l_ScreenNumber:=Menu bar screen:C441
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 
If (Not:C34(<>ProWindowInit))
	<>ProWindowInit:=True:C214
	ARRAY LONGINT:C221(<>WIN_al_WindowID; 0)
End if 
//2=optional type - otherwise is 8
If (Count parameters:C259=2)
	If ($2>0)
		$_l_WindowType:=$2
	Else 
		$_l_WindowType:=8
	End if 
Else 
	$_l_WindowType:=8
End if 
$_l_AbsoluteLeft:=0
If (Count parameters:C259>=7)
	If ($7>0)
		$_l_AbsoluteLeft:=$7
	End if 
End if 
If (vProc>0)
	PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_WindowRow2})
	$_l_WindowRow:=Find in array:C230(<>WIN_al_WindowID; 0)
	
	$_l_WindowRow2:=$_l_WindowRow
	If (Is Windows:C1573)
		If ($_l_ScreenNumber=1)
			$_l_WindowTop:=<>SYS_l_WindowTop+54
			$_l_WindowBottom:=<>SYS_l_WindowTop+426
			$_l_WindowLeft:=<>WIN_MINLEFT+2
			$_l_WindowRight:=604
		Else 
			SCREEN COORDINATES:C438($_l_WindowLeft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
			$_l_WindowTop:=$_l_WindowTop+54
			$_l_WindowLeft:=$_l_WindowLeft+2
			$_l_WindowBottom:=$_l_WindowTop+426
			$_l_WindowRight:=$_l_WindowLeft+604
		End if 
	Else 
		If ($_l_ScreenNumber=1)
			$_l_WindowTop:=<>SYS_l_WindowTop+53
			$_l_WindowBottom:=<>SYS_l_WindowTop+423
			$_l_WindowLeft:=<>WIN_MINLEFT+1
			$_l_WindowRight:=602
		Else 
			SCREEN COORDINATES:C438($_l_WindowLeft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
			$_l_WindowLeft:=$_l_WindowLeft+1
			$_l_WindowTop:=$_l_WindowTop+53
			$_l_WindowBottom:=$_l_WindowTop+423
			$_l_WindowRight:=$_l_WindowLeft+602
		End if 
	End if 
	If ($_l_AbsoluteLeft>0)
		$_l_WindowLeft:=$_l_AbsoluteLeft
	End if 
	$_l_Functionality:=0
	$_l_Functionality:=$_l_Functionality ?+ 4
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	
	If (Not:C34($_Obj_GetUser.functions ?? 3)) & (Not:C34($_Obj_GetUser.functions ?? 2))  //counteract Palettes being permanently off
		If ($_l_AbsoluteLeft=0)
			$_l_WindowLeft:=$_l_WindowLeft-55
			$_l_WindowRight:=$_l_WindowRight-55
		End if 
		If ($_Obj_GetUser.functions<2)
			$_l_WindowTop:=$_l_WindowTop-33
			$_l_WindowBottom:=$_l_WindowBottom-33
		End if 
	End if 
	$_l_LimitBottom:=$_l_WindowBottom
	$_l_LimitRight:=$_l_WindowRight
	$_l_LimitTop:=$_l_WindowTop
	SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
	
	$_l_ScreenHeight:=$_l_Windowbottom-$_l_WindowTop
	$_l_ScreenWIdth:=$_l_Windowright-$_l_Windowleft
	If (($_l_ScreenHeight>480) | ((Not:C34($_Obj_GetUser.functions ?? 2))))  //have room to go down if no Modules
		$_l_BottomLimit:=$_l_WindowBottom+(18*($_l_WindowRow-1))+5
		While ($_l_BottomLimit>$_l_ScreenHeight)
			
			$_l_FC:=0
			$_l_BottomLimit2:=$_l_BottomLimit
			While ($_l_BottomLimit2>$_l_ScreenHeight)
				IDLE:C311  // 7/04/03 pb
				$_l_FC:=$_l_FC+1
				$_l_BottomLimit2:=$_l_BottomLimit2-18
			End while 
			$_l_WindowRow:=$_l_FC
			$_l_BottomLimit:=$_l_LimitBottom+(18*($_l_WindowRow-1))+10
		End while 
		$_l_WindowRow:=Abs:C99($_l_WindowRow)
	End if 
	If ($_l_ScreenWIdth>622)
		$_l_BottomLimit:=$_l_WindowRight+(16*($_l_WindowRow-1))+5
		While ($_l_BottomLimit>$_l_ScreenWIdth)
			
			$_l_FC:=0
			$_l_BottomLimit2:=$_l_BottomLimit
			While ($_l_BottomLimit2>$_l_ScreenWIdth)
				
				$_l_FC:=$_l_FC+1
				$_l_BottomLimit2:=$_l_BottomLimit2-16
			End while 
			$_l_WindowRow:=$_l_FC
			$_l_BottomLimit:=$_l_LimitRight+(16*($_l_WindowRow-1))+10
		End while 
		$_l_WindowRow:=Abs:C99($_l_WindowRow)
	End if 
	
	//◊PRC_al_WindowReference
	$_bo_Bar:=($_Obj_GetUser.functions ?? 2)
	If (($_l_ScreenHeight>480) | (Not:C34($_bo_Bar)))
		$_l_WindowNumber:=1
		For ($_l_CountWindows; 1; Size of array:C274(<>WIN_al_WindowID))
			$_bo_DoNotCountWindow:=False:C215
			$_l_WindowReferenceRow:=Find in array:C230(<>PRC_al_WindowReference; <>WIN_al_WindowID{$_l_CountWindows})
			If ($_l_WindowReferenceRow<0)
				$_bo_DoNotCountWindow:=True:C214
			Else 
				If (<>PRC_al_ProcessState{$_l_WindowReferenceRow}<0)
					$_bo_DoNotCountWindow:=True:C214
				End if 
			End if 
			
			If ($_bo_DoNotCountWindow)
				<>WIN_al_WindowID{$_l_CountWindows}:=0
			End if 
			If (<>WIN_al_WindowID{$_l_CountWindows}>0)
				$_l_WindowNumber:=$_l_WindowNumber+1
			End if 
		End for 
		$_l_LimitTop:=$_l_LimitTop+(18*($_l_WindowNumber-1))
		$_l_LimitBottom:=$_l_LimitBottom+(18*($_l_WindowNumber-1))
	End if 
	If ($_l_AbsoluteLeft=0)
		$_l_WindowNumber:=1
		For ($_l_CountWindows; 1; Size of array:C274(<>WIN_al_WindowID))
			$_bo_DoNotCountWindow:=False:C215
			$_l_WindowReferenceRow:=Find in array:C230(<>PRC_al_WindowReference; <>WIN_al_WindowID{$_l_CountWindows})
			If ($_l_WindowReferenceRow<0)
				$_bo_DoNotCountWindow:=True:C214
			Else 
				If (<>PRC_al_ProcessState{$_l_WindowReferenceRow}<0)
					$_bo_DoNotCountWindow:=True:C214
				End if 
			End if 
			
			If ($_bo_DoNotCountWindow)
				<>WIN_al_WindowID{$_l_CountWindows}:=0
			End if 
			
			If (<>WIN_al_WindowID{$_l_CountWindows}>0)
				$_l_WindowNumber:=$_l_WindowNumber+1
			End if 
		End for 
		$_l_WindowLeft:=$_l_LimitLeft+(16*($_l_WindowNumber-1))
		$_l_WindowRight:=$_l_LimitRight+(16*($_l_WindowNumber-1))
	End if 
	
	$_l_WindowLeft:=$_l_WindowLeft+<>SYS_l_Windowx
	$_l_WindowRight:=$_l_WindowRight+<>SYS_l_Windowx
	$_l_WindowTop:=$_l_WindowTop+<>SYS_l_Windowy
	$_l_WindowBottom:=$_l_WindowBottom+<>SYS_l_Windowy
	$_l_WindowTop:=$_l_WindowTop+5
	If ($_l_ScreenNumber=1)
		$_l_DockP:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
	Else 
		$_l_DockLB:=0
		$_l_DockLR:=0
		$_l_DockLL:=0
	End if 
	If ($_l_WindowLeft<$_l_DockLL)
		$_l_WindowLeft:=$_l_DockLL+1
	End if 
	If (($_l_ScreenWIdth-$_l_DockLR)<$_l_WindowRight)
		$_l_WindowRight:=$_l_ScreenWIdth-$_l_DockLR
	End if 
	If (($_l_ScreenHeight-$_l_DockLB)<$_l_WindowBottom)
		$_l_WindowBottom:=$_l_ScreenHeight-($_l_DockLB+20)
	End if 
	If (Count parameters:C259<3)
		While (Semaphore:C143("$RecordingWindowReference"))
			DelayTicks(9)
		End while 
		$_l_WindowRow:=Find in array:C230(<>WIN_al_WindowID; 0)
		If ($_l_WindowRow<0)
			APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
			$_l_WindowRow:=Size of array:C274(<>WIN_al_WindowID)
		End if 
		$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
		WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		
		<>WIN_al_WindowID{$_l_WindowRow}:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; "Close_Process")
		APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
		APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; <>WIN_al_WindowID{$_l_WindowRow})
		
		WIN_l_CurrentWinRef:=<>WIN_al_WindowID{$_l_WindowRow}
		//$ProcRef:=Find in array(◊PRC_al_ProcessNum;Current process)
		//If ($ProcRef>0)
		//◊PRC_al_WindowReference{$ProcRef}:=◊aWPos{$_l_WindowRow}
		//End if
		
		PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_WindowRow})
		CLEAR SEMAPHORE:C144("$RecordingWindowReference")
	Else 
		If ($5#"")
			//HIDE PROCESS(Current process)
			$_l_Height:=0
			$_l_Width:=0
			//GET WINDOW RECT(PRC_l_WindowLeft;PRC_l_WindowTop;PRC_l_WindowRight;PRC_l_WindowBottom)
			PRC_l_WindowLeft:=$_l_WindowLeft
			PRC_l_WindowTop:=$_l_WindowTop
			PRC_l_WindowRight:=$_l_WindowRight
			PRC_l_WindowBottom:=$_l_WindowBottom
			//If (Count parameters>=7)
			$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
			WIN_GetFormSize($3; $4; $5; ->$_l_Height; ->$_l_Width; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If (($_l_WindowTop+$_l_Height)>($_l_ScreenHeight-($_l_DockLB+5)))
				$_l_Height:=($_l_ScreenHeight-($_l_DockLB+5))-$_l_WindowTop
			End if 
			If (($_l_WindowLeft+$_l_Width)>($_l_ScreenWIdth-80))
				//Screen width-80
				$_l_Width:=($_l_ScreenWIdth-80)-$_l_WindowLeft
			End if 
			//$_l_WindowID:=Open form window($4->; $5; $_l_WindowType; $_l_WindowLeft; $_l_WindowTop)
			//SET WINDOW TITLE($_t_WindowTitle; $_l_WindowID)
			
			If ($_l_Height=0) | ($_l_Width=0)
				If (Count parameters:C259>=6)
					If ($6#"")
						//SET WINDO
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; $6)
					Else 
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; "Close_Process")
					End if 
				Else 
					$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; "Close_Process")
				End if 
				While (Semaphore:C143("$RecordingWindowReference"))
					DelayTicks(1)
				End while 
				APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
				APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowID)
				
				
				WIN_l_CurrentWinRef:=$_l_WindowID
				$_l_WindowRow:=Find in array:C230(<>WIN_al_WindowID; 0)
				If ($_l_WindowRow<0)
					APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
					$_l_WindowRow:=Size of array:C274(<>WIN_al_WindowID)
				End if 
				<>WIN_al_WindowID{$_l_WindowRow}:=$_l_WindowID
				//$ProcRef:=Find in array(◊PRC_al_ProcessNum;Current process)
				//If ($ProcRef>0)
				//◊PRC_al_WindowReference{$ProcRef}:=◊aWPos{$_l_WindowRow}
				//End if
				PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_WindowRow})
				CLEAR SEMAPHORE:C144("$RecordingWindowReference")
				GET WINDOW RECT:C443(PRC_l_WindowLeft; PRC_l_WindowTop; PRC_l_WindowRight; PRC_l_WindowBottom)
				WIn_SetFormSize($3; $4; $5)
				BRING TO FRONT:C326(Current process:C322)
			Else 
				$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
				If (Count parameters:C259>=6)
					If ($6#"")
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$_l_Width; $_l_WindowTop+$_l_Height; $_l_WindowType; $_t_WindowTitle; $6)
					Else 
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$_l_Width; $_l_WindowTop+$_l_Height; $_l_WindowType; $_t_WindowTitle; "Close_Process")
					End if 
				Else 
					$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$_l_Width; $_l_WindowTop+$_l_Height; $_l_WindowType; $_t_WindowTitle; "Close_Process")
				End if 
				APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
				APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowID)
				WIN_l_CurrentWinRef:=$_l_WindowID
				While (Semaphore:C143("$RecordingWindowReference"))
					DelayTicks(1)
				End while 
				$_l_WindowRow:=Find in array:C230(<>WIN_al_WindowID; 0)
				If ($_l_WindowRow<0)
					APPEND TO ARRAY:C911(<>WIN_al_WindowID; $_l_WindowID)
					$_l_WindowRow:=Size of array:C274(<>WIN_al_WindowID)
				End if 
				<>WIN_al_WindowID{$_l_WindowRow}:=$_l_WindowID
				PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_WindowRow})
				
				CLEAR SEMAPHORE:C144("$RecordingWindowReference")
				
				BRING TO FRONT:C326(Current process:C322)
			End if 
			
		Else 
			
			While (Semaphore:C143("$RecordingWindowReference"))
				DelayTicks(1)
			End while 
			$_l_WindowRow:=Find in array:C230(<>WIN_al_WindowID; 0)
			If ($_l_WindowRow<0)
				APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
				$_l_WindowRow:=Size of array:C274(<>WIN_al_WindowID)
			End if 
			$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
			<>WIN_al_WindowID{$_l_WindowRow}:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; "Close_Process")
			APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
			APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; <>WIN_al_WindowID{$_l_WindowRow})
			WIN_l_CurrentWinRef:=<>WIN_al_WindowID{$_l_WindowRow}
			PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_WindowRow})
			CLEAR SEMAPHORE:C144("$RecordingWindowReference")
			
		End if 
		
	End if 
	
	
	
	//◊aWPos{$_l_WindowRow2}:=wt_Get ID
End if 
GET WINDOW RECT:C443(PRC_l_WindowLeft; PRC_l_WindowTop; PRC_l_WindowRight; PRC_l_WindowBottom)
ERR_MethodTrackerReturn("Open_Pro_Window"; $_t_oldMethodName)
