//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_DisFile2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FindMy; <>OneEntry; <>SYS_bo_DefaultEntry; <>SYS_bo_DefaultsFind; <>SYS_bo_StatsView)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_AccessType; <>SYS_t_FormSizeName; $_t_FileMenuName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_DisFile2")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//$St:=6+Menu_FileSG 

//DISABLE ITEM(1;$St+1;◊MenuProc)  `9" is currently disabled in v4
<>SYS_t_FormSizeName:="13"
//If (◊Screen="13")
//  CHECK ITEM(1;$St+1;"18";◊MenuProc)  `13" Screens
//End if
$_t_FileMenuName:=Get localized string:C991("Menu_File")
If (<>SYS_bo_DefaultEntry)
	DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Entrydefaults"); 4; "18"; <>MenuProc; False:C215)
	
End if 
If (<>SYS_bo_DefaultsFind)
	DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finddefaults"); 4; "18"; <>MenuProc; False:C215)
	
End if 
If (Not:C34((DB_GetModuleSettingByNUM(1)=5) & ((<>MENU_l_BarModule=1) | (<>MENU_l_BarModule=30) | (<>Bar=47) | (<>Bar=89) | (<>Bar=90))))
	If (<>FindMy)
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finduserdata"); 4; "18"; <>MenuProc; False:C215)
		
	End if 
	DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Finduserdata"); 1; "Find "+<>PER_t_CurrentUserInitials+" Data"; <>MenuProc; False:C215)
	
	If (<>OneEntry=False:C215)
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; "18"; <>MenuProc; False:C215)
		
	End if 
	
	
	If (<>SYS_t_AccessType="Q")
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Statisticsview"); 4; "18"; <>MenuProc; False:C215)
		
	End if 
	
	If (<>SYS_bo_StatsView)
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Statisticsview"); 4; "18"; <>MenuProc; False:C215)
		
	End if 
	
	If (Is Windows:C1573)
		
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Statisticsview"); 3; ""; <>MenuProc; False:C215)
		
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Quittouser"); 1; "Exit to User"; <>MenuProc; False:C215)
		
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Quit"); 1; "Exit"; <>MenuProc; False:C215)
		
	End if 
Else 
	
	If (Is Windows:C1573)
		
		DB_MenuAction($_t_FileMenuName; Get localized string:C991("MenuItem_Quit"); 1; "Exit"; <>MenuProc; False:C215)
		
	End if 
End if 
ERR_MethodTrackerReturn("Menu_DisFile2"; $_t_oldMethodName)
