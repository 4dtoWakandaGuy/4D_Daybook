//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Flo_Window
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
	//ARRAY LONGINT(<>WIN_al_WindowID;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>ProWindowInit; $_bo_bar; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>SYS_l_WindowTop; <>SYS_l_Windowx; <>SYS_l_Windowy; <>WIN_MINLEFT; $_l_AbsoluteLeft; $_l_CountWindows; $_l_DockLB; $_l_DockLL; $_l_DockLR; $_l_DockP)
	C_LONGINT:C283($_l_EmptyIDPosition; $_l_EmptyRow; $_l_Fc; $_l_Functionality; $_l_Height; $_l_Limit; $_l_Limit2; $_l_NewLeft; $_l_ScreenHeight; $_l_ScreenWIdth; $_l_Width)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowID; $_l_WindowLeft; $_l_WindowNumber; $_l_WindowRight; $_l_WindowTop; $_l_WindowType; $2; $3; $7; $f2)
	C_LONGINT:C283(PRC_l_WindowBottom; PRC_l_WindowLeft; PRC_l_WindowRight; PRC_l_WindowTop; vProc; WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_Obj_GetUser)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $5; $6)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Open_Flo_Window")
//Open_Pro_Window
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
	PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$f2})
	$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
	
	$_l_EmptyRow:=$_l_EmptyIDPosition
	PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_EmptyRow})
	$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
	
	If (Is Windows:C1573)
		$_l_WindowTop:=<>SYS_l_WindowTop+54
		$_l_WindowBottom:=<>SYS_l_WindowTop+426
		$_l_WindowLeft:=<>WIN_MINLEFT+2
		$_l_WindowRight:=604
	Else 
		$_l_WindowTop:=<>SYS_l_WindowTop+53
		$_l_WindowBottom:=<>SYS_l_WindowTop+423
		$_l_WindowLeft:=<>WIN_MINLEFT+1
		$_l_WindowRight:=602
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
	
	$_l_ScreenHeight:=Screen height:C188
	$_l_ScreenWIdth:=Screen width:C187
	If (($_l_ScreenHeight>480) | ((Not:C34($_Obj_GetUser.functions ?? 2))))  //have room to go down if no Modules
		$_l_Limit:=$_l_WindowBottom+(18*($_l_EmptyIDPosition-1))+5
		While ($_l_Limit>$_l_ScreenHeight)
			
			$_l_Fc:=0
			$_l_Limit2:=$_l_Limit
			While ($_l_Limit2>$_l_ScreenHeight)
				IDLE:C311  // 7/04/03 pb
				$_l_Fc:=$_l_Fc+1
				$_l_Limit2:=$_l_Limit2-18
			End while 
			$_l_EmptyIDPosition:=$_l_Fc
			$_l_Limit:=$_l_WindowBottom+(18*($_l_EmptyIDPosition-1))+10
		End while 
		$_l_EmptyIDPosition:=Abs:C99($_l_EmptyIDPosition)
	End if 
	If ($_l_ScreenWIdth>622)
		$_l_Limit:=$_l_WindowRight+(16*($_l_EmptyIDPosition-1))+5
		While ($_l_Limit>$_l_ScreenWIdth)
			
			$_l_Fc:=0
			$_l_Limit2:=$_l_Limit
			While ($_l_Limit2>$_l_ScreenWIdth)
				
				$_l_Fc:=$_l_Fc+1
				$_l_Limit2:=$_l_Limit2-16
			End while 
			$_l_EmptyIDPosition:=$_l_Fc
			$_l_Limit:=$_l_WindowRight+(16*($_l_EmptyIDPosition-1))+10
		End while 
		$_l_EmptyIDPosition:=Abs:C99($_l_EmptyIDPosition)
	End if 
	$_bo_bar:=($_Obj_GetUser.functions ?? 2)
	If (($_l_ScreenHeight>480) | (Not:C34($_bo_bar)))
		$_l_WindowNumber:=1
		For ($_l_CountWindows; 1; Size of array:C274(<>WIN_al_WindowID))
			If (<>WIN_al_WindowID{$_l_CountWindows}>0)
				$_l_WindowNumber:=$_l_WindowNumber+1
			End if 
		End for 
		$_l_WindowTop:=$_l_WindowTop+(18*($_l_WindowNumber-1))
		$_l_WindowBottom:=$_l_WindowBottom+(18*($_l_WindowNumber-1))
	End if 
	If ($_l_AbsoluteLeft=0)
		$_l_WindowNumber:=1
		For ($_l_CountWindows; 1; Size of array:C274(<>WIN_al_WindowID))
			If (<>WIN_al_WindowID{$_l_CountWindows}>0)
				$_l_WindowNumber:=$_l_WindowNumber+1
			End if 
		End for 
		$_l_WindowLeft:=$_l_WindowLeft+(16*($_l_WindowNumber-1))
		$_l_WindowRight:=$_l_WindowRight+(16*($_l_WindowNumber-1))
	End if 
	
	$_l_WindowLeft:=$_l_WindowLeft+<>SYS_l_Windowx
	$_l_WindowRight:=$_l_WindowRight+<>SYS_l_Windowx
	$_l_WindowTop:=$_l_WindowTop+<>SYS_l_Windowy
	$_l_WindowBottom:=$_l_WindowBottom+<>SYS_l_Windowy
	$_l_WindowTop:=$_l_WindowTop+5
	
	$_l_DockP:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
	
	If ($_l_WindowLeft<$_l_DockLL)
		$_l_WindowLeft:=$_l_DockLL+1
	End if 
	If ((Screen width:C187-$_l_DockLR)<$_l_WindowRight)
		$_l_WindowRight:=Screen width:C187-$_l_DockLR
	End if 
	If ((Screen height:C188-$_l_DockLB)<$_l_WindowBottom)
		$_l_WindowBottom:=Screen height:C188-$_l_DockLB
	End if 
	If (Count parameters:C259<3)
		While (Semaphore:C143("$RecordingWindowReference"))
			DelayTicks(1)
		End while 
		$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
		If ($_l_EmptyIDPosition<0)
			APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
			$_l_EmptyIDPosition:=Size of array:C274(<>WIN_al_WindowID)
		End if 
		<>WIN_al_WindowID{$_l_EmptyIDPosition}:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $1; "Close_Process")
		APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
		APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; <>WIN_al_WindowID{$_l_EmptyIDPosition})
		WIN_l_CurrentWinRef:=<>WIN_al_WindowID{$_l_EmptyIDPosition}
		PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_EmptyIDPosition})
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
			
			WIN_GetFormSize($3; $4; $5; ->$_l_Height; ->$_l_Width; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			If ($_l_Height=0) | ($_l_Width=0)
				If (Count parameters:C259>=6)
					If ($6#"")
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $1; $6)
					Else 
						$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $1; "Close_Process")
					End if 
				Else 
					$_l_WindowID:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $1; "Close_Process")
				End if 
				APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
				APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowID)
				While (Semaphore:C143("$RecordingWindowReference"))
					DelayTicks(1)
				End while 
				$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
				If ($_l_EmptyIDPosition<0)
					APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
					$_l_EmptyIDPosition:=Size of array:C274(<>WIN_al_WindowID)
				End if 
				<>WIN_al_WindowID{$_l_EmptyIDPosition}:=$_l_WindowID
				PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_EmptyIDPosition})
				
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
				While (Semaphore:C143("$RecordingWindowReference"))
					DelayTicks(1)
				End while 
				$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
				If ($_l_EmptyIDPosition<0)
					APPEND TO ARRAY:C911(<>WIN_al_WindowID; $_l_WindowID)
					$_l_EmptyIDPosition:=Size of array:C274(<>WIN_al_WindowID)
				End if 
				<>WIN_al_WindowID{$_l_EmptyIDPosition}:=$_l_WindowID
				PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_EmptyIDPosition})
				
				CLEAR SEMAPHORE:C144("$RecordingWindowReference")
				
				BRING TO FRONT:C326(Current process:C322)
			End if 
			
		Else 
			
			While (Semaphore:C143("$RecordingWindowReference"))
				DelayTicks(1)
			End while 
			$_l_EmptyIDPosition:=Find in array:C230(<>WIN_al_WindowID; 0)
			If ($_l_EmptyIDPosition<0)
				APPEND TO ARRAY:C911(<>WIN_al_WindowID; 1)
				$_l_EmptyIDPosition:=Size of array:C274(<>WIN_al_WindowID)
			End if 
			$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
			<>WIN_al_WindowID{$_l_EmptyIDPosition}:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; $_l_WindowType; $_t_WindowTitle; "Close_Process")
			APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
			APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; <>WIN_al_WindowID{$_l_EmptyIDPosition})
			PROC_SetProcess(Current process:C322; <>WIN_al_WindowID{$_l_EmptyIDPosition})
			CLEAR SEMAPHORE:C144("$RecordingWindowReference")
			
		End if 
		
	End if 
	
	
	
	//◊aWPos{$f2}:=wt_Get ID
End if 
GET WINDOW RECT:C443(PRC_l_WindowLeft; PRC_l_WindowTop; PRC_l_WindowRight; PRC_l_WindowBottom)
ERR_MethodTrackerReturn("Open_Flo_Window"; $_t_oldMethodName)
