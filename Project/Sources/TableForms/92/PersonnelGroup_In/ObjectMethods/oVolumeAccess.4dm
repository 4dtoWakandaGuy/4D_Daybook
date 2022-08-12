If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL_GROUPS].Groups_In.oVolumeAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Mod_abo_HasIcon;0)
	//ARRAY BOOLEAN(MOD_abo_AccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_DisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_NoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_ReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_ShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305($_bo_HasIcon; DB_bo_RecordModified; vMod3)
	C_LONGINT:C283($_l_ControlLevel; $_l_event; $_l_FieldNumber; $_l_ModuleRow; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.oVolumeAccess"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		$_l_Row:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="MOD_abo_AccessBoolean")
				If (Not:C34(MOD_abo_AccessBoolean{$_l_Row}))
					If ((MOD_at_ModuleName{$_l_Row}="Companies") | (MOD_at_ModuleName{$_l_Row}="Products"))
						MOD_abo_AccessBoolean{$_l_Row}:=True:C214
					End if 
					
					MOD_abo_ReadOnly{$_l_Row}:=False:C215
					MOD_abo_NoDeletion{$_l_Row}:=False:C215
					MOD_abo_ShowIcon{$_l_Row}:=False:C215
					MOD_abo_ShowLabel{$_l_Row}:=False:C215
					
				End if 
				$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Row})
				If ($_l_ModuleRow>0)
					$_l_ControlLevel:=<>Mod_al_AccessControlLevel{$_l_ModuleRow}
					$_bo_HasIcon:=<>Mod_abo_HasIcon{$_l_ModuleRow}
				Else 
					$_l_ControlLevel:=4
					$_bo_HasIcon:=False:C215
				End if 
				If ($_l_ControlLevel<3) & (MOD_abo_AccessBoolean{$_l_Row})  //The access to this module is set so that by default the access is read only..administrator needs to emphatically set it as read write for adds
					MOD_abo_ReadOnly{$_l_Row}:=True:C214
					MOD_abo_NoDeletion{$_l_Row}:=True:C214
					
				End if 
				If (Not:C34($_bo_HasIcon))
					MOD_abo_ShowLabel{$_l_Row}:=False:C215
					MOD_abo_ShowIcon{$_l_Row}:=False:C215
				End if 
				MOD_al_ModuleAccessStatus{$_l_Row}:=Num:C11(MOD_abo_AccessBoolean{$_l_Row})
				SRPrice{$_l_Row}:=Num:C11(MOD_abo_ReadOnly{$_l_Row})
				SRRate{$_l_Row}:=Num:C11(MOD_abo_NoDeletion{$_l_Row})
				If (MOD_abo_AccessBoolean{$_l_Row})
					MOD_abo_DisableVolume{$_l_Row}:=False:C215
				End if 
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_ShowLabel{$_l_Row}:=Num:C11(MOD_abo_ShowLabel{$_l_Row})
				MOD_al_DisableVolume{$_l_Row}:=Num:C11(MOD_abo_DisableVolume{$_l_Row})
				MOD_al_ModuleAccessStatus:=$_l_Row
				Modules_ArrStar($_l_Row)
				vMod3:=True:C214
				DB_bo_RecordModified:=True:C214
			: ($_t_VariableName="MOD_abo_DisableVolume")
				If (MOD_abo_DisableVolume{$_l_Row})
					Gen_Confirm("This will prevent any users in this group accessing this Module. Are you sure you"+" "+"want to do this"; "Yes"; "No")
					If (OK=0)
						MOD_abo_DisableVolume{$_l_Row}:=False:C215
					Else 
						//Disabling access so  not enabled
						MOD_abo_AccessBoolean{$_l_Row}:=False:C215
						MOD_abo_ReadOnly{$_l_Row}:=False:C215
						MOD_abo_NoDeletion{$_l_Row}:=False:C215
						MOD_abo_ShowIcon{$_l_Row}:=False:C215
						MOD_abo_ShowLabel{$_l_Row}:=False:C215
						
						
					End if 
				End if 
				MOD_al_ModuleAccessStatus{$_l_Row}:=Num:C11(MOD_abo_AccessBoolean{$_l_Row})
				SRPrice{$_l_Row}:=Num:C11(MOD_abo_ReadOnly{$_l_Row})
				SRRate{$_l_Row}:=Num:C11(MOD_abo_NoDeletion{$_l_Row})
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_ShowLabel{$_l_Row}:=Num:C11(MOD_abo_ShowLabel{$_l_Row})
				MOD_al_DisableVolume{$_l_Row}:=Num:C11(MOD_abo_DisableVolume{$_l_Row})
				MOD_al_ModuleAccessStatus:=$_l_Row
				Modules_ArrStar($_l_Row)
				vMod3:=True:C214
				DB_bo_RecordModified:=True:C214
				
			: ($_t_VariableName="MOD_abo_ReadOnly")
				If (MOD_abo_ReadOnly{$_l_Row})
					MOD_abo_NoDeletion{$_l_Row}:=True:C214
					If (MOD_abo_AccessBoolean{$_l_Row}=False:C215)
						MOD_abo_AccessBoolean{$_l_Row}:=True:C214
						MOD_abo_ShowIcon{$_l_Row}:=True:C214
						Modules_ArrStar($_l_Row)
					End if 
				End if 
				If (MOD_abo_AccessBoolean{$_l_Row})
					MOD_abo_DisableVolume{$_l_Row}:=False:C215
				End if 
				$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Row})
				If ($_l_ModuleRow>0)
					$_l_ControlLevel:=<>Mod_al_AccessControlLevel{$_l_ModuleRow}
					$_bo_HasIcon:=<>Mod_abo_HasIcon{$_l_ModuleRow}
				Else 
					$_l_ControlLevel:=4
					$_bo_HasIcon:=False:C215
				End if 
				If ($_l_ControlLevel<3) & (MOD_abo_AccessBoolean{$_l_Row})  //The access to this module is set so that by default the access is read only..administrator needs to emphatically set it as read write for adds
					MOD_abo_ReadOnly{$_l_Row}:=True:C214
					MOD_abo_NoDeletion{$_l_Row}:=True:C214
					
				End if 
				If (Not:C34($_bo_HasIcon))
					MOD_abo_ShowLabel{$_l_Row}:=False:C215
					MOD_abo_ShowIcon{$_l_Row}:=False:C215
				End if 
				
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_ModuleAccessStatus{$_l_Row}:=Num:C11(MOD_abo_AccessBoolean{$_l_Row})
				SRPrice{$_l_Row}:=Num:C11(MOD_abo_ReadOnly{$_l_Row})
				SRRate{$_l_Row}:=Num:C11(MOD_abo_NoDeletion{$_l_Row})
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_DisableVolume{$_l_Row}:=Num:C11(MOD_abo_DisableVolume{$_l_Row})
				vMod3:=True:C214
				DB_bo_RecordModified:=True:C214
			: ($_t_VariableName="MOD_abo_NoDeletion")
				If (MOD_abo_NoDeletion{$_l_Row})
					MOD_abo_ReadOnly{$_l_Row}:=True:C214
				End if 
				If ((MOD_abo_NoDeletion{$_l_Row}) & (Not:C34(MOD_abo_AccessBoolean{$_l_Row})))
					MOD_abo_AccessBoolean{$_l_Row}:=True:C214
					MOD_abo_ShowIcon{$_l_Row}:=True:C214
					Modules_ArrStar($_l_Row)
				End if 
				If (MOD_abo_AccessBoolean{$_l_Row})
					MOD_abo_DisableVolume{$_l_Row}:=False:C215
				End if 
				$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Row})
				If ($_l_ModuleRow>0)
					$_l_ControlLevel:=<>Mod_al_AccessControlLevel{$_l_ModuleRow}
					$_bo_HasIcon:=<>Mod_abo_HasIcon{$_l_ModuleRow}
				Else 
					$_l_ControlLevel:=4
					$_bo_HasIcon:=False:C215
				End if 
				If ($_l_ControlLevel<3) & (MOD_abo_AccessBoolean{$_l_Row})  //The access to this module is set so that by default the access is read only..administrator needs to emphatically set it as read write for adds
					MOD_abo_ReadOnly{$_l_Row}:=True:C214
					MOD_abo_NoDeletion{$_l_Row}:=True:C214
					
				End if 
				If (Not:C34($_bo_HasIcon))
					MOD_abo_ShowLabel{$_l_Row}:=False:C215
					MOD_abo_ShowIcon{$_l_Row}:=False:C215
				End if 
				
				vMod3:=True:C214
				DB_bo_RecordModified:=True:C214
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_ModuleAccessStatus{$_l_Row}:=Num:C11(MOD_abo_AccessBoolean{$_l_Row})
				SRPrice{$_l_Row}:=Num:C11(MOD_abo_ReadOnly{$_l_Row})
				SRRate{$_l_Row}:=Num:C11(MOD_abo_NoDeletion{$_l_Row})
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_DisableVolume{$_l_Row}:=Num:C11(MOD_abo_DisableVolume{$_l_Row})
			: ($_t_VariableName="MOD_abo_ShowIcon")
				If ((MOD_abo_ShowIcon{$_l_Row}) & (Not:C34(MOD_abo_AccessBoolean{$_l_Row})))
					
					
					MOD_abo_AccessBoolean{$_l_Row}:=True:C214
				End if 
				$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Row})
				If ($_l_ModuleRow>0)
					$_l_ControlLevel:=<>Mod_al_AccessControlLevel{$_l_ModuleRow}
					$_bo_HasIcon:=<>Mod_abo_HasIcon{$_l_ModuleRow}
				Else 
					$_l_ControlLevel:=4
					$_bo_HasIcon:=False:C215
				End if 
				If ($_l_ControlLevel<3) & (MOD_abo_AccessBoolean{$_l_Row})  //The access to this module is set so that by default the access is read only..administrator needs to emphatically set it as read write for adds
					MOD_abo_ReadOnly{$_l_Row}:=True:C214
					MOD_abo_NoDeletion{$_l_Row}:=True:C214
					
				End if 
				If (Not:C34($_bo_HasIcon))
					If (MOD_abo_ShowIcon{$_l_Row})
						Gen_Alert("This Volume Does not have a volume access icon"; "OK")
					End if 
					MOD_abo_ShowLabel{$_l_Row}:=False:C215
					MOD_abo_ShowIcon{$_l_Row}:=False:C215
				End if 
				
				Modules_ArrStar($_l_Row)
				
				If (MOD_abo_AccessBoolean{$_l_Row})
					MOD_abo_DisableVolume{$_l_Row}:=False:C215
				End if 
				MOD_al_ModuleAccessStatus{$_l_Row}:=Num:C11(MOD_abo_AccessBoolean{$_l_Row})
				SRPrice{$_l_Row}:=Num:C11(MOD_abo_ReadOnly{$_l_Row})
				SRRate{$_l_Row}:=Num:C11(MOD_abo_NoDeletion{$_l_Row})
				If (MOD_abo_AccessBoolean{$_l_Row})
					MOD_abo_DisableVolume{$_l_Row}:=False:C215
				End if 
				MOD_al_ShowIcon{$_l_Row}:=Num:C11(MOD_abo_ShowIcon{$_l_Row})
				MOD_al_ShowLabel{$_l_Row}:=Num:C11(MOD_abo_ShowLabel{$_l_Row})
				MOD_al_DisableVolume{$_l_Row}:=Num:C11(MOD_abo_DisableVolume{$_l_Row})
				
				vMod3:=True:C214
				DB_bo_RecordModified:=True:C214
				
			: ($_t_VariableName="MOD_abo_ShowLabel")  //Not currently displayed
				MOD_al_ShowLabel{$_l_Row}:=Num:C11(MOD_abo_ShowLabel{$_l_Row})
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.oVolumeAccess"; $_t_oldMethodName)
