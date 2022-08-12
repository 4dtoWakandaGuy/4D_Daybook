If (False:C215)
	//object Name: [ACTIONS]Action_In.oModifyScriptButton
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
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY LONGINT(SD2_al_mIgnore;0)
	//ARRAY LONGINT(SD2_al_mWhen;0)
	//ARRAY TEXT(SD2_at_EventName;0)
	//ARRAY TEXT(SD2_at_EventNames;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptWhen;0)
	C_LONGINT:C283($_l_EventRow; $_l_ScriptIndex; $_l_SizeofArray; BmacCancel; BmacModify; SD_l_ScriptEditState; SD2_l_SelectedMacro)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable37"; Form event code:C388)
If (False:C215)
	SD2_ModifyMacros(->SD2_at_ScriptCodes; ->SD2_al_mWhen)
	$_l_SizeofArray:=Size of array:C274(SD2_at_ScriptCodes)
	ARRAY TEXT:C222(SD2_at_ScriptNames; $_l_SizeofArray)
	ARRAY TEXT:C222(SD2_at_ScriptWhen; $_l_SizeofArray)
	ARRAY LONGINT:C221(SD2_al_mIgnore; $_l_SizeofArray)  // ignore std macros
	READ ONLY:C145([SCRIPTS:80])
	
	For ($_l_ScriptIndex; 1; Size of array:C274(SD2_at_ScriptCodes))
		
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SD2_at_ScriptCodes{$_l_ScriptIndex})
		SD2_at_ScriptNames{$_l_ScriptIndex}:=[SCRIPTS:80]Script_Name:2
		$_l_EventRow:=Find in array:C230(SD2_al_EventIDs; SD2_al_mWhen{$_l_ScriptIndex})
		If ($_l_EventRow>0)  //it should b
			SD2_at_ScriptWhen{$_l_ScriptIndex}:=SD2_at_EventNames{$_l_EventRow}
		End if 
		SD2_al_mIgnore{$_l_ScriptIndex}:=0  // at the moment
		
		
	End for 
End if 

Case of 
	: (SD_l_ScriptEditState=0)
		// EDIT..add a line
		ARRAY TEXT:C222(SD2_at_EventName; 4)
		ARRAY LONGINT:C221(SD2_al_EventIDs; 5)
		SD2_al_EventIDs{1}:=1
		SD2_at_EventName{1}:="on saving new"
		SD2_al_EventIDs{2}:=2
		SD2_at_EventName{2}:="on saving existing"
		SD2_al_EventIDs{3}:=3
		SD2_at_EventName{3}:="on opening"
		SD2_al_EventIDs{4}:=4
		SD2_at_EventName{4}:="on setting a result code"
		OBJECT SET VISIBLE:C603(BmacCancel; True:C214)
		INSERT IN ARRAY:C227(SD2_at_ScriptCodes; 1; 1)
		INSERT IN ARRAY:C227(SD2_at_ScriptNames; 1; 1)
		INSERT IN ARRAY:C227(SD2_al_mWhen; 1; 1)
		INSERT IN ARRAY:C227(SD2_at_ScriptWhen; 1; 1)
		//AL_SetEntryOpts (SD2_l_Macros;2;0;0;0;0)
		//AL_SetEnterable (SD2_l_Macros;3;3;SD2_at_EventName)
		LB_SetChoiceList("lbMacros"; ->SD2_at_EventName; ->SD2_at_ScriptWhen)
		//AL_SetEnterable (SD2_l_Macros;1;1)
		LB_SetEnterable(->SD2_LB_Macros; True:C214; 1; "")
		LB_SetEnterable(->SD2_LB_Macros; True:C214; 3; "")
		//AL_UpdateArrays (SD2_l_Macros;-2)
		
		SD_l_ScriptEditState:=1
		OBJECT SET TITLE:C194(BmacModify; "Save")
		OBJECT SET TITLE:C194(bMacCancel; "Clear")
	: (SD_l_ScriptEditState=1)
		//adding a line..save
		If (SD2_at_ScriptCodes{1}#"") & (SD2_at_ScriptWhen{1}#"")
			SD2_al_mWhen{1}:=SD2_al_EventIDs{Find in array:C230(SD2_at_EventName; SD2_at_ScriptWhen{1})}
			
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
		Else 
			Gen_Alert("You must set a macro and an event, or clear")
		End if 
		
	: (SD_l_ScriptEditState=-1)
		//row selected..button says edit
		
		
		If (SD2_l_SelectedMacro>0)
			ARRAY TEXT:C222(SD2_at_EventName; 5)
			ARRAY LONGINT:C221(SD2_al_EventIDs; 5)
			SD2_al_EventIDs{1}:=1
			SD2_at_EventName{1}:="on saving new"
			SD2_al_EventIDs{2}:=2
			SD2_at_EventName{2}:="on saving existing"
			SD2_al_EventIDs{3}:=3
			SD2_at_EventName{3}:="on opening"
			SD2_al_EventIDs{4}:=4
			SD2_at_EventName{4}:="on setting a result code"
			OBJECT SET VISIBLE:C603(BmacCancel; True:C214)
			//AL_SetEntryOpts (SD2_l_Macros;2;0;0;0;0)
			//AL_SetEnterable (SD2_l_Macros;1;3;SD2_at_EventName)
			LB_SetChoiceList("lbMacros"; ->SD2_at_EventName; ->SD2_at_ScriptCodes)
			//AL_SetEnterable (SD2_l_Macros;1;1)
			LB_SetEnterable(->SD2_LB_Macros; True:C214; 1; "")
			LB_SetEnterable(->SD2_LB_Macros; True:C214; 3; "")
			
			//AL_UpdateArrays (SD2_l_Macros;-2)
			
			SD_l_ScriptEditState:=-2
			OBJECT SET TITLE:C194(BmacModify; "Save")
			OBJECT SET TITLE:C194(bMacCancel; "Delete")
		End if 
	: (SD_l_ScriptEditState=-2)
		//row selected..button says save
		
		If (SD2_l_SelectedMacro>0)
			If (SD2_at_ScriptCodes{SD2_l_SelectedMacro}#"") & (SD2_at_ScriptWhen{SD2_l_SelectedMacro}#"")
				SD2_al_mWhen{SD2_l_SelectedMacro}:=SD2_al_EventIDs{Find in array:C230(SD2_at_EventName; SD2_at_ScriptWhen{SD2_l_SelectedMacro})}
				
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
			Else 
				Gen_Alert("You must set a macro and an event, or clear")
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable37"; $_t_oldMethodName)
