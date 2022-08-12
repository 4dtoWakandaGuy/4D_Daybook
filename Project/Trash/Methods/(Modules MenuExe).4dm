//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Modules MenuExe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MENU_bo_Overwrite)
	C_LONGINT:C283(<>Bar; <>MenuProc; $_l_MenuProc; $2)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; $1; $3; $4; $5; DB_t_MainMenu; DB_t_MenusFormat; DB_t_MenusSetting; Db_t_MenuType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Modules MenuExe")

//Modules MenuExe - replacing an Execute

If (Count parameters:C259>=3)
	Db_t_MenuType:=$3
Else 
	Db_t_MenuType:="4D Menu"
End if 
If (Count parameters:C259>=4)
	DB_t_MenusFormat:=$4
Else 
End if 
If (Count parameters:C259>=5)
	DB_t_MenusSetting:=$5  //tell the system if this is a web context so we dont set interprocess vars
End if 
If (Count parameters:C259>=2)
	$_l_MenuProc:=$2
Else 
	$_l_MenuProc:=<>MenuProc
End if 
//the type tells the system to put the menu inot arrays instead of a menu
//this allows it to be used for purposes other than WEB, the format tells the system to turn that into a JSON string
If (Db_t_MenuType="4D menu")
	//DB_t_MainMenu:=Create menu
End if 

//DB_T_VolumesMenu:=DB_BuildVolumesMenu
//Note that the JSON format does not complete the menu build string here because there may be other menus to append to the beginning or end
//the completed menu bar has a "{" and "}" added.

Case of 
	: ($1="Menu_Main")
		Menu_Main($_l_MenuProc)
	: ($1="Menu_Silver")
		Menu_Silver($_l_MenuProc)
	: ($1="Menu_WP")
		Menu_WP($_l_MenuProc)
	: ($1="Menu_Stock")
		Menu_Stock($_l_MenuProc)
	: ($1="Menu_SOP")
		Menu_SOP(Db_t_MenuType; DB_t_MenusFormat; DB_t_MenusSetting; $_l_MenuProc)
	: ($1="Menu_POP")
		Menu_POP($_l_MenuProc)
	: ($1="Menu_Sales")
		Menu_Sales($_l_MenuProc)
	: ($1="Menu_Purch")
		Menu_Purch($_l_MenuProc)
	: ($1="Menu_Nom")
		Menu_Nom($_l_MenuProc)
	: ($1="Menu_Tech")
		Menu_Tech($_l_MenuProc)
	: ($1="Menu_Jobs")
		Menu_Jobs($_l_MenuProc)
	: ($1="Menu_SilverP")
		Menu_SilverP($_l_MenuProc)
	: ($1="Menu_Remote")
		Menu_Remote($_l_MenuProc)
	: ($1="Menu_Lists")
		If ((DB_GetModuleSettingByNUM(1))=5)
			Menu_ListsS($_l_MenuProc)
		Else 
			Menu_Lists($_l_MenuProc)
		End if 
	: ($1="Menu_CM")
		Menu_CM($_l_MenuProc)
		// menu sm
		//    "Menu Ad"
		//"Menu Quark"
		//"Menu_Remote"
	Else 
		If (MENU_bo_Overwrite)
			<>Bar:=0
			MENU_bo_Overwrite:=False:C215
		End if 
		//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
		//EXECUTE FORMULA($1)
		$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
		EXECUTE METHOD:C1007($_t_ExecuteMethodName)
		
End case 
ERR_MethodTrackerReturn("Modules MenuExe"; $_t_oldMethodName)
