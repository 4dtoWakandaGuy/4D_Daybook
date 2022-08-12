//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Modules ArrDCl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//Array BOOLEAN(MOD_abo_DisableVolume;0)
	//Array BOOLEAN(MOD_abo_InitStartup;0)
	//Array LONGINT(MOD_al_ModuleAccessStatus;0)
	//Array LONGINT(MOD_al_DisableVolume;0)
	//Array LONGINT(MOD_al_InitStartup;0)
	//Array LONGINT(MOD_al_ShowIcon;0)
	//Array LONGINT(MOD_al_ShowLabel;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules ArrDCl")
//Modules ArrDCl - Array clear
MOD_at_ModuleName:=0
MOD_al_ModuleAccessStatus:=0
SRPrice:=0
SRRate:=0
MOD_al_ShowIcon:=0
MOD_al_ShowLabel:=0
MOD_al_DisableVolume:=0
MOD_abo_DisableVolume:=0
MOD_al_InitStartup:=0
MOD_abo_InitStartup:=0
ERR_MethodTrackerReturn("Modules ArrDCl"; $_t_oldMethodName)