//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_Diary_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; $_bo_AutoExit; SD2_bo_MinResult; SD2_bo_ShowSelection; SYS_bo_StatsView; VAutoFind)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; SD2_l_CallingProcess; VD)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; SD2_T_SearchValue; SD2_T_SearchValue2; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_Diary_Mod")

//The method will display the diary view-a searchable list of diary items, not workflow or schedule

Start_Process
SYS_t_AccessType:=""  //temporary
VD:=1
<>DB_bo_AutoOut:=True:C214
VAutoFind:=True:C214  // to get the window to dsiplay an emptry selection
SYS_bo_StatsView:=False:C215

//***************** kmw 30/06/08 - need to check if anything like this needs to be done as in "Diary_File" method- currently commented ************************
//MOD_l_CurrentModuleAccess:=DB_GetModuleSetting (◊BarMod)
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)  //after some analysis, it seems like correct thing to do so uncommented - kmw, 1/07/08"
//**************************************************************************************************************************************************************
If (False:C215)
	$_bo_AutoExit:=False:C215
	ARRAY POINTER:C280(SD2_aptr_ListControl; 0)
	SD2_bo_ShowSelection:=False:C215
	CREATE EMPTY SET:C140([DIARY:12]; "FoundDiarySelection")
	If (Count parameters:C259>=1)
		SD2_T_SearchValue2:=$1
		If (SD2_T_SearchValue2#"")
			SD2_bo_ShowSelection:=True:C214
		End if 
		If (Count parameters:C259>=2)
			SD2_l_CallingProcess:=Num:C11($2)
		End if 
		If (Count parameters:C259>=3)
			If (Num:C11($3)>0)
				//Search more choices
				SD2_bo_MinResult:=True:C214
				Diary_Sel(""; True:C214)
				SD2_bo_MinResult:=False:C215
				If (OK=1) & (Records in selection:C76([DIARY:12])>0)
					CREATE SET:C116([DIARY:12]; "FoundDiarySelection")
					SD2_T_SearchValue2:="UseFoundSelection"
					SD2_bo_ShowSelection:=True:C214
				Else 
					$_bo_AutoExit:=True:C214
				End if 
			End if 
		End if 
	Else 
		SD2_T_SearchValue:=""
		SD2_T_SearchValue2:=""
	End if 
	If (Not:C34($_bo_AutoExit))
		Gen_ModMidAL("View Diary"; "DMaster"; ->[DIARY:12]; ->vD; "Diary Items"; ""; ->[USER:15]; "SD2_diaryViewer")
		//Gen_Mod ("View Diary";"SD2_Diary_File";"DMaster";->[DIARY];->vD;"";"Diary Items")
		//diary Unload
		UNLOAD RECORD:C212([DIARY:12])
	End if 
	
	CLEAR SET:C117("SearchResults")  //added kmw - 02/07/08
Else 
	DBI_DisplayRecords(Table:C252(->[DIARY:12]); ""; "History"; 1; True:C214; False:C215; False:C215)
	
End if 
ERR_MethodTrackerReturn("SD2_Diary_Mod"; $_t_oldMethodName)
