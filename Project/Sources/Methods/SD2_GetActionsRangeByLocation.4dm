//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetActionsRangeByLocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 21:44`Method: SD2_GetDiaryActionsRangeByLocat
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_LocationsLoaded;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_SheduleActionIDS; 0)
	ARRAY LONGINT:C221($_al_TabOnlyActionIDS; 0)
	ARRAY LONGINT:C221($_al_WorkflowActionIDS; 0)
	//ARRAY LONGINT(SD2_al_ActionLocations;0;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_AL_DIARYTYPESETTINGS;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305(SD2_bo_ActionsInited)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_LocationNumber; $_l_LocationPosition)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_actionLocationName; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetActionsRangeByLocation")
ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
SD2_LoadDiaryTypes
SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
ARRAY LONGINT:C221($_al_SheduleActionIDS; 0)
ARRAY LONGINT:C221($_al_WorkflowActionIDS; 0)
ARRAY LONGINT:C221($_al_TabOnlyActionIDS; 0)
For ($_l_Index; 1; Size of array:C274(SD2_al_DiaryTypeIDS))
	For ($_l_Index2; 1; Size of array:C274(SD2_AL_DIARYTYPESETTINGS{$_l_Index}))
		Case of 
			: (SD2_AL_DIARYTYPESETTINGS{$_l_Index}{$_l_Index2}=1)
				APPEND TO ARRAY:C911($_al_SheduleActionIDS; SD2_al_DiaryTypeIDS{$_l_Index})
			: (SD2_AL_DIARYTYPESETTINGS{$_l_Index}{$_l_Index2}=2)
				APPEND TO ARRAY:C911($_al_WorkflowActionIDS; SD2_al_DiaryTypeIDS{$_l_Index})
				
			: (SD2_AL_DIARYTYPESETTINGS{$_l_Index}{$_l_Index2}=3)
				APPEND TO ARRAY:C911($_al_TabOnlyActionIDS; SD2_al_DiaryTypeIDS{$_l_Index})
				
		End case 
	End for 
	
End for 

ARRAY TEXT:C222(SD2_at_ActionsRange; 0)
If (Not:C34(SD2_bo_ActionsInited))
	ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
	ARRAY TEXT:C222(SD2_at_ActionNames; 0)
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
	SD2_bo_ActionsInited:=True:C214
	
End if 
ARRAY BOOLEAN:C223(SD2_abo_LocationsLoaded; 0)
ARRAY LONGINT:C221(SD2_al_ActionLocations; 0; 0)
ARRAY LONGINT:C221(SD2_al_ActionLocations; Size of array:C274(SD2_at_ActionCodes); Size of array:C274(SD2_at_DiaryLocations))
ARRAY BOOLEAN:C223(SD2_abo_LocationsLoaded; Size of array:C274(SD2_at_ActionCodes))




If (Count parameters:C259>=1)
	CREATE EMPTY SET:C140([ACTIONS:13]; "$ByLocations")
	
	For ($_l_Index; 1; Count parameters:C259)
		$_t_actionLocationName:=${$_l_Index}
		
		$_l_LocationPosition:=Find in array:C230(SD2_at_DiaryLocations; $_t_actionLocationName)
		If ($_l_LocationPosition>0)
			$_l_LocationNumber:=SD2_al_DiaryLocations{$_l_LocationPosition}
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]xLocations:13="@"+String:C10($_l_LocationNumber))
			CREATE SET:C116([ACTIONS:13]; "$Temp")
			QUERY WITH ARRAY:C644([ACTIONS:13]xActionTypeID:10; $_al_SheduleActionIDS)
			CREATE SET:C116([ACTIONS:13]; "$Temp2")
			UNION:C120("$Temp"; "$Temp2"; "$Temp")
			USE SET:C118("$Temp")
			UNION:C120("$ByLocations"; "$Temp"; "$ByLocations")
			
		End if 
	End for 
	USE SET:C118("$ByLocations")
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionsRange)
End if 
$0:=->SD2_at_ActionsRange
ERR_MethodTrackerReturn("SD2_GetActionsRangeByLocation"; $_t_oldMethodName)