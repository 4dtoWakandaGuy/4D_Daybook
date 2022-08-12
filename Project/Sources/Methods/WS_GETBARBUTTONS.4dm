//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_GETBARBUTTONS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_aI_ModuleShowIcon;0)
	//ARRAY LONGINT(MOD_al_BarButtons;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	ARRAY TEXT:C222($_at_BarHelp; 0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(Mod_at_ToolTips;0)
	C_BOOLEAN:C305(<>MOD_bo_ShowText; <>ModuleIcons; <>SCPT_bo_NoAutoScripts; DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>MENU_l_BarModule; <>Mod_l_MaxModules; <>SYS_l_WindowTop; $_l_ButtonCount; $_l_ButtonIndex; $_l_ButtonNumber; $_l_ButtonsWIdth; $_l_CharacterPosition; $_l_CurrentButton; $_l_Flags; $_l_HelpIndex)
	C_LONGINT:C283($_l_HelpIndexi; $_l_LeftPosition; $_l_ModuleCount; $_l_ModuleIndex; $_l_ModuleNumber; $_l_ModuleRow; $_l_NarrowButtonCount; $_l_NarrowButtons; $_l_NarrowButtonWIdth; $_l_Resource; $_l_Retries)
	C_LONGINT:C283($_l_ShowIcon; $_l_TotalVisibleButtons; $_l_TotalWidth; $_l_WIdeButtons; $_l_WIdeButtonWIdth; $_l_Width; SIZ_l_BARBOTTOM; SIZ_l_BARLEFT; SIZ_l_BARRIGHT; SIZ_l_BARTOP; vSNo)
	C_PICTURE:C286(<>DB_Pic_CoLogo; <>PictIconPal; BAR_GRAPHIC_1; BAR_GRAPHIC_10; BAR_GRAPHIC_11; BAR_GRAPHIC_12; BAR_GRAPHIC_13; BAR_GRAPHIC_14; BAR_GRAPHIC_15; BAR_GRAPHIC_16; BAR_GRAPHIC_17)
	C_PICTURE:C286(BAR_GRAPHIC_18; BAR_GRAPHIC_19; BAR_GRAPHIC_2; BAR_GRAPHIC_20; BAR_GRAPHIC_21; BAR_GRAPHIC_22; BAR_GRAPHIC_23; BAR_GRAPHIC_24; BAR_GRAPHIC_25; BAR_GRAPHIC_26; BAR_GRAPHIC_27)
	C_PICTURE:C286(BAR_GRAPHIC_28; BAR_GRAPHIC_29; BAR_GRAPHIC_3; BAR_GRAPHIC_30; BAR_GRAPHIC_4; BAR_GRAPHIC_5; BAR_GRAPHIC_6; BAR_GRAPHIC_7; BAR_GRAPHIC_8; BAR_GRAPHIC_9; BAR_Pic_Logo)
	C_PICTURE:C286(WS_pic_Button1; WS_pic_Button10; WS_pic_Button11; WS_pic_Button12; WS_pic_Button13; WS_pic_Button14; WS_pic_Button15; WS_pic_Button16; WS_pic_Button17; WS_pic_Button18; WS_pic_Button19)
	C_PICTURE:C286(WS_pic_Button2; WS_pic_Button21; WS_pic_Button22; WS_pic_Button23; WS_pic_Button24; WS_pic_Button25; WS_pic_Button26; WS_pic_Button27; WS_pic_Button28; WS_pic_Button29; WS_pic_Button3)
	C_PICTURE:C286(WS_pic_Button31; WS_pic_Button32; WS_pic_Button33; WS_pic_Button34; WS_pic_Button35; WS_pic_Button36; WS_pic_Button37; WS_pic_Button38; WS_pic_Button39; WS_pic_Button4; WS_pic_Button5)
	C_PICTURE:C286(WS_pic_Button6; WS_pic_Button7; WS_pic_Button8; WS_pic_Button9)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variablepic)
	C_TEXT:C284(<>PopUpMenu1; $_t_Before; $_t_ButtonName; $_t_ButtonName2; $_t_HideButtonName; $_t_LowerCase; $_t_MoveObjectName; $_t_oldMethodName; $_t_PictureID; $_t_VariableName; vSolution)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_GETBARBUTTONS")
//Menu_ModBarLPBT - see also Menu_ModBarLPB
ARRAY LONGINT:C221(MOD_al_ModuleBarOffsets; 0)
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

//C_POINTER($_ptr_Variable)
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
$_l_CurrentButton:=1

If (Is Windows:C1573)
	$_l_Resource:=19800
	//GET PICTURE FROM LIBRARY(19798; <>PictIconPal)  //db on grey
	<>PictIconPal:=Get_Picture(19798)
	OBJECT SET VISIBLE:C603(*; "oOSXShade"; False:C215)
Else 
	$_l_Resource:=19800
	//GET PICTURE FROM LIBRARY(19799; <>PictIconPal)  //db OS X
	<>PictIconPal:=Get_Picture(19799)
	OBJECT SET VISIBLE:C603(*; "oWINShade"; False:C215)
	
End if 

If ((DB_GetModuleSettingByNUM(1))=5)  //Silver or Gold ? button
	
	//If (Picture size(◊PictCoLogo)>0)
	//   ◊PictLogoPal:=◊PictCoLogo
	//  Else
	
	// End if
	
	$_ptr_Variable:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
	$_ptr_Variable->:=<>PictIconPal
	MOD_al_BarButtons{$_l_CurrentButton}:=1
	$_at_BarHelp{$_l_CurrentButton}:="About_Daybook"
	
Else 
	
	$_ptr_Variable:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
	$_ptr_Variable->:=<>PictIconPal
	MOD_al_BarButtons{$_l_CurrentButton}:=1
	$_at_BarHelp{$_l_CurrentButton}:="About_Daybook"
End if 

$_l_CurrentButton:=2
$_l_Retries:=0
While (Semaphore:C143("$BarMod"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks($_l_Retries*2)
End while 
$_l_ModuleCount:=Size of array:C274(<>MOD_al_ModuleBarNum)
ARRAY TEXT:C222(MOD_at_ModuleName; $_l_ModuleCount)

ARRAY LONGINT:C221(MOD_al_BarButtons; 50)
ARRAY TEXT:C222($_at_BarHelp; 50)

//the above array contains the 'module' number assigned to the button
//remember this is only set up at startup
//unlike the tool bar which is dynamic
If (Not:C34(DB_bo_ModuleSettingsinited))
	Check_Modules
	DB_bo_ModuleSettingsinited:=True:C214
End if 


For ($_l_ModuleIndex; 1; $_l_ModuleCount)
	If (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}#30)
		$_l_ModuleNumber:=<>MOD_al_ModuleBarNum{$_l_ModuleIndex}
		$_l_ShowIcon:=MOD_aI_ModuleShowIcon{$_l_ModuleNumber}
		//cols;lines;picture;flags{;ticks}
		//TRACE
		Case of 
			: ((<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=32) | (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=21) | (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=43))  //An exception
				
				MOD_at_ModuleName{$_l_ModuleIndex}:="COMMUNICATIONS"
			: (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=1)
				MOD_at_ModuleName{$_l_ModuleIndex}:="DIARY & ACCOUNTS"
			: (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=30)
				MOD_at_ModuleName{$_l_ModuleIndex}:=Term_StoWT("SOP & STOCK CONTROL")
			Else 
				MOD_at_ModuleName{$_l_ModuleIndex}:=Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_ModuleIndex}}))  //Module Name as def in Modules Array
				
		End case 
		If ($_l_ShowIcon=1)
			APPEND TO ARRAY:C911(MOD_al_ModuleBarOffsets; <>MOD_al_ModuleBarNum{$_l_ModuleIndex})
			$_ptr_Variablepic:=Get pointer:C304("WS_pic_Button"+String:C10($_l_CurrentButton))
			$_t_VariableName:="WS_pic_Button"+String:C10($_l_CurrentButton)
			$_l_Flags:=128+16+32
			Case of 
				: ((<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=12))  //Agency
					
					
					If (<>ModuleIcons)
						$_ptr_Variablepic->:=Get_Picture($_l_Resource+10)
						//Get Picture FROM LIBRARY($_l_Resource+10;$p)
						//$_t_PictureID:="
						//$_t_PictureID:="1;4;"+$_t_VariableName+";"+String(0)  //;;;;;;;;"
						//$format:="1;4;picVar_"+String(<>picVarCount_l)+";0"
						$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
						//cols;lines;picture;flags{;ticks}
					Else 
						$_ptr_Variablepic->:=Get_Picture($_l_Resource+9)
						//Get Picture FROM LIBRARY($_l_Resource+9;$p)
						//$_t_PictureID:=";?"+String($_l_Resource+9)+";;;;;;;;;"
						//$_t_PictureID:="1;4;"+$_t_VariableName+";"+String(0)  //;;;;;;;;"
						$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
					End if 
				: ((<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=32) | (<>MOD_al_ModuleBarNum{$_l_ModuleIndex}=43))  //Telephony & Internet = Remote Access
					
					$_ptr_Variablepic->:=Get_Picture(Menu_ModChkIcon($_l_Resource+21))
					
					//Get Picture FROM LIBRARY(Menu_ModChkIcon ($_l_Resource+21);$p)
					//$_t_PictureID:=";?"+String($_l_Resource+21)+";;;;;;;;;"
					//$_t_PictureID:="0;4;"+$_t_VariableName+";;;;;;;;;"
					//$_t_PictureID:="1;4;"+$_t_VariableName+";"+String($_l_Flags)  //;;;;;;;;"
					$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
				Else 
					$_ptr_Variablepic->:=Get_Picture(Menu_ModChkIcon($_l_Resource+<>MOD_al_ModuleBarNum{$_l_ModuleIndex}))
					
					//Get Picture FROM LIBRARY(Menu_ModChkIcon ($_l_Resource+<>MOD_al_ModuleBarNum{$_l_ModuleIndex});$p)
					
					//$_t_PictureID:=";?"+String($_l_Resource+<>MOD_al_ModuleBarNum{$_l_ModuleIndex})+";;;;;;;;;"
					//$_t_PictureID:="0;4;"+$_t_VariableName+";;;;;;;;;"
					
					//$_t_PictureID:="1;4;"+$_t_VariableName+";"+String($_l_Flags)  //;;;;;;;;"
					$_t_PictureID:=";"+$_t_VariableName+";;;;;;;;;"
			End case 
			$_t_ButtonName:="oBarButton"+String:C10($_l_CurrentButton)
			OBJECT SET FORMAT:C236(*; $_t_ButtonName; $_t_PictureID)
			$_t_ButtonName2:="oBarButtont"+String:C10($_l_CurrentButton)
			OBJECT SET FORMAT:C236(*; $_t_ButtonName2; $_t_PictureID)
			
			
			$_ptr_Variable:=Get pointer:C304("BAR_GRAPHIC_"+String:C10($_l_CurrentButton))
			
			If ($_l_CurrentButton=2)
				//$_ptr_Variable:=Get pointer("BAR_t_Button_"+String($_l_CurrentButton))
			End if 
			$_ptr_Variable->:=($_ptr_Variablepic->)
			MOD_al_BarButtons{$_l_CurrentButton}:=$_l_ModuleIndex+1
			$_at_BarHelp{$_l_CurrentButton}:=Mod_at_ToolTips{$_l_ModuleIndex}
			
			$_l_CurrentButton:=$_l_CurrentButton+1
			$_t_LowerCase:=Lowercase:C14(MOD_at_ModuleName{$_l_ModuleIndex})
			OBJECT SET TITLE:C194(*; $_t_ButtonName2; Uppers2($_t_LowerCase))
			
			
			
			
		End if 
		
	End if 
End for 

CLEAR SEMAPHORE:C144("$BarMod")
$_l_ButtonCount:=$_l_CurrentButton-2
$_l_NarrowButtons:=0
$_l_WIdeButtons:=0
//TRACE
If (<>MOD_bo_ShowText)
	//Gen_Alert ("ShowText is true")
Else 
	//Gen_Alert ("ShowText is FALSE")
End if 
$_l_WIdeButtonWIdth:=120
$_l_NarrowButtonWIdth:=45
<>MOD_bo_ShowText:=False:C215
If (<>MOD_bo_ShowText)
	$_l_Width:=Screen width:C187-165
	
	$_l_ButtonsWIdth:=$_l_ButtonCount*$_l_WIdeButtonWIdth
	If ($_l_ButtonsWIdth>$_l_Width)
		$_l_WIdeButtons:=$_l_ButtonCount
		$_l_NarrowButtons:=0
		Repeat 
			$_l_NarrowButtons:=$_l_NarrowButtons+1
			$_l_WIdeButtons:=$_l_WIdeButtons-1
			$_l_TotalWidth:=($_l_WIdeButtons*$_l_WIdeButtonWIdth)+($_l_NarrowButtons*$_l_NarrowButtonWIdth)
		Until ($_l_TotalWidth<=$_l_Width)
		//This will now fit on screen
	Else 
		$_l_WIdeButtons:=$_l_ButtonCount
		$_l_TotalWidth:=($_l_WIdeButtons*$_l_WIdeButtonWIdth)
	End if 
End if 
//Gen_Alert ("Narrow Buttons"+String($_l_NarrowButtons)+"Wide Buttons"+String($_l_WIdeButtons))

ARRAY LONGINT:C221(MOD_al_BarButtons; $_l_CurrentButton-1)
ARRAY TEXT:C222($_at_BarHelp; $_l_CurrentButton-1)

For ($_l_HelpIndex; 1; Size of array:C274($_at_BarHelp))
	If ($_l_HelpIndex<22)
		$_ptr_Variable:=Get pointer:C304("TB_t_Help"+String:C10($_l_HelpIndex))
		$_ptr_Variable->:=$_at_BarHelp{$_l_HelpIndexi}
	End if 
End for 


<>PopUpMenu1:=""
For ($_l_HelpIndex; 1; Size of array:C274($_at_BarHelp))
	<>PopUpMenu1:=<>PopUpMenu1+$_at_BarHelp{$_l_HelpIndex}+";"
End for 


GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
//$_l_Width:=(45*($_l_ButtonCount))+165
If ($_l_NarrowButtons=0) & ($_l_WIdeButtons=0)
	$_l_Width:=($_l_NarrowButtonWIdth*($_l_ButtonCount))+165
	SET WINDOW RECT:C444(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARLEFT+$_l_Width; SIZ_l_BARTop+33)
Else 
	//TRACE
	$_l_Width:=$_l_TotalWidth+165
	SET WINDOW RECT:C444(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARLEFT+$_l_Width; SIZ_l_BARTop+33)
	$_l_LeftPosition:=0
	$_l_ButtonNumber:=0
	For ($_l_ButtonIndex; 1; $_l_WIdeButtons)
		$_l_ButtonNumber:=$_l_ButtonIndex+1
		$_t_HideButtonName:="oBarButton"+String:C10($_l_ButtonIndex+1)
		OBJECT SET VISIBLE:C603(*; $_t_HideButtonName; False:C215)
		$_t_MoveObjectName:="oBarButtont"+String:C10($_l_ButtonIndex+1)
		OBJECT MOVE:C664(*; $_t_MoveObjectName; $_l_LeftPosition+165; 4; $_l_LeftPosition+$_l_WIdeButtonWIdth+165; 36; *)
		$_l_LeftPosition:=$_l_LeftPosition+$_l_WIdeButtonWIdth
		
	End for 
	For ($_l_ButtonIndex; $_l_WIdeButtons+1; 25)
		$_t_HideButtonName:="oBarButtont"+String:C10($_l_ButtonIndex)
		OBJECT SET VISIBLE:C603(*; $_t_HideButtonName; False:C215)
	End for 
	
	$_l_NarrowButtonCount:=0
	For ($_l_ButtonIndex; 1; $_l_NarrowButtons)
		$_l_NarrowButtonCount:=$_l_NarrowButtonCount+1
		$_t_HideButtonName:="oBarButtont"+String:C10($_l_ButtonIndex+$_l_ButtonNumber)
		OBJECT SET VISIBLE:C603(*; $_t_HideButtonName; False:C215)
		$_t_MoveObjectName:="oBarButton"+String:C10($_l_ButtonIndex+$_l_ButtonNumber)
		OBJECT MOVE:C664(*; $_t_MoveObjectName; $_l_LeftPosition+165; 4; $_l_LeftPosition+$_l_NarrowButtonWIdth+165; 36; *)
		$_l_LeftPosition:=$_l_LeftPosition+$_l_NarrowButtonWIdth
	End for 
	$_l_TotalVisibleButtons:=$_l_NarrowButtonCount+$_l_ButtonNumber
	If (($_l_TotalVisibleButtons+1)<25)
		For ($_l_ButtonIndex; $_l_TotalVisibleButtons+1; 25)
			$_t_HideButtonName:="oBarButtont"+String:C10($_l_ButtonIndex)
			OBJECT SET VISIBLE:C603(*; $_t_HideButtonName; False:C215)
			$_t_HideButtonName:="oBarButton"+String:C10($_l_ButtonIndex)
			OBJECT SET VISIBLE:C603(*; $_t_HideButtonName; False:C215)
		End for 
	End if 
End if 
GET WINDOW RECT:C443(SIZ_l_BARLEFT; SIZ_l_BARTop; SIZ_l_BARRIGHT; SIZ_l_BARBottom)
If (SIZ_l_BARTop>=(<>SYS_l_WindowTop+1))
	SET WINDOW RECT:C444(SIZ_l_BARLEFT; <>SYS_l_WindowTop+1; SIZ_l_BARRIGHT; <>SYS_l_WindowTop+1+33)
End if 
//Set the State of the current Module
$_l_ModuleRow:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
$_t_Before:=""
For ($_l_ModuleIndex; 1; $_l_ModuleRow)
	$_l_CharacterPosition:=Position:C15(";"; <>PopUpMenu1)
	$_t_Before:=Substring:C12(<>PopUpMenu1; 1; $_l_CharacterPosition)
	<>PopUpMenu1:=Substring:C12(<>PopUpMenu1; $_l_CharacterPosition+1; Length:C16(<>PopUpMenu1))
End for 
<>PopUpMenu1:=$_t_Before+"! "+<>PopUpMenu1

If ($_l_ModuleRow>0)
	// $_ptr_Variable:=Get pointer("bd"+String($_l_ModuleIndex+1))
	// $_ptr_Variable»:=1
	If (Picture size:C356(BAR_Pic_Logo)>0)
		vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$_l_ModuleRow}); 2); 2)
	Else 
		//vSolution:=Uppers2 (Lowercase(MOD_at_ModuleName{$_l_ModuleRow}))+Char(13)+DB_GetOrganisationScreenName 
		vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$_l_ModuleRow}); 2); 2)+Char:C90(13)+DB_GetOrganisationScreenName
		
	End if 
	
	vSNo:=<>MENU_l_BarModule
	If (<>SCPT_bo_NoAutoScripts=False:C215)
		//PLAY("Chord "+String($_l_ModuleRow);0)
	End if 
Else 
	vSNo:=0
	//vSolution:=Uppers2 (Lowercase(<>Mod_at_ModuleName{<>MENU_l_BarModule}))+Char(13)+DB_GetOrganisationScreenName   //Set it to the basic Module name
	vSolution:=Uppers2(Uppers3(Lowercase:C14(<>Mod_at_ModuleName{<>MENU_l_BarModule}); 2); 2)+Char:C90(13)+DB_GetOrganisationScreenName
	
	// - only used by Silver users with Gold Modules
End if 
Gen_SetModCol
ERR_MethodTrackerReturn("WS_GETBARBUTTONS"; $_t_oldMethodName)
