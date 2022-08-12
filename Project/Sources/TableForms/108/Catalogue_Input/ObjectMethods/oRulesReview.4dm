If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.oRulesReview
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 13:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave)
	C_TEXT:C284($_t_oldMethodName; CAT_t_CatViewCurrency)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.oRulesReview"; Form event code:C388)
If ([CATALOGUE:108]xCatalogueClass:9=1)
	//need to find the 'set' associated with this list
	//that will be a macro.
	If ([CATALOGUE:108]xMacroName:12="")
		Gen_Confirm("Manually Configure/Build a search"; "Manual"; "Auto")
		If (OK=0)
			//[Catalogue]xMacroName:=CAT_CreateAutoSearch
		Else 
			[CATALOGUE:108]xMacroName:12:=CAT_CreateMacroSearch
			If (Not:C34(<>SYS_bo_ScriptonSave))
				If (DB_GetModuleSettingByNUM(Module_Macros)>0)
					<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
				End if 
			End if 
			
			CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; True:C214; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
			
		End if 
	Else 
		//already has a macro..for review
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=[CATALOGUE:108]xMacroName:12)
		[CATALOGUE:108]xMacroName:12:=CAT_CreateMacroSearch([CATALOGUE:108]xMacroName:12)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.oRulesReview"; $_t_oldMethodName)
