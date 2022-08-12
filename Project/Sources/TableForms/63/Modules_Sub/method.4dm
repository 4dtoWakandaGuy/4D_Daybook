If (False:C215)
	//Table Form Method Name: [MODULES]Modules_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event; $_l_ModuleRow)
	C_TEXT:C284($_t_oldMethodName; $_t_Search)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [MODULES].Modules_Sub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[MODULES:63]); "Modules_Sub")
		If ([MODULES:63]Code:1="")
			[MODULES:63]Code:1:=[PERSONNEL:11]Initials:1
		End if 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([MODULES:63]Module:2))
				If (Length:C16([MODULES:63]Module:2)=1)
					$_l_ModuleRow:=0
				Else 
					$_t_Search:=Sel_AtSign([MODULES:63]Module:2)
					$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; $_t_Search)
				End if 
				If ($_l_ModuleRow>0)
					If ((DB_GetModuleSettingByNUM($_l_ModuleRow))=0)
						Gen_Alert("You have not purchased the "+<>Mod_at_ModuleName{$_l_ModuleRow}+" Module"; "Try again")
						[MODULES:63]Module:2:=""
					Else 
						[MODULES:63]Module:2:=<>Mod_at_ModuleName{$_l_ModuleRow}
					End if 
				Else 
					
					// no such form
					//DIALOG([MODULES];"dAsk Mod")
					//CLOSE WINDOW
					//If (DB_GetModuleSetting(◊MOD_at_ModuleName)=0)
					//Gen_Alert ("You have not purchased the "+◊MOD_at_ModuleName{◊MOD_at_ModuleName}+" Module";"Try again")
					//[MODULES]Module:=""
					//Else
					//[MODULES]Module:=◊MOD_at_ModuleName{◊MOD_at_ModuleName}
					//End if
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([MODULES:63]Read_Only:3))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([MODULES:63]No_Deletions:4))
				DB_bo_RecordModified:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("FM:Modules_Sub"; $_t_oldMethodName)
