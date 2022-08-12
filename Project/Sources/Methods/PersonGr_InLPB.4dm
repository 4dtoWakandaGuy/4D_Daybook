//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonGr_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(MOD_abo_AccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_DisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_InitStartup;0)
	//ARRAY BOOLEAN(MOD_abo_NoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_ReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_ShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(vMod2)
	C_LONGINT:C283($_l_Index; $_l_ModuleRow; vNo2; vNo3)
	C_TEXT:C284($_t_oldMethodName; vButtDisPerGroup)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InLPB")
vNo2:=0
vNo3:=0
vMod2:=False:C215
PersonGr_InLPNo(0)
If ([PERSONNEL_GROUPS:92]Group_Code:1#"")
	GOTO OBJECT:C206([PERSONNEL_GROUPS:92]Group_Name:2)
	QUERY:C277([MODULES:63]; [MODULES:63]Code:1=("^G"+[PERSONNEL_GROUPS:92]Group_Code:1))
Else 
	REDUCE SELECTION:C351([MODULES:63]; 0)
End if 
Modules_ArrDisp([PERSONNEL_GROUPS:92]Start_Module:4)
//I want to ONLY show modules that can have access set. other modules get access based on the licence
SORT ARRAY:C229(MOD_at_ModuleName; MOD_al_ModuleAccessStatus; SRPrice; SRRate; MOD_al_ShowIcon; MOD_al_ShowLabel; MOD_abo_AccessBoolean; MOD_abo_ReadOnly; MOD_abo_NoDeletion; MOD_abo_ShowIcon; MOD_abo_ShowLabel; MOD_al_InitStartup; MOD_abo_InitStartup; MOD_al_DisableVolume; MOD_abo_DisableVolume; >)


For ($_l_Index; Size of array:C274(MOD_at_ModuleName); 1; -1)
	$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Index})
	If (<>Mod_al_AccessControlLevel{$_l_ModuleRow}<2)  //access is controlled by licence and is availbable to all groups so remove from the screen(make sure you save the access though)
		DELETE FROM ARRAY:C228(MOD_al_ModuleAccessStatus; $_l_Index)
		
		DELETE FROM ARRAY:C228(MOD_at_ModuleName; $_l_Index)
		DELETE FROM ARRAY:C228(SRPrice; $_l_Index)
		DELETE FROM ARRAY:C228(SRRate; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_al_ShowIcon; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_al_ShowLabel; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_AccessBoolean; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_ReadOnly; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_NoDeletion; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_ShowIcon; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_ShowLabel; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_al_InitStartup; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_InitStartup; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_abo_DisableVolume; $_l_Index)
		DELETE FROM ARRAY:C228(MOD_al_DisableVolume; $_l_Index)
		
		
	End if 
End for 
vButtDisPerGroup:="I       FSSSRCADT"
Input_Buttons(->[PERSONNEL_GROUPS:92]; ->vButtDisPerGroup)
Macro_AccType("Load "+String:C10(Table:C252(->[PERSONNEL_GROUPS:92])))
ERR_MethodTrackerReturn("PersonGr_InLPB"; $_t_oldMethodName)