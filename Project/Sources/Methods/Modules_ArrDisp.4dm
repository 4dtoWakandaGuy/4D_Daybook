//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_ArrDisp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2012 15:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Mod_abo_HasIcon;0)
	ARRAY BOOLEAN:C223($_abo_DisableVolume; 0)
	ARRAY BOOLEAN:C223($_abo_NoDeletions; 0)
	ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
	ARRAY BOOLEAN:C223($_abo_RunStartup; 0)
	ARRAY BOOLEAN:C223($_abo_ShowIcon; 0)
	ARRAY BOOLEAN:C223($_abo_ShowInToolbar; 0)
	//ARRAY BOOLEAN(MOD_abo_AccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_DisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_InitStartup;0)
	//ARRAY BOOLEAN(MOD_abo_NoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_ReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_ShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_ModuleCode; 0)
	ARRAY TEXT:C222($_at_ModuleNames; 0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleStartName;0)
	C_BOOLEAN:C305($_bo_HasIcon; vMod3)
	C_LONGINT:C283($_l_Index; $_l_ModuleNameRow; $_l_ModuleRow; $_l_ModuleStartRow; $_l_RecordsinSelection; $_l_ShowLabelPosition; $_l_SizeofModuleArray; PER_l_ShowText)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_ArrDisp")
//Modules_ArrDisp - put in the before of Personnel/Groups to load in the array
//TRACE
COPY ARRAY:C226(<>Mod_at_ModuleName; MOD_at_ModuleName)
//Gen_Alert ("1_"+String(Size of array(MOD_at_ModuleName)))

COPY ARRAY:C226(MOD_at_ModuleName; MOD_at_ModuleStartName)
$_l_SizeofModuleArray:=Size of array:C274(MOD_at_ModuleName)
$_l_ModuleNameRow:=1
$_l_ModuleStartRow:=1
For ($_l_Index; 1; $_l_SizeofModuleArray)
	If ((DB_GetModuleSettingByNUM($_l_Index))=0)
		DELETE FROM ARRAY:C228(MOD_at_ModuleName; $_l_ModuleNameRow; 1)
		DELETE FROM ARRAY:C228(MOD_at_ModuleStartName; $_l_ModuleStartRow; 1)
	Else 
		$_l_ModuleNameRow:=$_l_ModuleNameRow+1
		
		If ($_l_Index<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{$_l_Index}="")
				DELETE FROM ARRAY:C228(MOD_at_ModuleStartName; $_l_ModuleStartRow; 1)
			Else 
				$_l_ModuleStartRow:=$_l_ModuleStartRow+1
			End if 
		End if 
		
	End if 
End for 
//Gen_Alert ("2_"+String(Size of array(MOD_at_ModuleName)))
ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; 0)
ARRAY BOOLEAN:C223(MOD_abo_AccessBoolean; 0)  //For Listbox area
ARRAY REAL:C219(SRPrice; 0)
ARRAY BOOLEAN:C223(MOD_abo_ReadOnly; 0)  //For listbox area
ARRAY REAL:C219(SRRate; 0)
ARRAY BOOLEAN:C223(MOD_abo_NoDeletion; 0)
ARRAY LONGINT:C221(MOD_al_ShowIcon; 0)
ARRAY BOOLEAN:C223(MOD_abo_ShowIcon; 0)
ARRAY LONGINT:C221(MOD_al_ShowLabel; 0)
ARRAY BOOLEAN:C223(MOD_abo_ShowLabel; 0)
ARRAY LONGINT:C221(MOD_al_DisableVolume; 0)
ARRAY BOOLEAN:C223(MOD_abo_DisableVolume; 0)
$_l_SizeofModuleArray:=Size of array:C274(MOD_at_ModuleName)
ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_AccessBoolean; $_l_SizeofModuleArray)  //For Listbox area
ARRAY REAL:C219(SRPrice; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_ReadOnly; $_l_SizeofModuleArray)  //For listbox area
ARRAY REAL:C219(SRRate; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_NoDeletion; $_l_SizeofModuleArray)
ARRAY LONGINT:C221(MOD_al_ShowIcon; $_l_SizeofModuleArray)
ARRAY LONGINT:C221(MOD_al_ShowLabel; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_ShowIcon; $_l_SizeofModuleArray)
ARRAY LONGINT:C221(MOD_al_InitStartup; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_InitStartup; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_ShowLabel; $_l_SizeofModuleArray)
ARRAY LONGINT:C221(MOD_al_DisableVolume; $_l_SizeofModuleArray)
ARRAY BOOLEAN:C223(MOD_abo_DisableVolume; $_l_SizeofModuleArray)
ARRAY TEXT:C222($_at_ModuleCode; 0)
ARRAY TEXT:C222($_at_ModuleNames; 0)
ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
ARRAY BOOLEAN:C223($_abo_NoDeletions; 0)
ARRAY BOOLEAN:C223($_abo_ShowInToolbar; 0)
ARRAY BOOLEAN:C223($_abo_ShowIcon; 0)
ARRAY BOOLEAN:C223($_abo_DisableVolume; 0)
$_l_RecordsinSelection:=Records in selection:C76([MODULES:63])
If ($_l_RecordsinSelection>0)
	SELECTION TO ARRAY:C260([MODULES:63]Module:2; $_at_ModuleNames; [MODULES:63]Read_Only:3; $_abo_ReadOnly; [MODULES:63]No_Deletions:4; $_abo_NoDeletions; [MODULES:63]xDisplayIcon:5; $_abo_ShowInToolbar; [MODULES:63]xDisplayIconText:6; $_abo_ShowIcon; [MODULES:63]XRunStartupInit:8; $_abo_RunStartup; [MODULES:63]xDisableModule:7; $_abo_DisableVolume)
	
	For ($_l_Index; 1; $_l_SizeofModuleArray)
		$_l_ModuleRow:=Find in array:C230($_at_ModuleNames; MOD_at_ModuleName{$_l_Index})
		If ($_l_ModuleRow>0)
			If ($_abo_DisableVolume{$_l_ModuleRow}=False:C215)
				MOD_al_ModuleAccessStatus{$_l_Index}:=1
			End if 
			MOD_abo_AccessBoolean{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
			If ($_abo_ReadOnly{$_l_ModuleRow})
				SRPrice{$_l_Index}:=1
				SRRate{$_l_Index}:=1
			Else 
				SRPrice{$_l_Index}:=0
				If ($_abo_NoDeletions{$_l_ModuleRow})
					SRRate{$_l_Index}:=1
				Else 
					SRRate{$_l_Index}:=0
				End if 
			End if 
			$_l_ShowLabelPosition:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Index})
			If ($_l_ShowLabelPosition>0)
				$_bo_HasIcon:=<>Mod_abo_HasIcon{$_l_ShowLabelPosition}
			Else 
				$_bo_HasIcon:=True:C214
			End if 
			MOD_abo_AccessBoolean{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
			MOD_abo_ReadOnly{$_l_Index}:=(SRPrice{$_l_Index}=1)
			MOD_abo_NoDeletion{$_l_Index}:=(SRRate{$_l_Index}=1)
			If ($_bo_HasIcon)
				MOD_al_ShowIcon{$_l_Index}:=Num:C11($_abo_ShowInToolbar{$_l_ModuleRow})
				MOD_al_ShowLabel{$_l_Index}:=Num:C11($_abo_ShowIcon{$_l_ModuleRow})
			Else 
				MOD_al_ShowIcon{$_l_Index}:=0
				MOD_al_ShowLabel{$_l_Index}:=0
			End if 
			MOD_al_DisableVolume{$_l_Index}:=Num:C11($_abo_DisableVolume{$_l_ModuleRow})
			MOD_abo_DisableVolume{$_l_Index}:=MOD_al_DisableVolume{$_l_Index}=1
			
			MOD_abo_ShowIcon{$_l_Index}:=(MOD_al_ShowIcon{$_l_Index}=1)
			MOD_abo_ShowLabel{$_l_Index}:=(MOD_al_ShowLabel{$_l_Index}=1)
			MOD_al_InitStartup{$_l_Index}:=Num:C11($_abo_RunStartup{$_l_ModuleRow})
			MOD_abo_InitStartup{$_l_Index}:=(MOD_al_InitStartup{$_l_Index}=1)
		Else 
			$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleStartName; MOD_at_ModuleName{$_l_Index})
			If ($_l_ModuleRow>0)
				DELETE FROM ARRAY:C228(MOD_at_ModuleStartName; $_l_ModuleRow; 1)
			End if 
			MOD_al_ModuleAccessStatus{$_l_Index}:=0
			SRPrice{$_l_Index}:=0
			SRRate{$_l_Index}:=0
			MOD_abo_AccessBoolean{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
			MOD_abo_ReadOnly{$_l_Index}:=(SRPrice{$_l_Index}=1)
			MOD_abo_NoDeletion{$_l_Index}:=(SRRate{$_l_Index}=1)
			MOD_al_ShowIcon{$_l_Index}:=0
			MOD_al_ShowLabel{$_l_Index}:=0
			MOD_abo_ShowIcon{$_l_Index}:=(MOD_al_ShowIcon{$_l_Index}=1)
			MOD_abo_ShowLabel{$_l_Index}:=(MOD_al_ShowLabel{$_l_Index}=1)
			MOD_al_InitStartup{$_l_Index}:=0
			MOD_abo_InitStartup{$_l_Index}:=(MOD_al_InitStartup{$_l_Index}=1)
			MOD_al_DisableVolume{$_l_Index}:=0
			MOD_abo_DisableVolume{$_l_Index}:=False:C215
		End if 
	End for 
Else 
	For ($_l_Index; 1; $_l_SizeofModuleArray)
		MOD_al_ModuleAccessStatus{$_l_Index}:=1
		SRPrice{$_l_Index}:=0
		SRRate{$_l_Index}:=0
		MOD_al_ShowIcon{$_l_Index}:=0
		MOD_al_ShowLabel{$_l_Index}:=0
		MOD_abo_AccessBoolean{$_l_Index}:=(MOD_al_ModuleAccessStatus{$_l_Index}=1)
		MOD_abo_ReadOnly{$_l_Index}:=(SRPrice{$_l_Index}=1)
		MOD_abo_NoDeletion{$_l_Index}:=(SRRate{$_l_Index}=1)
		MOD_abo_ShowIcon{$_l_Index}:=(MOD_al_ShowIcon{$_l_Index}=1)
		MOD_abo_ShowLabel{$_l_Index}:=(MOD_al_ShowLabel{$_l_Index}=1)
		MOD_al_InitStartup{$_l_Index}:=0
		MOD_abo_InitStartup{$_l_Index}:=False:C215
		MOD_al_DisableVolume{$_l_Index}:=0
		MOD_abo_DisableVolume{$_l_Index}:=False:C215
	End for 
End if 
SORT ARRAY:C229(MOD_at_ModuleName; MOD_al_ModuleAccessStatus; SRPrice; SRRate; MOD_al_ShowIcon; MOD_al_ShowLabel; MOD_abo_AccessBoolean; MOD_abo_ReadOnly; MOD_abo_NoDeletion; MOD_abo_ShowIcon; MOD_abo_ShowLabel; MOD_al_InitStartup; MOD_abo_InitStartup; MOD_al_DisableVolume; MOD_abo_DisableVolume; >)

$_l_ShowLabelPosition:=Find in array:C230(MOD_abo_ShowLabel; True:C214)
If ($_l_ShowLabelPosition>0)
	PER_l_ShowText:=1
End if 
Modules_ArrDCl
vMod3:=False:C215

SORT ARRAY:C229(MOD_at_ModuleStartName; >)
MOD_at_ModuleStartName:=Find in array:C230(MOD_at_ModuleStartName; $1)
If (MOD_at_ModuleStartName<0)
	MOD_at_ModuleStartName:=0
End if 
//Gen_Alert ("3_"+String(Size of array(MOD_at_ModuleName)))
ERR_MethodTrackerReturn("Modules_ArrDisp"; $_t_oldMethodName)
