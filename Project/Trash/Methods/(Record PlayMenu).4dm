//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_PlayMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 16:20 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_MenuItemsRefsArray; 0)
	ARRAY TEXT:C222($_at_MenuItemsTitlesArray; 0)
	ARRAY TEXT:C222($_at_MenuRefsArray; 0)
	ARRAY TEXT:C222($_at_MenuTitlesArray; 0)
	C_LONGINT:C283(<>BUTTPROC; <>MenuProc; <>Mod_l_MenuBarPaletteProcess; <>RecBarUp; <>SCPT_l_PaletteWIndow; $_l_CommandKey; $_l_FrontmostProcess; $_l_Mask; $_l_MenuTitleRow; $_l_Modifier; $_l_ModuleRow)
	C_LONGINT:C283($_l_VolumeRow; $2; DB_l_ButtonClickedFunction; SCPT_l_ThisWindowPalette)
	C_TEXT:C284(<>EXECUTE; $_t_MenuReference; $_t_MenuTitle; $_t_ModuleName; $_t_oldMethodName; $_t_Parameter1; $_t_Parameter2; $_t_Parameter3; $1; $3; DB_t_ButtonClickedFunction)
	C_TEXT:C284(vMTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayMenu")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

If (Count parameters:C259>1)
	vMTitle2:=$1
End if 
If (Count parameters:C259>=3)
	$_t_Parameter1:=$1
	$_t_Parameter2:=String:C10($2)
	$_t_Parameter3:=$3
Else 
	$_t_Parameter1:=Str RemQuote(First_Param(vMTitle2))
	$_t_Parameter2:=Str RemQuote(First_Param(vMTitle2))
	$_t_Parameter3:=Str RemQuote(First_Param(vMTitle2))
End if 
If ($_t_Parameter2="")
	$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; $_t_Parameter1)
	If ($_l_ModuleRow>0)
		
		If ($_l_ModuleRow<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{$_l_ModuleRow}#"")
				$_t_ModuleName:=<>Mod_at_ModuleName{$_l_ModuleRow}
				Case of 
					: ($_t_ModuleName="Diary Manager")
						$_t_ModuleName:="Time Manager"
					: ($_t_ModuleName="Word Processing")
						$_t_ModuleName:="Document Manager"
					: ($_t_ModuleName="Stock Control")
						$_t_ModuleName:="Stock Manager"
						$_t_ModuleName:=Term_AllWT
					: ($_t_ModuleName="Sales Ledger")
						$_t_ModuleName:=Term_SLPLWT($_t_ModuleName)
					: ($_t_ModuleName="Purchase Ledger")
						$_t_ModuleName:=Term_SLPLWT($_t_ModuleName)
					: ($_t_ModuleName="General Ledger")
						$_t_ModuleName:="Nominal Ledger"
						$_t_ModuleName:=Term_SLPLWT($_t_ModuleName)
					Else 
						$_t_ModuleName:=Term_AllWT($_t_ModuleName)
						
				End case 
				Menus
				ARRAY TEXT:C222($_at_MenuTitlesArray; 0)
				ARRAY TEXT:C222($_at_MenuRefsArray; 0)
				$_t_MenuReference:=Get menu bar reference:C979(<>MenuProc)
				//Menus
				If ($_t_MenuReference#"")
					GET MENU ITEMS:C977($_t_MenuReference; $_at_MenuTitlesArray; $_at_MenuRefsArray)
					$_l_MenuTitleRow:=Find in array:C230($_at_MenuTitlesArray; "Volumes")
					If ($_l_MenuTitleRow>0)
						$_t_MenuTitle:=$_at_MenuRefsArray{$_l_MenuTitleRow}
						GET MENU ITEMS:C977($_t_MenuTitle; $_at_MenuItemsTitlesArray; $_at_MenuItemsRefsArray)
						$_l_VolumeRow:=Find in array:C230($_at_MenuItemsTitlesArray; $_t_ModuleName)
						If ($_l_VolumeRow>0)
							//TRACE
							$_l_CommandKey:=Get menu item key:C424($_t_MenuTitle; $_l_VolumeRow; <>MenuProc)
							$_l_Modifier:=Get menu item modifiers:C980($_t_MenuTitle; $_l_VolumeRow; <>MenuProc)
							$_l_Mask:=Command key mask:K16:1
							
							Gen_PostKey(Current process:C322; $_l_CommandKey; $_l_Mask+$_l_Modifier)
						End if 
					End if 
				Else 
					//?????
				End if 
				
			End if 
		End if 
		
	Else 
		Case of 
			: ($_t_Parameter1="Macros Palette@")
				If (False:C215)
					If ((<>SCPT_l_PaletteWIndow=0) | ((<>SCPT_l_PaletteWIndow>0) & ($_t_Parameter1="@off")))
						SCPT_LaunchPalette
					End if 
				Else 
					If ((SCPT_l_ThisWindowPalette=0) | ((SCPT_l_ThisWindowPalette>0) & ($_t_Parameter1="@off")))
						
						
						If (SCPT_l_ThisWindowPalette>0)
							If ($_t_Parameter1="@off")
								SCPT_HideLargePallete(SCPT_l_ThisWindowPalette)
							Else 
								SHOW PROCESS:C325(SCPT_l_ThisWindowPalette)
							End if 
						Else 
							If ($_t_Parameter1="@off")
								SCPT_HideLargePallete
							Else 
								SHOW PROCESS:C325(<>SCPT_l_PaletteWIndow)
							End if 
						End if 
					End if 
				End if 
			: ($_t_Parameter1="Buttons Palette@")
				
			: ($_t_Parameter2="Modules Palette@")
				
		End case 
	End if 
Else 
	If (($_t_Parameter1#"") & ($_t_Parameter3#""))
		If ($_t_Parameter2="-1")
			
			If ($_t_Parameter3="PopUp Item @")  //If it's the Processes pop-up
				Processes_PopUp(Num:C11(Substring:C12($_t_Parameter3; 12; 2)))
			Else 
				
				$_l_FrontmostProcess:=Frontmost process:C327(*)
				If ($_l_FrontmostProcess=<>MenuProc)  //If its the menus a normal call won't work
					$_l_FrontmostProcess:=New process:C317($_t_Parameter1; DB_ProcessMemoryinit(1); $_t_Parameter3)
				Else 
					If (Application type:C494#4D Server:K5:6)
						If ($_t_Parameter3="Menu Item @")  //If it has to use the menu postion method - eg MC Find menus
							SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("-1"))
							
							SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_t_ButtonClickedFunction; "-1"+Substring:C12($_t_Parameter3; 11; 50)+$_t_Parameter1)
						Else 
							SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("-1"))
							
							SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_t_ButtonClickedFunction; "-1"+$_t_Parameter1)
						End if 
						POST OUTSIDE CALL:C329($_l_FrontmostProcess)  //Call the process to do a layout menu item
					End if 
				End if 
			End if 
		Else 
			If (Num:C11($_t_Parameter2)>=DB_ProcessMemoryinit(1))
				
				ZProc($_t_Parameter1; Num:C11($_t_Parameter2); $_t_Parameter3)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayMenu"; $_t_oldMethodName)
