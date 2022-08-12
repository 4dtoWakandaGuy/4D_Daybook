//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetupActionUsage
	//------------------ Method Notes ------------------
	//This method will operate for all or a group of actions. (no point in doing it for one action.
	//it will display the group actions with a list of where they appear-schedule, workflow, or a timed function or just in the history searches and tabs(ie not workflow or schedule just notes and stuff)
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2010 10:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//ARRAY BOOLEAN(SD2_abo_ActionMod;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude1;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude2;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude3;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude4;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_LocationRefs; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305(SD2_bo_SettingsMod; $0; SD2_bo_SettingsMod)
	C_LONGINT:C283($_l_BuildIndex; $_l_ColumsIndex; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delete; $_l_FieldRow; $_l_Index; $_l_Insert; $_l_LocationRow; $_l_SIzeofArray; WIN_l_CurrentWinRefOLD)
	C_LONGINT:C283($_l_ActionsIndex; $_l_BuildIndex; $_l_ColumsIndex; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Delete; $_l_FieldRow; $_l_Index; $_l_Insert; $_l_LocationRow; $_l_SIzeofArray)
	C_LONGINT:C283(SD2_l_SaveSettings; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_ActionsRange)
	C_TEXT:C284($1; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetupActionUsage")
$0:=False:C215
If (Count parameters:C259>=1)
	//Get the actions of a given type
	Case of 
		: ($1#"")
			$_ptr_ActionsRange:=SD2_GetActionsRangeByLocation($1)
			QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; $_ptr_ActionsRange->)
		: (Count parameters:C259>=2)
			CREATE EMPTY SET:C140([ACTIONS:13]; "$temp")
			For ($_l_Index; 2; Count parameters:C259)
				$_ptr_ActionsRange:=SD2_GetActionsRangeByLocation(${$_l_Index})
				QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; $_ptr_ActionsRange->)
				CREATE SET:C116([ACTIONS:13]; "$temp2")
				UNION:C120("$Temp"; "$Temp2"; "$Temp")
				CLEAR SET:C117("$Temp2")
			End for 
			USE SET:C118("$Temp")
			CLEAR SET:C117("$Temp")
		Else 
			ALL RECORDS:C47([ACTIONS:13])
	End case 
Else 
	ALL RECORDS:C47([ACTIONS:13])
	
End if 
If (Records in selection:C76([ACTIONS:13])>0)
	SD2_l_SaveSettings:=0
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
	DIALOG:C40("DiaryActionsSetup")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	UNLOAD RECORD:C212([ACTIONS:13])
	If (SD2_l_SaveSettings=1)
		$0:=True:C214
	End if 
	If (SD2_l_SaveSettings=1) & (SD2_bo_SettingsMod)
		OK:=1
		ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
		SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
		For ($_l_ActionsIndex; 1; Size of array:C274(SD2_abo_ActionMod))
			If (SD2_abo_ActionMod{$_l_ActionsIndex})
				//This action is modified
				READ WRITE:C146([ACTIONS:13])
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_ActionCodes{$_l_ActionsIndex})
				LOAD RECORD:C52([ACTIONS:13])
				SD2_ActionAttributesToArrays
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)  //selected Diary locations
				
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; Size of array:C274(SD2_al_DiaryLocations))
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_FieldRow>0)
					For ($_l_ColumsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
						$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_ColumsIndex})
						If ($_l_LocationRow>0)  //it should be
							SD2_aI_DiaryLocationsSEL{$_l_LocationRow}:=1
						End if 
						
					End for 
				Else 
					
				End if 
				
				
				SD2_aI_DiaryLocationsSEL{1}:=Num:C11(SD2_at_ActionInclude1{$_l_ActionsIndex})
				SD2_aI_DiaryLocationsSEL{2}:=Num:C11(SD2_at_ActionInclude2{$_l_ActionsIndex})
				SD2_aI_DiaryLocationsSEL{3}:=Num:C11(SD2_at_ActionInclude3{$_l_ActionsIndex})
				SD2_aI_DiaryLocationsSEL{4}:=Num:C11(SD2_at_ActionInclude4{$_l_ActionsIndex})
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_FieldRow>0)
					ARRAY LONGINT:C221($_al_LocationRefs; Size of array:C274(SD2_aI_DiaryLocationsSEL))
					$_l_CurrentRow:=0
					For ($_l_BuildIndex; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
						If (SD2_aI_DiaryLocationsSEL{$_l_BuildIndex}=1)
							$_l_CurrentRow:=$_l_CurrentRow+1
							$_al_LocationRefs{$_l_CurrentRow}:=SD2_al_DiaryLocations{$_l_BuildIndex}
						End if 
					End for 
					ARRAY LONGINT:C221($_al_LocationRefs; $_l_CurrentRow)
					
					If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})<Size of array:C274($_al_LocationRefs))
						$_l_SIzeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})
						$_l_Insert:=(Size of array:C274($_al_LocationRefs))-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
						INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; $_l_SIzeofArray+1; $_l_Insert)
					Else 
						If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow})>Size of array:C274($_al_LocationRefs))
							$_l_SIzeofArray:=Size of array:C274($_al_LocationRefs)
							$_l_Delete:=(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))-(Size of array:C274($_al_LocationRefs))
							DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}; $_l_SIzeofArray+1; $_l_Delete)
						End if 
						
					End if 
					For ($_l_ColumsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
						SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_ColumsIndex}:=$_al_LocationRefs{$_l_ColumsIndex}
					End for 
					
				Else 
					
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
				
			End if 
		End for 
		
		
		
	End if 
	OK:=1
	
	
End if 
ERR_MethodTrackerReturn("SD2_SetupActionUsage"; $_t_oldMethodName)
