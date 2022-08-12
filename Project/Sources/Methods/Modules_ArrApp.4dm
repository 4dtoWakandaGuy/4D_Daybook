//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_ArrApp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 16:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_DisableModule; 0)
	ARRAY BOOLEAN:C223($_abo_NoDeletions; 0)
	ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
	ARRAY BOOLEAN:C223($_abo_RunAtStartup; 0)
	ARRAY BOOLEAN:C223($_abo_ShowInToolbar; 0)
	ARRAY BOOLEAN:C223($_abo_ShowTitle; 0)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	ARRAY TEXT:C222($_at_Module; 0)
	ARRAY TEXT:C222($_at_ModuleCode; 0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283($_l_Index; $_l_ModuleRow; $_l_NumberofModules; $_l_RecordsinSelection; PER_l_ShowText)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_ArrApp")
//Modules_ArrApp - Array Apply

READ WRITE:C146([MODULES:63])
QUERY:C277([MODULES:63]; [MODULES:63]Code:1=$1)

$_l_RecordsinSelection:=Records in selection:C76([MODULES:63])
ARRAY TEXT:C222($_at_ModuleCode; 0)
ARRAY TEXT:C222($_at_Module; 0)
ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
ARRAY BOOLEAN:C223($_abo_NoDeletions; 0)
ARRAY BOOLEAN:C223($_abo_ShowInToolbar; 0)
ARRAY BOOLEAN:C223($_abo_ShowTitle; 0)
ARRAY BOOLEAN:C223($_abo_RunAtStartup; 0)
ARRAY BOOLEAN:C223($_abo_DisableModule; 0)

//Gen_Alert ("3_"+String(Size of array(MOD_at_ModuleName)))
$_l_NumberofModules:=Size of array:C274(MOD_at_ModuleName)
$_l_Index:=0
While ($_l_Index<=$_l_NumberofModules)
	IDLE:C311  // 7/04/03 pb
	If ((MOD_al_ModuleAccessStatus{$_l_Index}#1) | (SRPrice{$_l_Index}#0) | (SRRate{$_l_Index}#0))
		$_l_Index:=9999
	Else 
		$_l_Index:=$_l_Index+1
	End if 
End while 

If ($_l_Index#9999)  //All are specified so no records needed
	DELETE SELECTION:C66([MODULES:63])
Else 
	
	$_l_ModuleRow:=0
	For ($_l_Index; 1; $_l_NumberofModules)
		If (MOD_al_ModuleAccessStatus{$_l_Index}=1) | (MOD_al_DisableVolume{$_l_Index}=1)
			
			$_l_ModuleRow:=$_l_ModuleRow+1
			INSERT IN ARRAY:C227($_at_ModuleCode; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_at_Module; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_ReadOnly; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_NoDeletions; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_ShowInToolbar; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_ShowTitle; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_RunAtStartup; $_l_ModuleRow; 1)
			INSERT IN ARRAY:C227($_abo_DisableModule; $_l_ModuleRow; 1)
			
			//NG march 2008--no need to write back from the other arrays(booleans)-they are only for display
			$_at_ModuleCode{$_l_ModuleRow}:=$1
			$_at_Module{$_l_ModuleRow}:=MOD_at_ModuleName{$_l_Index}
			$_abo_ReadOnly{$_l_ModuleRow}:=(SRPrice{$_l_Index}=1)
			$_abo_NoDeletions{$_l_ModuleRow}:=(SRRate{$_l_Index}=1)
			$_abo_ShowInToolbar{$_l_ModuleRow}:=(MOD_al_ShowIcon{$_l_Index}=1)
			If (MOD_al_ShowLabel{$_l_Index}=1) | (PER_l_ShowText=1)
				
				$_abo_ShowTitle{$_l_ModuleRow}:=True:C214
			Else 
				$_abo_ShowTitle{$_l_ModuleRow}:=(MOD_al_ShowLabel{$_l_Index}=1)
			End if 
			$_abo_RunAtStartup{$_l_ModuleRow}:=(MOD_al_InitStartup{$_l_Index}=1)
			$_abo_DisableModule{$_l_ModuleRow}:=(MOD_al_DisableVolume{$_l_Index}=1)
			
		End if 
	End for 
	//NG September 2008..add in the hidden modules....
	If (Not:C34(DB_bo_ModuleSettingsinited))
		Check_Modules
		DB_bo_ModuleSettingsinited:=True:C214
	End if 
	For ($_l_Index; 1; Size of array:C274(<>Mod_at_ModuleName))
		If (<>Mod_al_AccessControlLevel{$_l_Index}=1)
			If ((DB_aI_aMod{$_l_Index}#0))
				$_l_ModuleRow:=$_l_ModuleRow+1
				INSERT IN ARRAY:C227($_at_ModuleCode; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_at_Module; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_ReadOnly; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_NoDeletions; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_ShowInToolbar; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_ShowTitle; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_RunAtStartup; $_l_ModuleRow; 1)
				INSERT IN ARRAY:C227($_abo_DisableModule; $_l_ModuleRow; 1)
				//NG march 2008--no need to write back from the other arrays(booleans)-they are only for display
				$_at_ModuleCode{$_l_ModuleRow}:=$1
				$_at_Module{$_l_ModuleRow}:=<>Mod_at_ModuleName{$_l_Index}
				$_abo_ReadOnly{$_l_ModuleRow}:=False:C215
				$_abo_NoDeletions{$_l_ModuleRow}:=False:C215
				$_abo_ShowInToolbar{$_l_ModuleRow}:=False:C215
				$_abo_ShowTitle{$_l_ModuleRow}:=False:C215
				$_abo_RunAtStartup{$_l_ModuleRow}:=False:C215
				$_abo_DisableModule{$_l_ModuleRow}:=False:C215
			End if 
		End if 
	End for 
	If ($_l_ModuleRow<$_l_RecordsinSelection)
		DELETE SELECTION:C66([MODULES:63])
	End if 
	TRACE:C157
	ARRAY TO SELECTION:C261($_at_ModuleCode; [MODULES:63]Code:1; $_at_Module; [MODULES:63]Module:2; $_abo_ReadOnly; [MODULES:63]Read_Only:3; $_abo_NoDeletions; [MODULES:63]No_Deletions:4; $_abo_ShowInToolbar; [MODULES:63]xDisplayIcon:5; $_abo_ShowTitle; [MODULES:63]xDisplayIconText:6; $_abo_DisableModule; [MODULES:63]xDisableModule:7; $_abo_RunAtStartup; [MODULES:63]XRunStartupInit:8)  //KMW 07/10/08 v631b120, added ";$_abo_RunAtStartup;[MODULES]XRunStartupInit)"
	
	
	READ ONLY:C145([MODULES:63])
	UNLOAD RECORD:C212([MODULES:63])
	
End if 
ERR_MethodTrackerReturn("Modules_ArrApp"; $_t_oldMethodName)