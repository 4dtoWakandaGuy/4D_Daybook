If (False:C215)
	//object Name: [ACTIONS]Action_In.oClearScriptsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_LB_Macros;0)
	//ARRAY LONGINT(SD2_al_mWhen;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptWhen;0)
	C_LONGINT:C283(bMacCancel; BmacModify; SD_l_ScriptEditState; SD2_l_SelectedMacro)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable6"; Form event code:C388)
Case of 
	: (SD_l_ScriptEditState=0)
		OBJECT SET TITLE:C194(BmacModify; "Add")
		OBJECT SET TITLE:C194(bMacCancel; "Clear")
		OBJECT SET VISIBLE:C603(bMacCancel; False:C215)
	: (SD_l_ScriptEditState=1)  // new entry-just  clear
		DELETE FROM ARRAY:C228(SD2_at_ScriptCodes; 1; 1)
		DELETE FROM ARRAY:C228(SD2_at_ScriptNames; 1; 1)
		DELETE FROM ARRAY:C228(SD2_al_mWhen; 1; 1)
		DELETE FROM ARRAY:C228(SD2_at_ScriptWhen; 1; 1)
		//AL_SetEntryOpts (SD2_l_Macros;1;0;0;0;0)
		//AL_SetEnterable (SD2_l_Macros;3;0)
		LB_SetEnterable(->SD2_LB_Macros; False:C215; 3; "")
		//AL_SetEnterable (SD2_l_Macros;1;0)
		LB_SetEnterable(->SD2_LB_Macros; False:C215; 1; "")
		//AL_UpdateArrays (SD2_l_Macros;-2)
		
		SD_l_ScriptEditState:=0
		OBJECT SET TITLE:C194(BmacModify; "Add")
		OBJECT SET TITLE:C194(bMacCancel; "Clear")
		OBJECT SET VISIBLE:C603(bMacCancel; False:C215)
	: (SD_l_ScriptEditState=-1) | (SD_l_ScriptEditState=-2)
		
		If (SD2_l_SelectedMacro>0)
			Gen_Confirm("Are you sure you want to remove this entry?"; "Yes"; "No")
			If (OK=1)
				DELETE FROM ARRAY:C228(SD2_at_ScriptCodes; SD2_l_SelectedMacro; 1)
				DELETE FROM ARRAY:C228(SD2_at_ScriptNames; SD2_l_SelectedMacro; 1)
				DELETE FROM ARRAY:C228(SD2_al_mWhen; SD2_l_SelectedMacro; 1)
				DELETE FROM ARRAY:C228(SD2_at_ScriptWhen; SD2_l_SelectedMacro; 1)
			End if 
			
		End if 
		//AL_SetEntryOpts (SD2_l_Macros;1;0;0;0;0)
		//AL_SetEnterable (SD2_l_Macros;3;0)
		LB_SetEnterable(->SD2_LB_Macros; False:C215; 3; "")
		//AL_SetEnterable (SD2_l_Macros;1;0)
		LB_SetEnterable(->SD2_LB_Macros; False:C215; 1; "")
		//AL_UpdateArrays (SD2_l_Macros;-2)
		
		SD_l_ScriptEditState:=0
		OBJECT SET TITLE:C194(BmacModify; "Add")
		OBJECT SET TITLE:C194(bMacCancel; "Clear")
		OBJECT SET VISIBLE:C603(bMacCancel; False:C215)
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable6"; $_t_oldMethodName)
