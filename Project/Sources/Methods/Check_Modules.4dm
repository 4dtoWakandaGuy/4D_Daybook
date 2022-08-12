//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Modules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/02/2010 16:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ModuleDisabled; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleDisabledGroup; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleNoDel; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleReadOnly; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleRunAtStartup; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowIconTitle; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowinToolBar; 0)
	//ARRAY BOOLEAN(DBWS_aBo_ShowText;0)
	//ARRAY INTEGER(<>Mod_l_MaxModules;0)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY INTEGER(DB_aI_ModuleExecuteStartup;0)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	//ARRAY LONGINT(DB_al_ModuleShowText;0)
	//ARRAY LONGINT(DBWS_al_ModuleAccess;0)
	//ARRAY LONGINT(DBWS_al_RunAtStartup;0)
	//ARRAY LONGINT(DBWS_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_aI_ModuleShowIcon;0)
	//ARRAY TEXT(<>GRP_at_GroupMemberPersons;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_Modules; 0)
	//ARRAY TEXT(DBWS_at_aGroupPers;0)
	//ARRAY TEXT(DBWS_at_ModuleText;0)
	C_BOOLEAN:C305(<>Mod_bo_Gold; <>MOD_bo_InitIM; <>MOD_bo_ShowText; <>PER_bo_GroupToDo; <>SYS_bo_DuringInit; $_bo_InitArrays; $_bo_TrueFalse; DB_bo_ModuleSettingsinited; DB_bo_ModulesLoaded; DBWS_bo_isGold; DBWS_bo_MacroGroupToDo)
	C_BOOLEAN:C305(DBWS_bo_ShowText)
	C_LONGINT:C283($_l_CompaniesModule; $_l_DMModule; $_l_Fill; $_l_Index; $_l_Index2; $_l_ModuleAccess; $_l_ModuleCount; $_l_ModulePosition; $_l_ModuleSetting2; $_l_ModuleSettingb; $_l_ModuleSettingc)
	C_LONGINT:C283($_l_ModuleSettingd; $_l_ProductsModule; $_l_ShowTextPosition; $1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_UserGroup; <>SYS_t_MainorRemote; $_t_oldMethodName; $2; $cu; $fm; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DBWS_t_loginUserInitials)
	C_TEXT:C284(DBWS_T_PersonnelGroup)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Check_Modules")


Modules_Array
While (Semaphore:C143("$InitingModules"))
	DelayTicks
End while 
If (Not:C34(DB_bo_ModuleSettingsinited))
	
	
	//TRACE
	
	
	ARRAY BOOLEAN:C223($_abo_ModuleReadOnly; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleNoDel; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowinToolBar; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowIconTitle; 0)
	//ARRAY LONGINT(◊aMod;0)
	
	
	$_bo_InitArrays:=False:C215
	If (Count parameters:C259>=2)
		If ($2="JSON")
			$_bo_InitArrays:=True:C214
			
		End if 
	End if 
	If (Count parameters:C259=0) | ($_bo_InitArrays)
		
		
		//```
		ARRAY INTEGER:C220(DB_aI_aMod; <>Mod_l_MaxModules)
		ARRAY LONGINT:C221(MOD_aI_ModuleShowIcon; <>Mod_l_MaxModules)
		ARRAY LONGINT:C221(DB_al_ModuleShowText; <>Mod_l_MaxModules)
		ARRAY LONGINT:C221(DB_aI_ModuleExecuteStartup; <>Mod_l_MaxModules)
	Else 
		If (Undefined:C82(MOD_aI_ModuleShowIcon))
		End if 
	End if 
	If (Not:C34(DB_bo_ModulesLoaded))
		//TRACE
		DB_GetLicencedModuleSettings(->DB_aI_aMod)
		DB_bo_ModulesLoaded:=True:C214
	End if 
	
	
	
	//Start by getting the modules from the server!!! of loading them from the PATH NAME
	//here need to run an update at first log in if settings not updated.
	
	
	If (Count parameters:C259>1)
		If (Not:C34(<>SYS_bo_DuringInit))
			If (DBWS_T_PersonnelGroup#"")
				ARRAY LONGINT:C221(DBWS_al_ModuleAccess; 0)
				ARRAY LONGINT:C221(DBWS_al_ModuleAccess; Size of array:C274(<>Mod_at_ModuleName))
				ARRAY LONGINT:C221(DBWS_al_ShowIcon; 0)
				ARRAY LONGINT:C221(DBWS_al_ShowIcon; Size of array:C274(<>Mod_at_ModuleName))
				ARRAY BOOLEAN:C223(DBWS_aBo_ShowText; 0)
				ARRAY BOOLEAN:C223(DBWS_aBo_ShowText; Size of array:C274(<>Mod_at_ModuleName))
				ARRAY TEXT:C222(DBWS_at_ModuleText; 0)
				ARRAY TEXT:C222(DBWS_at_ModuleText; Size of array:C274(<>Mod_at_ModuleName))
				ARRAY LONGINT:C221(DBWS_al_RunAtStartup; 0)
				ARRAY LONGINT:C221(DBWS_al_RunAtStartup; Size of array:C274(<>Mod_at_ModuleName))
				
				For ($_l_Index; 1; Size of array:C274(DB_aI_aMod))
					DBWS_al_ModuleAccess{$_l_Index}:=DB_aI_aMod{$_l_Index}
					DBWS_al_ShowIcon{$_l_Index}:=0
					DBWS_at_ModuleText{$_l_Index}:=<>Mod_at_ModuleName{$_l_Index}
					DBWS_al_RunAtStartup{$_l_Index}:=0
				End for 
				QUERY:C277([MODULES:63]; [MODULES:63]Code:1=("^G"+DBWS_T_PersonnelGroup))  //Check its modules
				
				$_l_ModuleCount:=Records in selection:C76([MODULES:63])
				If ($_l_ModuleCount>0)
					SELECTION TO ARRAY:C260([MODULES:63]Module:2; $_at_Modules; [MODULES:63]Read_Only:3; $_abo_ModuleReadOnly; [MODULES:63]No_Deletions:4; $_abo_ModuleNoDel; [MODULES:63]xDisplayIcon:5; $_abo_ModuleShowinToolBar; [MODULES:63]xDisplayIconText:6; $_abo_ModuleShowIconTitle; [MODULES:63]xDisableModule:7; $_abo_ModuleDisabledGroup; [MODULES:63]XRunStartupInit:8; $_abo_ModuleRunAtStartup)
					//Note that if a module is disabled at GROUP level this will prevent it being enabled for any user in that group.. and of course it cant be enabled. Therefore the GROUP disabled setting is used within the personnel screen to prevent a module being enable for a user
					$_l_Index:=1
					
					For ($_l_Index2; 1; $_l_ModuleCount)
						$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; $_at_Modules{$_l_Index2})
						If ($_l_ModulePosition>0)
							$_l_ModuleSetting2:=DBWS_al_ModuleAccess{$_l_ModulePosition}
							If ((DBWS_al_ModuleAccess{$_l_ModulePosition}#0) & (DBWS_al_ModuleAccess{$_l_ModulePosition}#5))
								If ($_abo_ModuleReadOnly{$_l_Index2})
									$_l_ModuleSetting2:=3
								Else 
									If (($_abo_ModuleNoDel{$_l_Index2}))  // | ((◊MoR="R") & ($cu#"Designer") & ($cu#"Designer II")
										
										$_l_ModuleSetting2:=4
									Else 
										$_l_ModuleSetting2:=2
									End if 
								End if 
							End if 
							//$_t_oldMethodName2:=ERR_MethodTracker ("Check_Modules $_l_ModuleSetting2="+String($_l_ModuleSetting2))
							DBWS_al_ModuleAccess{$_l_ModulePosition}:=$_l_ModuleSetting2
							DBWS_al_ShowIcon{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowinToolBar{$_l_Index2})
							DBWS_aBo_ShowText{$_l_ModulePosition}:=(Num:C11($_abo_ModuleShowIconTitle{$_l_Index2})=1)
							DBWS_al_RunAtStartup{$_l_ModulePosition}:=Num:C11($_abo_ModuleRunAtStartup{$_l_Index2})  //kmw 06/10/08 v631b120, corrected from "{$_l_Index})" (this was ONE of the reasons internet manager wasn't getting initialised...ALSO preference wasn't getting saved anyway!!)
							
							
						End if 
					End for 
				End if 
			End if 
			QUERY:C277([MODULES:63]; [MODULES:63]Code:1=DBWS_t_loginUserInitials)
			$_l_ModuleCount:=Records in selection:C76([MODULES:63])
			
			If ($_l_ModuleCount>0)
				//Set access to available Modules
				SELECTION TO ARRAY:C260([MODULES:63]Module:2; $_at_Modules; [MODULES:63]Read_Only:3; $_abo_ModuleReadOnly; [MODULES:63]No_Deletions:4; $_abo_ModuleNoDel; [MODULES:63]xDisplayIcon:5; $_abo_ModuleShowinToolBar; [MODULES:63]xDisplayIconText:6; $_abo_ModuleShowIconTitle; [MODULES:63]xDisableModule:7; $_abo_ModuleDisabled; [MODULES:63]XRunStartupInit:8; $_abo_ModuleRunAtStartup)
				//if a module is disabled for a user this OVER RIDES the GROUP setting.
				$_l_Index:=1
				
				For ($_l_Index2; 1; $_l_ModuleCount)
					
					$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; $_at_Modules{$_l_Index2})
					
					If ($_l_ModulePosition>0)
						$_l_ModuleSetting2:=DB_aI_aMod{$_l_ModulePosition}
						
						If ((DBWS_al_ModuleAccess{$_l_ModulePosition}#0) & (DBWS_al_ModuleAccess{$_l_ModulePosition}#5))
							If ($_abo_ModuleDisabled{$_l_Index2})
								//Module is disabled for this user so this over-rides any other setting.
								//$ModuleSettiing:=1
								$_l_ModuleSetting2:=1  //kmw 06/10/08 v631b120, "$ModuleSettiing" never used anywhere else so I presume this was a typo and was meant to be $_l_ModuleSetting2
								
							Else 
								If ($_abo_ModuleReadOnly{$_l_Index2})
									$_l_ModuleSetting2:=3
								Else 
									If (($_abo_ModuleNoDel{$_l_Index2}))  // | ((◊MoR="R") & ($cu#"Designer") & ($cu#"Designer II")
										
										//& ($cu#"Administrator") & ($cu#"Administrator WP")))
										$_l_ModuleSetting2:=4
									Else 
										$_l_ModuleSetting2:=2
									End if 
								End if 
							End if 
						End if 
						//$_t_oldMethodName2:=ERR_MethodTracker ("Check_Modules $_l_ModuleSetting2="+String($_l_ModuleSetting2))
						DBWS_al_ModuleAccess{$_l_ModulePosition}:=$_l_ModuleSetting2
						DBWS_al_ShowIcon{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowinToolBar{$_l_Index2})
						DBWS_aBo_ShowText{$_l_ModulePosition}:=(Num:C11($_abo_ModuleShowIconTitle{$_l_Index2})=1)
						
						DBWS_al_RunAtStartup{$_l_ModulePosition}:=Num:C11($_abo_ModuleRunAtStartup{$_l_Index2})  //kmw 06/10/08 v631b120, corrected from "{$_l_Index})" (this was ONE of the reasons internet manager wasn't getting initialised...ALSO preference wasn't getting saved anyway!!)
						
					End if 
				End for 
				//Enable Companies & Products if not defined
				$_l_CompaniesModule:=Module_Companies
				If (DBWS_al_ModuleAccess>=$_l_CompaniesModule)
					If (DBWS_al_ModuleAccess{$_l_CompaniesModule}=1)
						DBWS_al_ModuleAccess{$_l_CompaniesModule}:=2
					End if 
				End if 
				$_l_ProductsModule:=Module_Products
				If (DBWS_al_ModuleAccess>=$_l_ProductsModule)
					If (DBWS_al_ModuleAccess{$_l_ProductsModule}=1)
						DBWS_al_ModuleAccess{$_l_ProductsModule}:=2
					End if 
				End if 
				//Enable Data Manager
				If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")))
					$_l_DMModule:=Module_DataManager
					If (DBWS_al_ModuleAccess>=$_l_DMModule)
						DBWS_al_ModuleAccess{$_l_DMModule}:=2
					End if 
				End if 
				
			Else 
				
				If ($_l_ModuleCount=0)  //If also no Group Modules
					
					
					For ($_l_Index; 1; DBWS_al_ModuleAccess)  //Make them all accessible to someone with no Modules allocated
						
						
						If ($_l_Index<=Size of array:C274(DBWS_al_ModuleAccess))
							If (DBWS_al_ModuleAccess{$_l_Index}=1)
								If ((<>SYS_t_MainorRemote="R") & (Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator"))))
									DBWS_al_ModuleAccess{$_l_Index}:=4
								Else 
									DBWS_al_ModuleAccess{$_l_Index}:=2
								End if 
							End if 
						End if 
					End for 
					
				Else 
					
					//Do the startup things for those with Group Modules but not Personnel ones
					$_l_CompaniesModule:=Module_Companies
					
					If (DBWS_al_ModuleAccess{$_l_CompaniesModule}=1)  //Enable Companies & Products if not defined
						
						DBWS_al_ModuleAccess{$_l_CompaniesModule}:=2
					End if 
					$_l_ProductsModule:=Module_Products
					
					If (DBWS_al_ModuleAccess{$_l_ProductsModule}=1)
						DBWS_al_ModuleAccess{$_l_ProductsModule}:=2
					End if 
					
					//Enable Data Manager
					If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")))
						$_l_DMModule:=Module_DataManager
						
						DBWS_al_ModuleAccess{$_l_DMModule}:=2
					End if 
				End if 
			End if 
			$_l_ShowTextPosition:=Find in array:C230(DBWS_aBo_ShowText; True:C214)
			If ($_l_ShowTextPosition>0)
				DBWS_bo_ShowText:=True:C214
				
			Else 
				DBWS_bo_ShowText:=False:C215  //for the purposes of testing
				
				
			End if 
			
			//Check if have any Gold Modules
			
			DBWS_bo_isGold:=True:C214
			//Execute the Module Proc of the 'Start with Module'
			
			If (Count parameters:C259>0)
				
				If ($1>0)
					If ($1<=Size of array:C274(DBWS_al_ModuleAccess))  // To be safe
						
						If (DBWS_al_ModuleAccess{$1}>1)
							If (DBWS_al_ModuleAccess{1}=5)  //If Silver turn the Modules into Silver or Silver Plus
								
								If (($1=2) | ($1=4) | ($1=5) | ($1=6))
									$1:=1
								Else 
									If (($1=17) | ($1=7))
										$1:=30
									End if 
								End if 
							End if 
							If ($1<=Size of array:C274(<>Mod_at_ProcessFunction))
								If (<>Mod_at_ProcessFunction{$1}#"")
									
									DB_t_CurrentFormUsage:="ModBar"
									// EXECUTE(◊aModProc{$1})
									
									
									Modules_MenuExe(<>Mod_at_ProcessFunction{$1}; Current process:C322; "JSON")
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			// ??  ??  THis setting was used in the startup method to launch the diary. using DB_t_CurrentFormUsage
			
			If ([PERSONNEL:11]Startup_Diary:16#0)
				DB_t_CurrentFormUsage:=String:C10([PERSONNEL:11]Startup_Diary:16)
			End if 
			
			ARRAY TEXT:C222(DBWS_at_aGroupPers; 0)
			If (DBWS_bo_MacroGroupToDo)
				
				If (DBWS_T_PersonnelGroup#"")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=DBWS_T_PersonnelGroup)
					If (Records in selection:C76([PERSONNEL:11])>0)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; DBWS_at_aGroupPers)
					Else 
						DBWS_bo_MacroGroupToDo:=False:C215
					End if 
				Else 
					DBWS_bo_MacroGroupToDo:=False:C215
				End if 
			End if 
			
			//TRACE
			
		Else 
			//this is a special mode to use during initialisation which will set all modules to temporariyl available
			ARRAY LONGINT:C221(DBWS_al_ModuleAccess; 0)
			ARRAY LONGINT:C221(DBWS_al_ModuleAccess; Size of array:C274(<>Mod_at_ModuleName))
			ARRAY LONGINT:C221(DBWS_al_ShowIcon; 0)
			ARRAY LONGINT:C221(DBWS_al_ShowIcon; Size of array:C274(<>Mod_at_ModuleName))
			ARRAY BOOLEAN:C223(DBWS_aBo_ShowText; 0)
			ARRAY BOOLEAN:C223(DBWS_aBo_ShowText; Size of array:C274(<>Mod_at_ModuleName))
			ARRAY TEXT:C222(DBWS_at_ModuleText; 0)
			ARRAY TEXT:C222(DBWS_at_ModuleText; Size of array:C274(<>Mod_at_ModuleName))
			ARRAY LONGINT:C221(DBWS_al_RunAtStartup; 0)
			ARRAY LONGINT:C221(DBWS_al_RunAtStartup; Size of array:C274(<>Mod_at_ModuleName))
			
			For ($_l_Fill; 1; Size of array:C274(DBWS_al_ModuleAccess))
				DBWS_al_ModuleAccess{$_l_Fill}:=2
			End for 
			
		End if 
		
		UNLOAD RECORD:C212([PERSONNEL:11])
		UNLOAD RECORD:C212([MODULES:63])
		
	Else 
		$_l_ModuleCount:=0
		If (<>PER_t_UserGroup#"")  //If a group is defined
			
			//Gen_Alert (◊userGroup)
			QUERY:C277([MODULES:63]; [MODULES:63]Code:1=("^G"+<>PER_t_UserGroup))  //Check its modules
			
			$_l_ModuleCount:=Records in selection:C76([MODULES:63])
			If ($_l_ModuleCount>0)
				SELECTION TO ARRAY:C260([MODULES:63]Module:2; $_at_Modules; [MODULES:63]Read_Only:3; $_abo_ModuleReadOnly; [MODULES:63]No_Deletions:4; $_abo_ModuleNoDel; [MODULES:63]xDisplayIcon:5; $_abo_ModuleShowinToolBar; [MODULES:63]xDisplayIconText:6; $_abo_ModuleShowIconTitle; [MODULES:63]xDisableModule:7; $_abo_ModuleDisabledGroup; [MODULES:63]XRunStartupInit:8; $_abo_ModuleRunAtStartup)
				//Note that if a module is disabled at GROUP level this will prevent it being enabled for any user in that group.. and of course it cant be enabled. Therefore the GROUP disabled setting is used within the personnel screen to prevent a module being enable for a user
				$_l_Index:=1
				
				For ($_l_Index2; 1; $_l_ModuleCount)
					$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; $_at_Modules{$_l_Index2})
					If ($_l_ModulePosition>0)
						If (False:C215)
							//◊aMod{$_l_ModulePosition}:=(((Num((◊aMod{$_l_ModulePosition}#0) & (◊aMod{$_l_ModulePosition}#5)))*2)+(Num($_abo_ModuleReadOnly{$_l_Index2})))+Num($_abo_ModuleNoDel{$_l_Index2})
							$_bo_TrueFalse:=((DB_aI_aMod{$_l_ModulePosition}#0) & (DB_aI_aMod{$_l_ModulePosition}#5))
							$_l_ModuleAccess:=Num:C11($_bo_TrueFalse)
							$_l_ModuleSettingb:=(Num:C11($_abo_ModuleReadOnly{$_l_Index2}))
							$_l_ModuleSettingc:=$_l_ModuleSettingb+(Num:C11($_abo_ModuleNoDel{$_l_Index2}))
							$_l_ModuleSettingd:=$_l_ModuleAccess+$_l_ModuleSettingc
						End if 
						$_l_ModuleSetting2:=DB_aI_aMod{$_l_ModulePosition}
						If ((DB_aI_aMod{$_l_ModulePosition}#0) & (DB_aI_aMod{$_l_ModulePosition}#5))
							If ($_abo_ModuleReadOnly{$_l_Index2})
								$_l_ModuleSetting2:=3
							Else 
								If (($_abo_ModuleNoDel{$_l_Index2}))  // | ((◊MoR="R") & ($cu#"Designer") & ($cu#"Designer II")
									
									//& ($cu#"Administrator") & ($cu#"Administrator WP")))
									$_l_ModuleSetting2:=4
								Else 
									$_l_ModuleSetting2:=2
								End if 
							End if 
						End if 
						//$_t_oldMethodName2:=ERR_MethodTracker ("Check_Modules $_l_ModuleSetting2="+String($_l_ModuleSetting2))
						DB_aI_aMod{$_l_ModulePosition}:=$_l_ModuleSetting2
						MOD_aI_ModuleShowIcon{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowinToolBar{$_l_Index2})
						DB_al_ModuleShowText{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowIconTitle{$_l_Index2})
						//TRACE
						DB_aI_ModuleExecuteStartup{$_l_ModulePosition}:=Num:C11($_abo_ModuleRunAtStartup{$_l_Index2})  //kmw 06/10/08 v631b120, corrected from "{$_l_Index})" (this was ONE of the reasons internet manager wasn't getting initialised...ALSO preference wasn't getting saved anyway!!)
						
						//```
						//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
						//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
						//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
						//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)
						
					End if 
				End for 
			End if 
		End if 
		
		//Gen_Alert (◊User)
		QUERY:C277([MODULES:63]; [MODULES:63]Code:1=<>PER_t_CurrentUserInitials)
		$_l_ModuleCount:=Records in selection:C76([MODULES:63])
		
		If ($_l_ModuleCount>0)
			
			//Set access to available Modules
			SELECTION TO ARRAY:C260([MODULES:63]Module:2; $_at_Modules; [MODULES:63]Read_Only:3; $_abo_ModuleReadOnly; [MODULES:63]No_Deletions:4; $_abo_ModuleNoDel; [MODULES:63]xDisplayIcon:5; $_abo_ModuleShowinToolBar; [MODULES:63]xDisplayIconText:6; $_abo_ModuleShowIconTitle; [MODULES:63]xDisableModule:7; $_abo_ModuleDisabled; [MODULES:63]XRunStartupInit:8; $_abo_ModuleRunAtStartup)
			//if a module is disabled for a user this OVER RIDES the GROUP setting.
			
			$_l_Index:=1
			
			For ($_l_Index2; 1; $_l_ModuleCount)
				
				$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; $_at_Modules{$_l_Index2})
				//```
				//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
				//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
				//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
				//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)
				
				If ($_l_ModulePosition>0)
					If (False:C215)
						//◊aMod{$_l_ModulePosition}:=(((Num((◊aMod{$_l_ModulePosition}#0) & (◊aMod{$_l_ModulePosition}#5)))*2)+(Num($_abo_ModuleReadOnly{$_l_Index2})))+Num($_abo_ModuleNoDel{$_l_Index2})
						$_bo_TrueFalse:=((DB_aI_aMod{$_l_ModulePosition}#0) & (DB_aI_aMod{$_l_ModulePosition}#5))
						$_l_ModuleAccess:=Num:C11($_bo_TrueFalse)
						$_l_ModuleSettingb:=(Num:C11($_abo_ModuleReadOnly{$_l_Index2}))
						$_l_ModuleSettingc:=$_l_ModuleSettingb+(Num:C11($_abo_ModuleNoDel{$_l_Index2}))
						$_l_ModuleSettingd:=$_l_ModuleAccess+$_l_ModuleSettingc
					End if 
					$_l_ModuleSetting2:=DB_aI_aMod{$_l_ModulePosition}
					
					
					If ((DB_aI_aMod{$_l_ModulePosition}#0) & (DB_aI_aMod{$_l_ModulePosition}#5))
						If ($_abo_ModuleDisabled{$_l_Index2})
							//Module is disabled for this user so this over-rides any other setting.
							//$ModuleSettiing:=1
							$_l_ModuleSetting2:=1  //kmw 06/10/08 v631b120, "$ModuleSettiing" never used anywhere else so I presume this was a typo and was meant to be $_l_ModuleSetting2
							
						Else 
							If ($_abo_ModuleReadOnly{$_l_Index2})
								$_l_ModuleSetting2:=3
							Else 
								If (($_abo_ModuleNoDel{$_l_Index2}))  // | ((◊MoR="R") & ($cu#"Designer") & ($cu#"Designer II")
									
									//& ($cu#"Administrator") & ($cu#"Administrator WP")))
									$_l_ModuleSetting2:=4
								Else 
									$_l_ModuleSetting2:=2
								End if 
							End if 
						End if 
					End if 
					//$_t_oldMethodName2:=ERR_MethodTracker ("Check_Modules $_l_ModuleSetting2="+String($_l_ModuleSetting2))
					//```
					//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
					//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
					//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
					//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)
					
					DB_aI_aMod{$_l_ModulePosition}:=$_l_ModuleSetting2
					MOD_aI_ModuleShowIcon{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowinToolBar{$_l_Index2})
					DB_al_ModuleShowText{$_l_ModulePosition}:=Num:C11($_abo_ModuleShowIconTitle{$_l_Index2})
					//TRACE
					DB_aI_ModuleExecuteStartup{$_l_ModulePosition}:=Num:C11($_abo_ModuleRunAtStartup{$_l_Index2})  //kmw 06/10/08 v631b120, corrected from "{$_l_Index})" (this was ONE of the reasons internet manager wasn't getting initialised...ALSO preference wasn't getting saved anyway!!)
					
				End if 
			End for 
			//Enable Companies & Products if not defined
			$_l_CompaniesModule:=Module_Companies
			//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
			//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
			//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
			//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)
			
			If (DB_aI_aMod{$_l_CompaniesModule}=1)
				DB_aI_aMod{$_l_CompaniesModule}:=2
			End if 
			$_l_ProductsModule:=Module_Products
			
			If (DB_aI_aMod{$_l_ProductsModule}=1)
				DB_aI_aMod{$_l_ProductsModule}:=2
			End if 
			
			//Enable Data Manager
			If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")))
				$_l_DMModule:=Module_DataManager
				
				DB_aI_aMod{$_l_DMModule}:=2
				
			End if 
			
		Else 
			
			If ($_l_ModuleCount=0)  //If also no Group Modules
				
				
				For ($_l_Index; 1; <>Mod_l_MaxModules)  //Make them all accessible to someone with no Modules allocated
					
					
					If ($_l_Index<=Size of array:C274(DB_aI_aMod))
						If (DB_aI_aMod{$_l_Index}=1)
							If ((<>SYS_t_MainorRemote="R") & (Not:C34(User in group:C338(Current user:C182; "Designer"))) & (Not:C34(User in group:C338(Current user:C182; "Administrator"))))
								DB_aI_aMod{$_l_Index}:=4
							Else 
								DB_aI_aMod{$_l_Index}:=2
							End if 
						End if 
					End if 
				End for 
				
			Else 
				
				//Do the startup things for those with Group Modules but not Personnel ones
				$_l_CompaniesModule:=Module_Companies
				
				If (DB_aI_aMod{$_l_CompaniesModule}=1)  //Enable Companies & Products if not defined
					
					DB_aI_aMod{$_l_CompaniesModule}:=2
				End if 
				$_l_ProductsModule:=Module_Products
				
				If (DB_aI_aMod{$_l_ProductsModule}=1)
					DB_aI_aMod{$_l_ProductsModule}:=2
				End if 
				
				//Enable Data Manager
				If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")))
					$_l_DMModule:=Module_DataManager
					
					DB_aI_aMod{$_l_DMModule}:=2
				End if 
			End if 
		End if 
		//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
		//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
		//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
		//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)
		
		$_l_ShowTextPosition:=Find in array:C230(DB_al_ModuleShowText; 1)
		If ($_l_ShowTextPosition>0)
			<>MOD_bo_ShowText:=True:C214
			
		Else 
			<>MOD_bo_ShowText:=False:C215  //for the purposes of testing
			
			
		End if 
		
		//Check if have any Gold Modules
		
		<>Mod_bo_Gold:=True:C214
		//Execute the Module Proc of the 'Start with Module'
		
		If (Count parameters:C259>0)
			
			If ($1>0)
				If ($1<=Size of array:C274(DB_aI_aMod))  // To be safe
					
					If (DB_aI_aMod{$1}>1)
						If (DB_aI_aMod{1}=5)  //If Silver turn the Modules into Silver or Silver Plus
							
							If (($1=2) | ($1=4) | ($1=5) | ($1=6))
								$1:=1
							Else 
								If (($1=17) | ($1=7))
									$1:=30
								End if 
							End if 
						End if 
						If ($1<=Size of array:C274(<>Mod_at_ProcessFunction))
							If (<>Mod_at_ProcessFunction{$1}#"")
								
								DB_t_CurrentFormUsage:="ModBar"
								// EXECUTE(◊aModProc{$1})
								
								
								Modules_MenuExe(<>Mod_at_ProcessFunction{$1})
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		// ??  ??  THis setting was used in the startup method to launch the diary. using DB_t_CurrentFormUsage
		
		If ([PERSONNEL:11]Startup_Diary:16#0)
			DB_t_CurrentFormUsage:=String:C10([PERSONNEL:11]Startup_Diary:16)
		End if 
		
		ARRAY TEXT:C222(<>GRP_at_GroupMemberPersons; 0)
		If (<>PER_bo_GroupToDo)
			
			If (<>PER_t_UserGroup#"")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=<>PER_t_UserGroup)
				If (Records in selection:C76([PERSONNEL:11])>0)
					SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; <>GRP_at_GroupMemberPersons)
				Else 
					<>PER_bo_GroupToDo:=False:C215
				End if 
			Else 
				<>PER_bo_GroupToDo:=False:C215
			End if 
		End if 
		
		//TRACE
		
		<>MOD_bo_InitIM:=False:C215
		$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; "Internet Manager")
		If ($_l_ModulePosition>0)
			If (<>Mod_al_ModuleAccessType{$_l_ModulePosition}>1)  // it is enabled
				
				<>MOD_bo_InitIM:=(DB_aI_ModuleExecuteStartup{$_l_ModulePosition}=1)
			End if 
		End if 
		
		UNLOAD RECORD:C212([PERSONNEL:11])
		UNLOAD RECORD:C212([MODULES:63])
	End if 
End if 
DB_bo_ModuleSettingsinited:=True:C214
CLEAR SEMAPHORE:C144("$InitingModules")
ERR_MethodTrackerReturn("Check_Modules"; $_t_oldMethodName)
