//%attributes = {}
If (False:C215)
	//Project Method Name:      Input_ButtonsWin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/01/2015 09:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; BUT_bo_Floating; DB_bo_FontsInited)
	C_LONGINT:C283(<>BAR; <>BUTTPROC; <>MENU_l_BarModule; <>MenuProc; <>PER_l_CurrentUserID; <>SYS_l_WindowTop; <>WIN_MINLEFT; <>WIN_MINTOP; $_l_CurrentWinRefOLD; $_l_DockLeft; $_l_Processor)
	C_LONGINT:C283($_l_ScreenNumber; $_l_System; $_l_TipsState; $_l_Windowbottom; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; $1; eBut_27x27; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TIME:C306(vTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Input_ButtonsWin")

//menu bar screen
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Not:C34(<>SYS_bo_QuitCalled))
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	$_l_TipsState:=Num:C11($_Obj_GetUser.functions ?? 7)
	//‘11999;31‘($_l_TipsState)
	Start_ProcCount("Buttons Palette")
	DB_MenuAction(Get localized string:C991("Menu_Volumes"); Get localized string:C991("MenuItem_FunctionsPalette"); 4; "18"; <>MenuProc; False:C215)
	If (Not:C34(DB_bo_FontsInited))
		DB_SetDefaultFonts
	End if 
	DB_t_CurrentFormUsage:=""
	vTime:=?00:00:00?
	$_l_ScreenNumber:=Menu bar screen:C441
	If ($_l_ScreenNumber=1)
		$_l_WindowTop:=<>SYS_l_WindowTop
	Else 
		SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
	End if 
	
	If (In_ButtSilver)
		
		// OPEN WINDOW(2;◊WindowTop;53;◊WindowTop+238;-3)
		If (Count parameters:C259=0)
			//<>WIN_MINLEFT:=64
			BUT_bo_Floating:=True:C214
			
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(0; $_l_WindowTop+34+15+8; 58; (3*15)+((29/2)*29)+$_l_WindowTop+15+8; -1984; ""; "Buttons_CLose")
		Else 
			<>WIN_MINLEFT:=0
			BUT_bo_Floating:=True:C214
			
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(0; <>SYS_l_WindowTop+34+20+8; 58; (3*15)+((29/2)*29)+<>SYS_l_WindowTop+8; $1; ""; "Buttons_CLose")
		End if 
		If (Current user:C182="Designer")
			DIALOG:C40([COMPANIES:2]; "WS_Buttons")
		Else 
			DIALOG:C40([COMPANIES:2]; "WS_Buttons")
		End if 
	Else 
		// OPEN WINDOW(2;◊WindowTop;53;◊WindowTop+316;-3)
		If (Count parameters:C259=0)
			<>WIN_MINLEFT:=64
			BUT_bo_Floating:=True:C214
			$_l_DockLeft:=INT_GetDock("L")
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_DockLeft; <>SYS_l_WindowTop+33+20; 78+$_l_DockLeft; <>SYS_l_WindowTop+(37*12)+17; -1984; ""; "Buttons_CLose")
			//Open window($_l_DockLeft;◊WindowTop+32+15;58+$_l_DockLeft;(3*15)+((29/2)*29)+◊WindowTop+15-10;-1984;"";"Buttons_CLose")
		Else 
			BUT_bo_Floating:=True:C214
			<>WIN_MINLEFT:=0
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_DockLeft; <>SYS_l_WindowTop+33+20; 78+$_l_DockLeft; <>SYS_l_WindowTop+(37*12)+17; $1; ""; "Buttons_CLose")
			//Open window($_l_DockLeft;◊WindowTop+32+20;60+$_l_DockLeft;(3*15)+((29/2)*29)+◊WindowTop;$1;"";"Buttons_CLose")
		End if 
		
		
		If (Current user:C182="Designer")
			DIALOG:C40([COMPANIES:2]; "WS_Buttons")
		Else 
			DIALOG:C40([COMPANIES:2]; "WS_Buttons")
		End if 
		
		
	End if 
	CLOSE WINDOW:C154
	If (Not:C34(<>SYS_bo_QuitCalled))
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (Not:C34(BUT_bo_Floating))
			<>ButtProc:=0
			If (Is Windows:C1573)  //needed to force it to turn the check off
				
				If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
					If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
						<>Bar:=0
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
						//EXECUTE FORMULA(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
						
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					End if 
				End if 
				
			Else 
				DB_MenuAction(Get localized string:C991("Menu_Volumes"); Get localized string:C991("MenuItem_FunctionsPalette"); 4; ""; <>MenuProc; False:C215)
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Input_ButtonsWin"; $_t_oldMethodName)
