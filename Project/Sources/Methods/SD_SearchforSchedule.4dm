//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SearchforSchedule
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2009 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_AllActionIDS; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DocIncludes;0)
	//ARRAY LONGINT(SD2_al_TabIds;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_AllActionCodes; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_IncludeDocs; $_l_LocationsFieldRow; $_l_TabIncludes; $_l_TabRow; $_l_TabRowIndex; $2; $_l_ActionRow; $_l_IncludeDocs; $_l_LocationsFieldRow; $_l_TabIncludes; $_l_TabRow)
	C_LONGINT:C283($_l_TabRowIndex)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD_SearchforSchedule")  //this method controls the searching for workflow items on the client
//With workflow items we only show uncompleted items
//Make sure pointer $1 is pointing to a longint or an array of longints!
If (Count parameters:C259>=2)
	If ($2>0)
		$_l_TabRow:=Find in array:C230(SD2_al_TabIds; $2)
	Else 
		//no Default.. show all
		$_l_TabRow:=0
	End if 
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCodes; [ACTIONS:13]xID:12; $_al_AllActionIDS)
	ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
	ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
	ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
	SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
	
	If ($_l_TabRow>0)
		For ($_l_TabRowIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_TabRow}))
			If (SD2_al_TabIncludes{$_l_TabRow}{$_l_TabRowIndex}>0)
				$_l_TabIncludes:=SD2_al_TabIncludes{$_l_TabRow}{$_l_TabRowIndex}
				$_l_ActionRow:=Find in array:C230($_al_AllActionIDS; $_l_TabIncludes)
				If ($_l_ActionRow>0)
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_ActionRow})
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					
					SD2_ActionAttributesToArrays
					$_bo_OK:=False:C215
					$_l_LocationsFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
					If ($_l_LocationsFieldRow>0)
						If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsFieldRow})>0)
							$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsFieldRow}; 2)>0)
						Else 
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
					End if 
					If ($_bo_OK)  // This ensures we only include
						APPEND TO ARRAY:C911($_at_ActionCodes; $_at_AllActionCodes{$_l_ActionRow})
					End if 
				End if 
			Else 
			End if 
		End for 
		$_l_IncludeDocs:=SD2_al_DocIncludes{$_l_TabRow}
	Else 
		For ($_l_TabRowIndex; 1; Size of array:C274($_at_AllActionCodes))
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_TabRowIndex})
			ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
			SD2_ActionAttributesToArrays
			$_bo_OK:=False:C215
			$_l_LocationsFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
			If ($_l_LocationsFieldRow>0)
				$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsFieldRow}; 2)>0)
			Else 
				$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
			End if 
			If ($_bo_OK)  // This ensures we only include
				APPEND TO ARRAY:C911($_at_ActionCodes; $_at_AllActionCodes{$_l_TabRowIndex})
			End if 
		End for 
		$_l_IncludeDocs:=1
	End if 
	SD2_GetSetFromServer($1; ->$_at_ActionCodes; $_l_IncludeDocs)
End if 
ERR_MethodTrackerReturn("SD_SearchforSchedule"; $_t_oldMethodName)
