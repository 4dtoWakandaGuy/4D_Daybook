//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetOrderState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DM_ai_DefaultState;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros; DM_bo_ScriptStatus)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_Index; $_l_offset; $_l_ScriptClass; $_l_StatePosition; SCPT_l_Cancel)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptText)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DM_SetOrderState")


ARRAY INTEGER:C220(DM_ai_DefaultState; 0)
ARRAY TEXT:C222(DM_at_StateNames; 0)
ARRAY TEXT:C222(DM_at_StateFunction; 0)
$_l_offset:=0

If (Count parameters:C259>=1)
	BLOB TO VARIABLE:C533($1->; DM_ai_DefaultState; $_l_offset)
	If (BLOB size:C605($1->)>$_l_offset)
		BLOB TO VARIABLE:C533($1->; DM_at_StateNames; $_l_offset)
		If (BLOB size:C605($1->)>$_l_offset)
			BLOB TO VARIABLE:C533($1->; DM_at_StateFunction; $_l_offset)
		End if 
	End if 
	$_l_StatePosition:=Find in array:C230(DM_ai_DefaultState; 1)
	If ($_l_StatePosition>0)
		//set the default
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=DM_at_StateNames{$_l_StatePosition})
		[ORDERS:24]State:15:="024"+[TABLE_RECORD_STATES:90]State_Code:1
	End if 
	For ($_l_Index; Size of array:C274(DM_at_StateFunction); 1; -1)
		//we will set to the highest state
		If (DM_at_StateFunction{$_l_Index}#"")
			$_l_ScriptClass:=Data Import Macro
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_ScriptClass)
			QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1=DM_at_StateFunction{$_l_Index})
			If (Records in selection:C76([SCRIPTS:80])>0)
				<>SYS_l_CancelProcess:=0
				SCPT_l_Cancel:=0
				<>SYS_bo_StopMacros:=False:C215
				$_t_oldMethodName:=ERR_MethodTracker([SCRIPTS:80]Script_Code:1)
				$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
				
				Record_Play(0; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1)
				
				
				
			Else 
				If (DM_at_StateFunction{$_l_Index}="")
					EXECUTE FORMULA:C63("DM_bo_ScriptStatus:=DM_at_StateFunction{$_l_Index}")
				End if 
				
			End if 
			If (DM_bo_ScriptStatus)
				//set to this status
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=DM_at_StateNames{$_l_Index})
				[ORDERS:24]State:15:="024"+[TABLE_RECORD_STATES:90]State_Code:1
				$_l_Index:=0
			End if 
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("DM_SetOrderState"; $_t_oldMethodName)