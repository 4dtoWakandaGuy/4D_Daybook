//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_Actions_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	C_BOOLEAN:C305($_bo_AutoFind; ACT_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2; ACT_t_ActionCodeFind)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_Actions_Mod")
SD2_LoadTemplateActions
ARRAY TEXT:C222(SD_at_actionAdd; 0)
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
SD2_LoadResults
QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12>=0)
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([ACTIONS:13]; "AccFound")
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$1)
	If (Records in selection:C76([ACTIONS:13])>0)
		CREATE SET:C116([ACTIONS:13]; "ActFound")
		
	End if 
	$_t_SetName:="ActFound"
End if 

Minor_Mod(->[ACTIONS:13]; "Actions"; "Actions InNEW"; ""; $_t_SetName; $_bo_AutoFind)
If ((DB_GetModuleSettingByNUM(Module_WPManager))>0)
	ARRAY TEXT:C222(<>WP_at_DocumentDiaryActionCode; 0)
	ARRAY TEXT:C222(<>WP_at_DocumentDiaryActionName; 0)
	//see also Diary_Buttons
End if 
ERR_MethodTrackerReturn("SD2_Actions_Mod"; $_t_oldMethodName)
