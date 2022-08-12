//%attributes = {}
If (False:C215)
	//Project Method Name:      States_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: States_Mod
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_BOOLEAN:C305(<>DB_bo_LockStatesManager)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_FormDefaultHeight; $_l_FormDefaultWidth; $_l_Index; MOD_l_CurrentModuleAccess; ST_ReadWrite)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_Mod")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

Start_Process
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
If (((DB_GetModuleSettingByNUM(1))=5) & (MOD_l_CurrentModuleAccess<2))
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
Else 
	If (Not:C34(<>DB_bo_LockStatesManager))
		<>DB_bo_LockStatesManager:=True:C214
		ST_ReadWrite:=0
		If (MOD_l_CurrentModuleAccess#3)
			ST_ReadWrite:=1
		End if 
		FORM GET PROPERTIES:C674([USER:15]; "File_StatesManager"; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
		WIN_t_CurrentOutputform:="File_StatesManager"
		Open_Pro_Window("Record States Manager"; 0; 1; ->[USER:15]; "File_StatesManager"; "AA_CloseStates")
		FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[TABLE_RECORD_STATES:90]))
		StartTransaction
		DIALOG:C40([USER:15]; "File_StatesManager")
		<>DB_bo_LockStatesManager:=False:C215
	Else 
		For ($_l_Index; 1; Size of array:C274(<>PRC_at_ProcessName))
			If (<>PRC_at_ProcessName{$_l_Index}="File States") & (<>PRC_al_ProcessNum{$_l_Index}#Current process:C322)
				SHOW PROCESS:C325(<>PRC_al_ProcessNum{$_l_Index})
				BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_Index})
				$_l_Index:=99999
			End if 
		End for 
		
	End if 
	
End if 
Close_ProWin
Process_End
ERR_MethodTrackerReturn("States_Mod"; $_t_oldMethodName)
