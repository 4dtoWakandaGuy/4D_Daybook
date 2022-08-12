//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_ListsS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; <>PER_l_AccessLevel; $_l_MenuProc; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_ListsS")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
Check_Mod(Module_DataManager; "Data Manager")
If (OK=1)
	If (<>Bar#47) | (MENU_bo_Overwrite)
		Menu_ModEnable
		<>Bar:=47
		
		<>MENU_l_BarModule:=Module_DataManager
		<>BarPos:=5
		DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
		Menu_DisFile
		Menu_ListsP
		If ((DB_GetModuleSettingByNUM(Module_Macros))<2)  //Macros"
			DB_MenuAction("Core"; "  Macros"; 3; ""; $_l_MenuProc; False:C215)
			//DISABLE MENU ITEM(3;15;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_StockControl))#2)
			DB_MenuAction("Utilities"; "Consolidate Stock Levels"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Utilities"; "Recreate Stock Levels"; 3; ""; $_l_MenuProc; False:C215)
			//DISABLE MENU ITEM(6;11;◊MenuProc)
			//DISABLE MENU ITEM(6;12;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(30))#2)
			DB_MenuAction("Core"; "  Record States"; 3; ""; $_l_MenuProc; False:C215)
			// DISABLE MENU ITEM(3;18;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting)#2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)#2))
			DB_MenuAction("Others"; "  Order & Job Types"; 3; ""; $_l_MenuProc; False:C215)
			//  DISABLE MENU ITEM(5;6;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))#2)
			DB_MenuAction("Others"; "  Personnel Categories"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Others"; "  Job Stages"; 3; ""; $_l_MenuProc; False:C215)
			//  DISABLE MENU ITEM(5;7;◊MenuProc)
			//   DISABLE MENU ITEM(5;8;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(40))=0)  //not international
			DB_MenuAction("Core"; "  Terminology"; 3; ""; $_l_MenuProc; False:C215)
			// DISABLE MENU ITEM(3;17;◊MenuProc)
		End if 
		If (Not:C34(((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)=2)) | (<>PER_l_AccessLevel=0)))
			DB_MenuAction("Core"; "  Change Password"; 3; ""; $_l_MenuProc; False:C215)
			//DISABLE MENU ITEM(3;11;◊MenuProc)  `disable the Password item
		End if 
		If ((Not:C34(User in group:C338(Current user:C182; "Administrator"))) & (Not:C34(User in group:C338(Current user:C182; "4D write group"))) & (Not:C34(User in group:C338(Current user:C182; "Designer"))))
			DB_MenuAction("Core"; "Create Startup_Import File  "; 3; ""; $_l_MenuProc; False:C215)
			//DISABLE MENU ITEM(6;14;◊MenuProc)
		End if 
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_ListsS"; $_t_oldMethodName)
