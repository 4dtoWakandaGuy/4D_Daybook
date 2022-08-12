//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_ModName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2010 09:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; $_bo_InRecordListing; $0; $5; DB_bo_InRecordListing)
	C_LONGINT:C283(<>AutoProc; <>Mod_l_MaxModules; $_l_TableNumber; MOD_l_CurrentModuleAccess; vAdd; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; $3; $4; $6; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_ModName")
//Minor_ModName
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
Start_Process

If (Position:C15("_"; $2)=0)
	FORM SET INPUT:C55($1->; $2+"_In")  //  `NG April 2004 Removed $3
	WIN_t_CurrentInputForm:=$2+"_In"
	FORM SET OUTPUT:C54($1->; $2+" Out")
	
	WIN_t_CurrentOutputform:=$2+" Out"
Else 
	FORM SET INPUT:C55($1->; $2+"Input")  //  `NG April 2004 Removed $3
	WIN_t_CurrentInputForm:=$2+"Input"
	FORM SET OUTPUT:C54($1->; $2+"Listing")
	WIN_t_CurrentOutputform:=$2+"Listing"
End if 
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
$0:=True:C214
If ((DB_GetModuleSettingByNUM(1)=5) & (MOD_l_CurrentModuleAccess<2))
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
	//ABORT
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146($1->)
	End if 
	vAdd:=0
	If (<>AutoProc=987654321)
		<>AutoProc:=0
		<>AutoFind:=False:C215
		USE NAMED SELECTION:C332("◊IA")
	Else 
		Case of 
			: (Count parameters:C259>=6)
				If ($5)
					USE SET:C118($6)
				Else 
					ALL RECORDS:C47($1->)
				End if 
			Else 
				ALL RECORDS:C47($1->)
		End case 
		
	End if 
	vNo:=Records in selection:C76($1->)
	If (vNo=0)
		//TRACE
		$_bo_InRecordListing:=DB_bo_InRecordListing
		DB_bo_InRecordListing:=True:C214
		$_l_TableNumber:=Table:C252($1)
		DB_MenuNewRecord(String:C10($_l_TableNumber))
		DB_bo_InRecordListing:=$_bo_InRecordListing
		
	Else 
		Open_Pro_Window($4; 0; 1; $1; WIN_t_CurrentOutputform)
		FS_SetFormSort(WIN_t_CurrentOutputform)
		WIn_SetFormSize(1; $1; WIN_t_CurrentOutputform)
		MODIFY SELECTION:C204($1->; *)
		Close_ProWin
	End if 
	UNLOAD RECORD:C212($1->)
End if 
Process_End
ERR_MethodTrackerReturn("Minor_ModName"; $_t_oldMethodName)
