//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SetnewToolBar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(MOD_aI_ModuleShowIcon;0)
	//ARRAY LONGINT(<>Mod_al_ModuleOrder;0)
	ARRAY LONGINT:C221($_al_ModuleSort; 0)
	//ARRAY LONGINT(MOD_al_BarButtons;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	ARRAY TEXT:C222($_at_BarHelp; 0)
	//ARRAY TEXT(BAT_at_MenuFunctions;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(Mod_at_ToolTips;0)
	C_BOOLEAN:C305($_bo_VisibleButtons; $2; DB_bo_FontsInited; DB_bo_HideModuleBar; DB_bo_ModuleSettingsinited; DB_bo_ModulesSet; DB_bo_NoPallettes)
	C_LONGINT:C283(<>ButtProc; <>Mod_l_MaxModules; <>WIN_MINTOP; $_l_Bar21Position; $_l_BarModuleNum; $_l_BarProcess; $_l_ButtonCount; $_l_ButtonNumber; $_l_CharacterPosition; $_l_CurrentButton; $_l_Flags)
	C_LONGINT:C283($_l_GraphicsWidth; $_l_Index; $_l_LeftPosition; $_l_ModuleBarRow; $_l_ModuleNumber; $_l_NarrowButtonCount; $_l_NarrowButtons; $_l_NarrowButtonWidth; $_l_NavButtonsSpace; $_l_NumberofModules; $_l_PictureReference)
	C_LONGINT:C283($_l_ShowIcon; $_l_TotalVisibleButtons; $0; $1; BarMod; DB_l_WindowCurrentModule; SIZ_l_BARBottom; SIZ_l_BARLEFT; SIZ_l_BARRIGHT; SIZ_l_BARTop)
	C_PICTURE:C286(<>DB_Pic_CoLogo; <>PictIconPal; $_pic_Picture; BAR_Pic_Logo)
	C_POINTER:C301($_ptr_Help; $_ptr_Helppic)
	C_TEXT:C284(<>LOGIN_s255_FirstModuleName; $_t_Before; $_t_ButtonName; $_t_LowercaseModuleName; $_t_ModuleName; $_t_MoveObjectName; $_t_ObjectName; $_t_oldMethodName; $_t_PictureID; $_t_VariableName; PopUpMenu1)
	C_TIME:C306(vTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetnewToolBar")

If (Not:C34(DB_bo_ModuleSettingsinited))
	Check_Modules
	DB_bo_ModuleSettingsinited:=True:C214
End if 
If (Count parameters:C259>=1)
	$_l_NavButtonsSpace:=$1+1
End if 
If (Count parameters:C259>=2)  //Use this to hide the buttons
	$_bo_VisibleButtons:=$2
Else 
	$_bo_VisibleButtons:=True:C214
End if 
If (Not:C34(DB_bo_ModulesSet))
	ARRAY LONGINT:C221(MOD_al_ModuleBarOffsets; 0)
	ARRAY TEXT:C222(BAT_at_MenuFunctions; 0)
	GEN_GetModules
	
	$_l_NumberofModules:=Size of array:C274(GEN_at_ContextualMenuItemFunt)
	
	INSERT IN ARRAY:C227(GEN_at_ContextualMenuItems; Size of array:C274(GEN_at_ContextualMenuItems)+1; 6)
	INSERT IN ARRAY:C227(GEN_at_ContextualMenuItemFunt; Size of array:C274(GEN_at_ContextualMenuItems)+1; 6)
	GEN_at_ContextualMenuItems{$_l_NumberofModules+1}:="-"
	GEN_at_ContextualMenuItems{$_l_NumberofModules+2}:=Get localized string:C991("MenuItem_FunctionsPalette")
	GEN_at_ContextualMenuItemFunt{$_l_NumberofModules+2}:="In_ButtProc"
	GEN_at_ContextualMenuItems{$_l_NumberofModules+3}:=Get localized string:C991("MenuItem_VolumesPalette")
	GEN_at_ContextualMenuItemFunt{$_l_NumberofModules+3}:="ZMenu_ModBar2"
	GEN_at_ContextualMenuItems{$_l_NumberofModules+4}:=Get localized string:C991("MenuItem_MacrosPalette")
	GEN_at_ContextualMenuItemFunt{$_l_NumberofModules+4}:="SCPT_LaunchPalette"
	//GEN_at_ContextualMenuItems{$_l_NumberofModules+5}:=Get localized string("MenuItem_DatListsPal")
	//GEN_at_ContextualMenuItemFunt{$_l_NumberofModules+5}:="Gen_ListSet"
	//GEN_at_ContextualMenuItems{$_l_NumberofModules+6}:="Processes Palette"`bsw 17/08/04
	//GEN_at_ContextualMenuItems{$_l_NumberofModules+6}:=Get localized string("MenuItem_WindowsPalette")
	
	//GEN_at_ContextualMenuItemFunt{$_l_NumberofModules+6}:="ProcessesP "
	
	
	//````
	ARRAY LONGINT:C221(MOD_al_ModuleBarNum; 50)
	ARRAY TEXT:C222(Mod_at_ToolTips; 50)
	DB_l_WindowCurrentModule:=0  //the var used to store the current Module No clicked
	vTime:=?00:00:00?
	ARRAY LONGINT:C221($_al_ModuleSort; 50)
	$_l_NumberofModules:=0
	If (<>Mod_l_MaxModules=0)
		GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	End if 
	
	For ($_l_Index; 1; <>Mod_l_MaxModules)
		If ((DB_GetModuleSettingByNUM($_l_Index))>1)  //If the Module is available
			If (<>Mod_al_ModuleOrder{$_l_Index}#0)  //If it is a Module with a Menu Bar
				If ($_l_Index<=Size of array:C274(<>Mod_al_ModuleOrder))
					If (($_l_Index=32) | ($_l_Index=Module_IntServer))
						//An exception for Telephony so that it doesn't repeat
						$_l_Bar21Position:=Find in array:C230(MOD_al_ModuleBarNum; 21)
						If ($_l_Bar21Position<1)
							$_l_NumberofModules:=$_l_NumberofModules+1
							MOD_al_ModuleBarNum{$_l_NumberofModules}:=$_l_Index
							$_al_ModuleSort{$_l_NumberofModules}:=<>Mod_al_ModuleOrder{$_l_Index}
							Mod_at_ToolTips{$_l_NumberofModules}:=<>Mod_at_ModuleName{MOD_al_ModuleBarNum{$_l_NumberofModules}}
						End if 
					Else 
						$_l_NumberofModules:=$_l_NumberofModules+1
						MOD_al_ModuleBarNum{$_l_NumberofModules}:=$_l_Index
						$_al_ModuleSort{$_l_NumberofModules}:=<>Mod_al_ModuleOrder{$_l_Index}
						Mod_at_ToolTips{$_l_NumberofModules}:=<>Mod_at_ModuleName{MOD_al_ModuleBarNum{$_l_NumberofModules}}
					End if 
				End if 
			End if 
		End if 
	End for 
	ARRAY LONGINT:C221(MOD_al_ModuleBarNum; $_l_NumberofModules)
	ARRAY LONGINT:C221($_al_ModuleSort; $_l_NumberofModules)
	ARRAY TEXT:C222(Mod_at_ToolTips; $_l_NumberofModules)
	SORT ARRAY:C229($_al_ModuleSort; MOD_al_ModuleBarNum; Mod_at_ToolTips; >)
	
	CLEAR SEMAPHORE:C144("$BarMod")
	$_l_Index:=Screen width:C187-30
	//$f:=199+(31*$_l_NumberofModules)
	///While ($f>$_l_Index)
	//$f:=$f-31
	//End while 
	<>WIN_MINTOP:=0
	If (Not:C34(DB_bo_FontsInited))
		DB_SetDefaultFonts
	End if 
	
	//```
	//Menu_ModBarLPBT - see also Menu_ModBarLPB
	ARRAY LONGINT:C221(MOD_al_ModuleBarOffsets; 0)
	
	//C_POINTER($_ptr_Help)
	//FONT SIZE(vSolution;9)
	If (Picture size:C356(<>DB_Pic_CoLogo)>0)
		BAR_Pic_Logo:=<>DB_Pic_CoLogo
	Else 
		If (DB_GetOrganisationScreenName#"")
			OBJECT SET VISIBLE:C603(BAR_Pic_Logo; False:C215)
		Else 
			//GET PICTURE FROM LIBRARY(15513; BAR_Pic_Logo)
			BAR_Pic_Logo:=Get_Picture(15513)
		End if 
	End if 
	
	ARRAY LONGINT:C221(MOD_al_BarButtons; 50)
	ARRAY TEXT:C222($_at_BarHelp; 50)
	
	
	If (Is Windows:C1573)
		$_l_PictureReference:=19800
		//GET PICTURE FROM LIBRARY(19798; <>PictIconPal)  //db on 
		<>PictIconPal:=Get_Picture(19798)
		OBJECT SET VISIBLE:C603(*; "oOSXShade"; False:C215)
	Else 
		$_l_PictureReference:=19800
		//GET PICTURE FROM LIBRARY(19799; <>PictIconPal)  //db OS X
		<>PictIconPal:=Get_Picture(19799)
		OBJECT SET VISIBLE:C603(*; "oWINShade"; False:C215)
		
	End if 
	$_l_CurrentButton:=2
	While (Semaphore:C143("$BarMod"))
		DelayTicks
	End while 
	$_l_NumberofModules:=Size of array:C274(MOD_al_ModuleBarNum)
	ARRAY TEXT:C222(MOD_at_ModuleName; $_l_NumberofModules)
	DB_bo_ModulesSet:=True:C214
	
	
	//the above array contains the 'module' number assigned to the button
	//remember this is only set up at startup
	//unlike the tool bar which is dynamic
	///TRACE
	For ($_l_Index; 1; $_l_NumberofModules)
		$_l_ModuleNumber:=MOD_al_ModuleBarNum{$_l_Index}
		$_l_ShowIcon:=MOD_aI_ModuleShowIcon{$_l_ModuleNumber}
		If (MOD_al_ModuleBarNum{$_l_Index}#30)
			If ($_l_ShowIcon=1)
				APPEND TO ARRAY:C911(MOD_al_ModuleBarOffsets; MOD_al_ModuleBarNum{$_l_Index})
				Case of 
					: ((MOD_al_ModuleBarNum{$_l_Index}=12))  //Agency
						
					: ((MOD_al_ModuleBarNum{$_l_Index}=32) | (MOD_al_ModuleBarNum{$_l_Index}=43))  //Telephony & Internet = Remote Access
						
					Else 
						$_ptr_Helppic:=Get pointer:C304("WS_pic_Button"+String:C10($_l_CurrentButton))
						
						$_ptr_Helppic->:=Get_Picture(Menu_ModChkIcon($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index}))
						$_t_VariableName:="WS_pic_Button"+String:C10($_l_CurrentButton)
						$_pic_Picture:=Get_Picture(Menu_ModChkIcon($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index}))
						$_t_PictureID:="1;4;"+$_t_VariableName+";"+String:C10(0)
						$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
				End case 
				$_t_ButtonName:="oBarButton"+String:C10($_l_CurrentButton)
				OBJECT SET FORMAT:C236(*; $_t_ButtonName; $_t_PictureID)
				$_ptr_Help:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
				$_ptr_Help->:=$_ptr_Helppic->
				MOD_al_BarButtons{$_l_CurrentButton}:=$_l_Index+1
				$_at_BarHelp{$_l_CurrentButton}:=Mod_at_ToolTips{$_l_Index}
				$_l_CurrentButton:=$_l_CurrentButton+1
				$_t_LowercaseModuleName:=Lowercase:C14(MOD_at_ModuleName{$_l_Index})
				If (Not:C34($_bo_VisibleButtons))
					OBJECT SET VISIBLE:C603(*; $_t_ButtonName; False:C215)
				End if 
			End if 
			Case of 
				: ((MOD_al_ModuleBarNum{$_l_Index}=32) | (MOD_al_ModuleBarNum{$_l_Index}=21) | (MOD_al_ModuleBarNum{$_l_Index}=43))  //An exception
					MOD_at_ModuleName{$_l_Index}:="COMMUNICATIONS"
				: (MOD_al_ModuleBarNum{$_l_Index}=1)
					MOD_at_ModuleName{$_l_Index}:="DIARY & ACCOUNTS"
				: (MOD_al_ModuleBarNum{$_l_Index}=30)
					MOD_at_ModuleName{$_l_Index}:=Term_StoWT("SOP & STOCK CONTROL")
				Else 
					MOD_at_ModuleName{$_l_Index}:=Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{MOD_al_ModuleBarNum{$_l_Index}}))  //Module Name as def in Modules Array
			End case 
		End if 
	End for 
Else 
	
	
	$_l_CurrentButton:=2
	If (Is Windows:C1573)
		$_l_PictureReference:=19800
		<>PictIconPal:=Get_Picture(Menu_ModChkIcon(19798))
		
		OBJECT SET VISIBLE:C603(*; "oOSXShade"; False:C215)
	Else 
		$_l_PictureReference:=19800
		<>PictIconPal:=Get_Picture(Menu_ModChkIcon(19799))
		
		
		OBJECT SET VISIBLE:C603(*; "oWINShade"; False:C215)
		
	End if 
	$_l_NumberofModules:=Size of array:C274(MOD_al_ModuleBarNum)
	For ($_l_Index; 1; $_l_NumberofModules)
		$_l_ModuleNumber:=MOD_al_ModuleBarNum{$_l_Index}
		$_l_ShowIcon:=MOD_aI_ModuleShowIcon{$_l_ModuleNumber}
		If (MOD_al_ModuleBarNum{$_l_Index}#30)
			If ($_l_ShowIcon=1)
				APPEND TO ARRAY:C911(MOD_al_ModuleBarOffsets; MOD_al_ModuleBarNum{$_l_Index})
				Case of 
					: ((MOD_al_ModuleBarNum{$_l_Index}=12))  //Agency
						
					: ((MOD_al_ModuleBarNum{$_l_Index}=32) | (MOD_al_ModuleBarNum{$_l_Index}=43))  //Telephony & Internet = Remote Access
						
					Else 
						$_ptr_Helppic:=Get pointer:C304("WS_pic_Button"+String:C10($_l_CurrentButton))
						$_ptr_Helppic->:=Get_Picture(Menu_ModChkIcon($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index}))
						$_t_VariableName:="WS_pic_Button"+String:C10($_l_CurrentButton)
						$_pic_Picture:=Get_Picture(Menu_ModChkIcon($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index}))
						$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
				End case 
				$_t_ButtonName:="oBarButton"+String:C10($_l_CurrentButton)
				OBJECT SET FORMAT:C236(*; $_t_ButtonName; $_t_PictureID)
				$_ptr_Help:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
				$_ptr_Help->:=$_ptr_Helppic->
				MOD_al_BarButtons{$_l_CurrentButton}:=$_l_Index+1
				//$_at_BarHelp{$_l_CurrentButton}:=Mod_at_ToolTips{$_l_Index}
				$_l_CurrentButton:=$_l_CurrentButton+1
				If (Not:C34($_bo_VisibleButtons))
					OBJECT SET VISIBLE:C603(*; $_t_ButtonName; False:C215)
				End if 
			End if 
		End if 
	End for 
	
	If (False:C215)
		For ($_l_Index; 1; $_l_NumberofModules)
			$_l_ModuleNumber:=MOD_al_ModuleBarNum{$_l_Index}
			$_l_ShowIcon:=MOD_aI_ModuleShowIcon{$_l_ModuleNumber}
			
			If (MOD_al_ModuleBarNum{$_l_Index}#30)
				If ($_l_ShowIcon=1)
					
					Case of 
						: ((MOD_al_ModuleBarNum{$_l_Index}=12))  //Agency
							
						: ((MOD_al_ModuleBarNum{$_l_Index}=32) | (MOD_al_ModuleBarNum{$_l_Index}=43))  //Telephony & Internet = Remote Access
							
						Else 
							$_pic_Picture:=Get_Picture(Menu_ModChkIcon($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index}))
							$_t_PictureID:=";?"+String:C10($_l_PictureReference+MOD_al_ModuleBarNum{$_l_Index})+";;;;;;;;;"
							
							
					End case 
					$_t_ButtonName:="oBarButton"+String:C10($_l_CurrentButton)
					OBJECT SET FORMAT:C236(*; $_t_ButtonName; $_t_PictureID)
					$_ptr_Help:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
					$_ptr_Help->:=$_pic_Picture
					MOD_al_BarButtons{$_l_CurrentButton}:=$_l_Index+1
					$_at_BarHelp{$_l_CurrentButton}:=Mod_at_ToolTips{$_l_Index}
					
					If (Not:C34($_bo_VisibleButtons))
						OBJECT SET VISIBLE:C603(*; $_t_ButtonName; False:C215)
					End if 
					$_l_CurrentButton:=$_l_CurrentButton+1
				End if 
			End if 
			
			
		End for 
	End if 
End if 
For ($_l_Index; $_l_CurrentButton; 25)
	$_t_ButtonName:="oBarButton"+String:C10($_l_Index)
	OBJECT SET VISIBLE:C603(*; $_t_ButtonName; False:C215)
	
End for 
CLEAR SEMAPHORE:C144("$BarMod")
$_l_ButtonCount:=$_l_CurrentButton-2
$_l_NarrowButtons:=$_l_ButtonCount
$_l_NarrowButtonWidth:=45
ARRAY LONGINT:C221(MOD_al_BarButtons; $_l_CurrentButton-1)
ARRAY TEXT:C222($_at_BarHelp; $_l_CurrentButton-1)

For ($_l_Index; 1; Size of array:C274($_at_BarHelp))
	If ($_l_Index<22)
		$_ptr_Help:=Get pointer:C304("TB_t_Help"+String:C10($_l_Index))
		$_ptr_Help->:=$_at_BarHelp{$_l_Index}
	End if 
End for 
PopUpMenu1:=""
For ($_l_Index; 1; Size of array:C274($_at_BarHelp))
	PopUpMenu1:=PopUpMenu1+$_at_BarHelp{$_l_Index}+";"
End for 
$_l_GraphicsWidth:=32
GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
//$WIDTH:=(45*($_l_ButtonCount))+165
$_l_NarrowButtonCount:=0
$_l_ButtonNumber:=1
$_l_LeftPosition:=150
If ($_l_NavButtonsSpace>0)
	$_l_LeftPosition:=$_l_NavButtonsSpace
End if 
For ($_l_Index; 1; $_l_NarrowButtons)
	$_l_NarrowButtonCount:=$_l_NarrowButtonCount+1
	$_t_MoveObjectName:="oBarButton"+String:C10($_l_Index+$_l_ButtonNumber)
	
	
	//$MoveGraphicName:=
	OBJECT MOVE:C664(*; $_t_MoveObjectName; $_l_LeftPosition; 4; $_l_LeftPosition+$_l_NarrowButtonWidth; 36; *)
	//MOVE OBJECT($GraphicObjectPointer->;$_l_LeftPosition+104;1;$_l_LeftPosition+$_l_GraphicsWidth+104;33;*)
	$_l_LeftPosition:=$_l_LeftPosition+$_l_NarrowButtonWidth
End for 
$_l_TotalVisibleButtons:=$_l_NarrowButtonCount

$0:=($_l_NarrowButtonWidth*($_l_ButtonCount))+104
//$WIDTH
//Set the State of the current Module
$_l_BarModuleNum:=Find in array:C230(MOD_al_ModuleBarNum; BarMod)
$_t_Before:=""
For ($_l_Index; 1; $_l_BarModuleNum)
	$_l_CharacterPosition:=Position:C15(";"; PopUpMenu1)
	$_t_Before:=Substring:C12(PopUpMenu1; 1; $_l_CharacterPosition)
	PopUpMenu1:=Substring:C12(PopUpMenu1; $_l_CharacterPosition+1; Length:C16(PopUpMenu1))
End for 
PopUpMenu1:=$_t_Before+"! "+PopUpMenu1

If ($_l_BarModuleNum>0)
	
	DB_l_WindowCurrentModule:=BarMod
	If (Picture size:C356(BAR_Pic_Logo)>0)
		$_t_ModuleName:=Uppers2(Lowercase:C14(MOD_at_ModuleName{$_l_BarModuleNum}))
	Else 
		If ($_l_BarModuleNum<=Size of array:C274(MOD_at_ModuleName))
			$_t_ModuleName:=Uppers2(Lowercase:C14(MOD_at_ModuleName{$_l_BarModuleNum}))+Char:C90(13)+DB_GetOrganisationScreenName
		Else 
			$_t_ModuleName:=DB_GetOrganisationScreenName
			
		End if 
	End if 
	DB_l_WindowCurrentModule:=BarMod
Else 
	DB_l_WindowCurrentModule:=0
	$_t_ModuleName:=Uppers2(Lowercase:C14(<>Mod_at_ModuleName{BarMod}))+Char:C90(13)+DB_GetOrganisationScreenName  //Set it to the basic Module name
End if 
$_l_ModuleBarRow:=Find in array:C230(MOD_al_ModuleBarNum; DB_l_WindowCurrentModule)
If ($_l_ModuleBarRow>0)
	//◊Bar:=0
	
	DB_SetBrowserBarSelection($_l_ModuleBarRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
	
Else 
	If (<>LOGIN_s255_FirstModuleName#"")
		$_l_ModuleBarRow:=Find in array:C230(MOD_at_ModuleName; <>LOGIN_s255_FirstModuleName)
		If ($_l_ModuleBarRow>0)
			DB_SetBrowserBarSelection($_l_ModuleBarRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
		Else 
			DB_SetBrowserBarSelection(2; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
		End if 
	Else 
		DB_SetBrowserBarSelection(2; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
	End if 
End if 
//and hide the current ones!!!
$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
If ($_l_BarProcess>0)
	HIDE PROCESS:C324($_l_BarProcess)
	
End if 
If (<>ButtProc>0)
	HIDE PROCESS:C324(<>ButtProc)
End if 
DB_bo_NoPallettes:=True:C214
If (DB_bo_HideModuleBar) | (Not:C34($_bo_VisibleButtons))
	
	$_l_NumberofModules:=Size of array:C274(MOD_al_ModuleBarOffsets)
	$_l_ButtonNumber:=1
	For ($_l_Index; 1; $_l_NumberofModules)
		$_t_ObjectName:="oBarButton"+String:C10($_l_Index+$_l_ButtonNumber)
		OBJECT SET VISIBLE:C603(*; $_t_ObjectName; False:C215)
	End for 
	
End if 
ERR_MethodTrackerReturn("DB_SetnewToolBar"; $_t_oldMethodName)
