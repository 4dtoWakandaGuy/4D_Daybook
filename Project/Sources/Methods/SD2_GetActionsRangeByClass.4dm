//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetActionsRangeByClass
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 21:11`Method: SD2_GetActionsRangeByClass
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ActionClass;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305(SD2_bo_ActionsInited)
	C_LONGINT:C283($_l_ActionClass; $_l_ActionField; $_l_Index; $_l_Index2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetActionsRangeByClass")
//to do this we have to get the class from the attributes

//SD2_ActionAttributesToArrays

ARRAY TEXT:C222(SD2_at_ActionsRange; 0)
If (Not:C34(SD2_bo_ActionsInited))
	ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
	ARRAY TEXT:C222(SD2_at_ActionNames; 0)
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
	SD2_bo_ActionsInited:=True:C214
	
End if 
ARRAY LONGINT:C221(SD2_al_ActionClass; 0)
ARRAY LONGINT:C221(SD2_al_ActionClass; Size of array:C274(SD2_at_ActionCodes))
//ARRAY STRING(55;SD2_at_DiaryLocations;0)
//ARRAY LONGINT(SD2_al_DiaryLocations;0)
//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
//SD2_LoadDiaryLocations (->SD2_al_DiaryLocations;->SD2_at_DiaryLocations)

If (Count parameters:C259>=1)
	For ($_l_Index; 1; Count parameters:C259)
		$_l_ActionClass:=${$_l_Index}
		For ($_l_Index2; 1; Size of array:C274(SD2_al_ActionClass))
			If (SD2_al_ActionClass{$_l_Index2}=0)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_ActionCodes{$_l_Index2})
				SD2_ActionAttributesToArrays
				$_l_ActionField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Type ID")
				If ($_l_ActionField>0)  //It should be
					SD2_al_ActionClass{$_l_Index2}:=SD2_al_ActionVirtFieldDataLong{$_l_ActionField}
				Else 
					SD2_al_ActionClass{$_l_Index2}:=-1
				End if 
			End if 
			If (SD2_al_ActionClass{$_l_Index2}=${$_l_Index})
				
				
				APPEND TO ARRAY:C911(SD2_at_ActionsRange; SD2_at_ActionCodes{$_l_Index2})
				
			End if 
		End for 
	End for 
End if 
$0:=->SD2_at_ActionsRange
ERR_MethodTrackerReturn("SD2_GetActionsRangeByClass"; $_t_oldMethodName)
