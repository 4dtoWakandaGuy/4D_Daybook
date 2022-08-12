//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(BAR_at_FunctionParamter;0)
	//ARRAY TEXT(BAT_at_MenuFunctions;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(<>MenuFront; $_Bo_Origin; $_bo_ProcessVisible; DB_bo_NoLoad; MENU_bo_Overwrite; Proc_bo_IgnoreCalledBy)
	C_LONGINT:C283(<>Bar; <>MENU_l_BarModule; <>MenuProc; <>ModulePalBot; <>ModulePalLeft; <>ModulePalRight; <>ModulePalTop; <>SYS_l_WindowTop; <>WIN_MINTOP; $_l_ButtonNumber; $_l_event)
	C_LONGINT:C283($_l_FrontmostProcess; $_l_ModuleProc; $_l_ModuleRow; $_l_PopupItemSelected; $_l_Process; $_l_ProcessOrigin; $_l_processState; $_l_ProcessTime; $_l_Retries; $_l_ScreenNumber; $_l_SizeofArray)
	C_LONGINT:C283($_l_TopAllowance; $_l_UniqueProcessID; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_windowRight; $_l_windowTop; BAR_l_PopUpID; DB_l_ButtonClickedFunction; Mod_l_MenuBarPaletteProcess; ModuleNumber)
	C_LONGINT:C283(SIZ_l_BARBOT; SIZ_l_BARBottom; SIZ_l_BARLEFT; SIZ_l_BARRIGHT; SIZ_l_BARTop; vSNo)
	C_PICTURE:C286(BAR_Pic_Logo)
	C_TEXT:C284(<>LOGIN_s255_FirstModuleName; $_t_ExecuteMethodName; $_t_Function; $_t_FunctionParameter; $_t_MenuRef; $_t_ModuleName; $_t_oldMethodName; $_t_ProcessName; $_Txt_CurrentMenu; BAR_t_Button; TB_t_Help1)
	C_TEXT:C284(TB_t_Help10; TB_t_Help11; TB_t_Help12; TB_t_Help13; TB_t_Help14; TB_t_Help15; TB_t_Help16; TB_t_Help17; TB_t_Help18; TB_t_Help19; TB_t_Help2)
	C_TEXT:C284(TB_t_Help20; TB_t_Help21; TB_t_Help22; TB_t_Help23; TB_t_Help3; TB_t_Help4; TB_t_Help5; TB_t_Help6; TB_t_Help7; TB_t_Help8; TB_t_Help9)
	C_TEXT:C284(vProblem; VSolution)
	C_TIME:C306(vTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].WS_TOOLBAR"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		$_l_FrontmostProcess:=Frontmost process:C327(*)
		$_t_ProcessName:=Process_Name($_l_FrontmostProcess)
		If (False:C215)
			If (Position:C15("custom"; $_t_ProcessName)>0)
				//If (vTime<=Current time-)  `(vTime+†00:00:01†)
				//$_l_Process:=ZScrnSav_Proc
				//Else
				BRING TO FRONT:C326(<>MenuProc)
				<>MenuFront:=True:C214
				Gen_SetModCol
				
				$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; VSolution)
				If ($_l_ModuleRow>0)
					<>Bar:=0
					Menu_ModBarButt($_l_ModuleRow+1)
				End if 
				vTime:=Current time:C178
			End if 
		End if 
		$_l_ScreenNumber:=Menu bar screen:C441
		If ($_l_ScreenNumber=1)
			$_l_WindowTop:=<>SYS_l_WindowTop
		Else 
			SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
		End if 
		
		GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
		If (SIZ_l_BARTop#($_l_WindowTop+1)) & (SIZ_l_BARTop#($_l_WindowTop))
			//SET WINDOW RECT(SIZ_l_BARLEFT;$_l_WindowTop+1;SIZ_l_BARRIGHT;$_l_WindowTop+1+33)
		End if 
		//SET TIMER(0)
		PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_processState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
		If ($_bo_ProcessVisible)
			$_Txt_CurrentMenu:=Get menu bar reference:C979(1)
			BRING TO FRONT:C326(Current process:C322)
			///Hide splash screen
			$_l_TopAllowance:=Menu bar height:C440
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_windowRight; $_l_WindowBottom)
			$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
			$_l_TopAllowance:=Menu bar height:C440
			If ($_l_TopAllowance>0)
				$_l_TopAllowance:=$_l_TopAllowance+14
			End if 
			If ($_l_TopAllowance#$_l_windowTop)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_TopAllowance; $_l_windowRight; ($_l_TopAllowance+$_l_WindowHeight))
				
			End if 
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//ALERT("Form Method WS_TOOLBAR, On Load 1")
		DELAY PROCESS:C323(Current process:C322; 60)
		
		//SET TIMER(180)
		ARRAY LONGINT:C221(MOD_al_ModuleBarOffsets; 0)
		ARRAY TEXT:C222(BAT_at_MenuFunctions; 0)
		ARRAY TEXT:C222(BAR_at_FunctionParamter; 0)
		
		//OpenHelp (Table(->[COMPANIES]);"WS_TOOLBAR")
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; <>WIN_MINTOP)
		//ALERT("Form Method WS_TOOLBAR, On Load 2")
		
		DB_SetMenuBar(""; <>Bar; <>MenuProc)
		//ALERT("Form Method WS_TOOLBAR, On Load 3")
		
		GEN_GetModules
		//ALERT("Form Method WS_TOOLBAR, On Load 4")
		
		//for this window only
		//add in the other items
		
		$_l_SizeofArray:=Size of array:C274(GEN_at_ContextualMenuItemFunt)
		INSERT IN ARRAY:C227(GEN_at_ContextualMenuItems; Size of array:C274(GEN_at_ContextualMenuItems)+1; 6)
		INSERT IN ARRAY:C227(GEN_at_ContextualMenuItemFunt; Size of array:C274(GEN_at_ContextualMenuItems)+1; 6)
		GEN_at_ContextualMenuItems{$_l_SizeofArray+1}:="-"
		//GEN_at_ContextualMenuItems{$_l_SizeofArray+2}:="Functions Palette"
		//GEN_at_ContextualMenuItemFunt{$_l_SizeofArray+2}:="In_ButtProc"
		GEN_at_ContextualMenuItems{$_l_SizeofArray+3}:="Volumes Palette"
		GEN_at_ContextualMenuItemFunt{$_l_SizeofArray+3}:="ZMenu_ModBar2"
		GEN_at_ContextualMenuItems{$_l_SizeofArray+4}:="Macros Palette"
		GEN_at_ContextualMenuItemFunt{$_l_SizeofArray+4}:="SCPT_LaunchPalette"
		//GEN_at_ContextualMenuItems{$_l_SizeofArray+5}:="Data Lists Palette"
		//GEN_at_ContextualMenuItemFunt{$_l_SizeofArray+5}:="Gen_ListSet"
		//GEN_at_ContextualMenuItems{$_l_SizeofArray+6}:="Processes Palette"`bsw 17/08/04
		//GEN_at_ContextualMenuItems{$_l_SizeofArray+6}:="Windows Palette"
		//GEN_at_ContextualMenuItemFunt{$_l_SizeofArray+6}:="ProcessesP "
		
		vProblem:=""  //Rollo 7/22/2004 - just used as a blank colour area
		//ALERT("Form Method WS_TOOLBAR, On Load 5")
		
		WS_GETBARBUTTONS
		//ALERT("Form Method WS_TOOLBAR, On Load 6")
		
		SET WINDOW TITLE:C213(Vsolution)
		$_t_ModuleName:=Vsolution
		Repeat 
			$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; $_t_ModuleName)
			If ($_l_ModuleRow<0)
				$_t_ModuleName:=Substring:C12($_t_ModuleName; 1; Length:C16($_t_ModuleName)-1)
			End if 
			DelayTicks(2)
		Until ($_l_ModuleRow>0) | ($_t_ModuleName="")
		
		MENU_bo_Overwrite:=True:C214
		//ALERT("Form Method WS_TOOLBAR, On Load 7")
		
		If ($_l_ModuleRow>0)
			//◊Bar:=0
			//ALERT("Form Method WS_TOOLBAR, On Load 8")
			
			Menu_ModBarButt($_l_ModuleRow+1)
			//ALERT("Form Method WS_TOOLBAR, On Load 9")
			
		Else 
			//ALERT("Form Method WS_TOOLBAR, On Load 10")
			
			If (<>LOGIN_s255_FirstModuleName#"")
				$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; <>LOGIN_s255_FirstModuleName)
				If ($_l_ModuleRow>0)
					//ALERT("Form Method WS_TOOLBAR, On Load 11")
					
					Menu_ModBarButt($_l_ModuleRow+1)
				Else 
					//ALERT("Form Method WS_TOOLBAR, On Load 12")
					//
					Menu_ModBarButt(2)
				End if 
			Else 
				//ALERT("Form Method WS_TOOLBAR, On Load 13")
				
				Menu_ModBarButt(2)
			End if 
		End if 
		//ALERT("Form Method WS_TOOLBAR, On Load 14")
		SET TIMER:C645(30)
	: ($_l_event=On Outside Call:K2:11)
		If (DB_l_ButtonClickedFunction>0)
			$_l_PopupItemSelected:=BAR_l_PopUpID
			If ($_l_PopupItemSelected<=Size of array:C274(BAT_at_MenuFunctions))
				Proc_bo_IgnoreCalledBy:=True:C214
				$_t_Function:=BAT_at_MenuFunctions{$_l_PopupItemSelected}
				$_t_FunctionParameter:=BAR_at_FunctionParamter{$_l_PopupItemSelected}
				If ($_t_Function#"")
					If ($_t_Function[[1]]="*")
						//Run in a process
						$_t_Function:=Substring:C12($_t_Function; 2)
						If ($_t_FunctionParameter#"")
							$_l_Process:=New process:C317($_t_Function; 64000; "Menu_Process"+$_t_Function; $_t_FunctionParameter)
						Else 
							$_l_Process:=New process:C317($_t_Function; 64000; "Menu_Process"+$_t_Function)
						End if 
					Else 
						If ($_t_FunctionParameter#"")
							//EXECUTE FORMULA($_t_Function+"("+Char(34)+$_t_FunctionParameter+Char(34)+")")
							$_t_ExecuteMethodName:=$_t_Function
							EXECUTE METHOD:C1007($_t_Function; *; $_t_FunctionParameter)
						Else 
							//EXECUTE FORMULA($_t_Function)
							$_t_ExecuteMethodName:=$_t_Function
							EXECUTE METHOD:C1007($_t_Function; *; $_t_FunctionParameter)
						End if 
					End if 
				End if 
				Proc_bo_IgnoreCalledBy:=False:C215
			End if 
			DB_l_ButtonClickedFunction:=0
		Else 
			If (Mod_l_MenuBarPaletteProcess=0)
				CANCEL:C270
			Else 
				Gen_SetModCol
				
				If (<>MENU_l_BarModule#vSNo)  //If called from a Menu proc, this will be true
					$_l_Retries:=0
					While (Semaphore:C143("$BarMod"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks($_l_Retries*2)
					End while 
					$_l_ModuleRow:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
					If ($_l_ModuleRow>0)
						If (Picture size:C356(BAR_Pic_Logo)>0)
							vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$_l_ModuleRow}); 2); 2)
						Else 
							vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$_l_ModuleRow}); 2); 2)+Char:C90(13)+DB_GetOrganisationScreenName
						End if 
						
						vSNo:=<>MENU_l_BarModule
					Else 
						vSNo:=0
						If (Picture size:C356(BAR_Pic_Logo)>0)
							vSolution:=Uppers2(Uppers3(Lowercase:C14(<>MOD_at_ModuleName{<>MENU_l_BarModule}); 2); 2)
						Else 
							vSolution:=Uppers2(Uppers3(Lowercase:C14(<>MOD_at_ModuleName{<>MENU_l_BarModule}); 2); 2)+Char:C90(13)+DB_GetOrganisationScreenName
						End if 
						
						//Set it to the basic Module name
						// - only used by Silver users with Gold Modules
					End if 
					CLEAR SEMAPHORE:C144("$BarMod")
				End if 
				
			End if 
			SET WINDOW TITLE:C213(Vsolution)
		End if 
		$_l_ScreenNumber:=Menu bar screen:C441
		If ($_l_ScreenNumber=1)
			$_l_WindowTop:=<>SYS_l_WindowTop
		Else 
			SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
		End if 
		GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
		If (SIZ_l_BARTop#($_l_WindowTop+1)) & (SIZ_l_BARTop#($_l_WindowTop))
			SET WINDOW RECT:C444(SIZ_l_BARLEFT; $_l_WindowTop+1; SIZ_l_BARRIGHT; $_l_WindowTop+1+33)
		End if 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		//TRACE
		If (BAR_t_Button#"")
			$_l_ButtonNumber:=Num:C11(BAR_t_Button)
			
			If (($_l_ButtonNumber-1)<=Size of array:C274(MOD_al_ModuleBarOffsets))
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(<>MOD_al_ModuleBarNum; MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1})
					
					Menu_ModBarButt($_l_ModuleRow+1)
					//Menu_ModBarButt ($_l_ModuleRow+1;Current process)
				End if 
			End if 
		End if 
		SET WINDOW TITLE:C213(Vsolution)
		BAR_t_Button:=""
		$_l_ScreenNumber:=Menu bar screen:C441
		If ($_l_ScreenNumber=1)
			$_l_WindowTop:=<>SYS_l_WindowTop
		Else 
			SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
		End if 
		GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
		If (SIZ_l_BARTop#($_l_WindowTop+1)) & (SIZ_l_BARTop#($_l_WindowTop))
			SET WINDOW RECT:C444(SIZ_l_BARLEFT; $_l_WindowTop+1; SIZ_l_BARRIGHT; $_l_WindowTop+1+33)
		End if 
		
		
		SET TIMER:C645(180)
	: ($_l_event=On Resize:K2:27)
		SET WINDOW RECT:C444(SIZ_l_BARLEFT; SIZ_l_BARTOP; SIZ_l_BARRIGHT; SIZ_l_BARBOT)
		
End case 
GET WINDOW RECT:C443(<>ModulePalLeft; <>ModulePalTop; <>ModulePalRight; <>ModulePalBot)
GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTOP; SIZ_l_BARRIGHT; SIZ_l_BARBOT)
ERR_MethodTrackerReturn("FM:WS_TOOLBAR"; $_t_oldMethodName)
