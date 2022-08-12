//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu Remote
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>BarPos)
	//C_UNKNOWN(<>MenuProc)
	C_BOOLEAN:C305(MENU_bo_Overwrite)
	C_LONGINT:C283(<>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $1; <>BAR; <>MENU_l_BarModule; $_l_MenuProc; $1)
	C_TEXT:C284($_t_oldMethodName; <>SYS_t_MainorRemote; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu Remote")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
If ((DB_GetModuleSettingByNUM(21)<2) & (DB_GetModuleSettingByNUM(32)<2) & (DB_GetModuleSettingByNUM(Module_IntServer)<2))
	Gen_AlertAcc("Communications")
	
Else 
	If (<>Bar#14) | (MENU_bo_Overwrite)
		Menu_ModEnable
		<>Bar:=14
		<>MENU_l_BarModule:=21
		<>BarPos:=15  //19
		DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
		Menu_DisComp
		Menu_DisFile
		If ((DB_GetModuleSettingByNUM(21))<2)
			DB_MenuAction("Remote Access"; ""; 3; ""; $_l_MenuProc; False:C215)
			//   DISABLE MENU ITEM(4;0;◊MenuProc)
		Else 
			
			If (Not:C34(User in group:C338(Current user:C182; "Designer")))
				If (<>SYS_t_MainorRemote="R")
					DB_MenuAction("Remote Access"; "  Start Automatic Process"; 3; ""; $_l_MenuProc; False:C215)
					DB_MenuAction("Remote Access"; "  Download & Upload Data  "; 3; ""; $_l_MenuProc; False:C215)
					//DISABLE MENU ITEM(4;2;◊MenuProc)
					//DISABLE MENU ITEM(4;3;◊MenuProc)
				Else 
					DB_MenuAction("Remote Access"; "  Upload & Download Data"; 3; ""; $_l_MenuProc; False:C215)
					// DISABLE MENU ITEM(4;6;◊MenuProc)
				End if 
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(32))<2)
			DB_MenuAction("Telephony"; ""; 3; ""; $_l_MenuProc; False:C215)
			//  DISABLE MENU ITEM(5;0;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_IntServer))<2)
			DB_MenuAction("Internet"; ""; 3; ""; $_l_MenuProc; False:C215)
			// DISABLE MENU ITEM(6;0;◊MenuProc)
		End if 
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu Remote"; $_t_oldMethodName)
