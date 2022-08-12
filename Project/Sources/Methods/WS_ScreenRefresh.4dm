//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_ScreenRefresh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	C_LONGINT:C283(<>WIN_MINLEFT; <>WIN_MINTOP; $_l_CountProcesses; $_l_FrontmostIndex; $_l_FrontmostProcess; $_l_FrontmostRow; $_l_Shift; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_ScreenRefresh")
Repeat 
	$_l_CountProcesses:=Count user processes:C343
	$_l_FrontmostProcess:=Frontmost process:C327(*)
	For ($_l_FrontmostIndex; 1; $_l_CountProcesses)
		$_l_FrontmostRow:=Find in array:C230(<>PRC_al_ProcessNum; $_l_FrontmostIndex)
		If ($_l_FrontmostRow>0)
			If (<>PRC_al_WindowReference{$_l_FrontmostRow}>0)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; <>PRC_al_WindowReference{$_l_FrontmostRow})
				If ($_l_WindowLeft<<>WIN_MINLEFT)
					$_l_Shift:=<>WIN_MINLEFT-$_l_WindowLeft
					SET WINDOW RECT:C444(<>WIN_MINLEFT+2; $_l_WindowTop; $_l_WindowRight+$_l_Shift; $_l_WindowBottom; <>PRC_al_WindowReference{$_l_FrontmostRow})
				End if 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; <>PRC_al_WindowReference{$_l_FrontmostRow})
				If ($_l_WindowTop<<>WIN_MINTOP)
					SET WINDOW RECT:C444($_l_WindowLeft; <>WIN_MINTOP+2; $_l_WindowRight; $_l_WindowBottom; <>PRC_al_WindowReference{$_l_FrontmostRow})
				End if 
			End if 
		End if 
		DelayTicks(60)
	End for 
	DelayTicks(600)
Until (False:C215)
ERR_MethodTrackerReturn("WS_ScreenRefresh"; $_t_oldMethodName)
