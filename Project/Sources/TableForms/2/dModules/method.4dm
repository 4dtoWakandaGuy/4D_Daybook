//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_event; $i; Mod_l_MenuBarPaletteProcess; vSNo)
	C_TEXT:C284($_t_oldMethodName; vSolution)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dModules"; Form event code:C388)
//NB: Is repeated in dModules Silver
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Outside Call:K2:11)
		If (Mod_l_MenuBarPaletteProcess=0)
			CANCEL:C270
		Else 
			Gen_SetModCol
			
			If (<>MENU_l_BarModule#vSNo)  //If called from a Menu proc, this will be true
				$i:=Find in array:C230(<>MOD_al_ModuleBarNum; vSNo)
				If ($i>0)
					//CB SET STATE (eMod_32x32;$i+1;0)
				End if 
				$i:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
				If ($i>0)
					//CB SET STATE (eMod_32x32;$i+1;1)
					vSolution:=MOD_at_ModuleName{$i}
					vSNo:=<>MENU_l_BarModule
				Else 
					vSNo:=0
					vSolution:=Uppercase:C13(<>Mod_at_ModuleName{<>MENU_l_BarModule})  //Set it to the basic Module name
					// - only used by Silver users with Gold Modules
				End if 
			End if 
			
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dModules")
		Menu_ModBarLPB
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dModules"; $_t_oldMethodName)
