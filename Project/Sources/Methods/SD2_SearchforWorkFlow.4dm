//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SearchforWorkFlow
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
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_AllActionIDs; 0)
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
	C_LONGINT:C283($_l_actionRow; $_l_IncludeDocs; $_l_Index; $_l_TabInclude; $_l_TablPosition; $_l_VitrualFieldRow; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SearchforWorkFlow")
//this method controls the searching for workflow items on the client
//With workflow items we only show uncompleted items
If (Count parameters:C259>=2)
	//Make sure pointer $1 is pointing to a longint or an array of longints!
	If ($2>0)
		$_l_TablPosition:=Find in array:C230(SD2_al_TabIds; $2)
	Else 
		//no Default.. show all
		$_l_TablPosition:=0
	End if 
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCodes; [ACTIONS:13]xID:12; $_al_AllActionIDs)
	ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
	ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
	ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
	SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
	
	If ($_l_TablPosition>0)
		For ($_l_Index; 1; Size of array:C274(SD2_al_TabIncludes{$_l_TablPosition}))
			If (SD2_al_TabIncludes{$_l_TablPosition}{$_l_Index}>0)
				$_l_TabInclude:=SD2_al_TabIncludes{$_l_TablPosition}{$_l_Index}
				$_l_actionRow:=Find in array:C230($_al_AllActionIDs; $_l_TabInclude)
				If ($_l_actionRow>0)
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_actionRow})
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					
					SD2_ActionAttributesToArrays
					$_bo_OK:=False:C215
					$_l_VitrualFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
					If ($_l_VitrualFieldRow>0)
						If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VitrualFieldRow})>0)
							$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VitrualFieldRow}; 2)>0)
						Else 
							$_bo_OK:=True:C214
						End if 
					Else 
						$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
					End if 
					If ($_bo_OK)  // This ensures we only include
						APPEND TO ARRAY:C911($_at_ActionCodes; $_at_AllActionCodes{$_l_actionRow})
					End if 
				End if 
			Else 
			End if 
		End for 
		$_l_IncludeDocs:=SD2_al_DocIncludes{$_l_TablPosition}
	Else 
		For ($_l_Index; 1; Size of array:C274($_at_AllActionCodes))
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCodes{$_l_Index})
			ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
			SD2_ActionAttributesToArrays
			$_bo_OK:=False:C215
			$_l_VitrualFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
			If ($_l_VitrualFieldRow>0)
				$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_VitrualFieldRow}; 2)>0)
			Else 
				$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
			End if 
			If ($_bo_OK)  // This ensures we only include
				APPEND TO ARRAY:C911($_at_ActionCodes; $_at_AllActionCodes{$_l_Index})
			End if 
		End for 
		$_l_IncludeDocs:=1
	End if 
	SD2_GetSetFromServer($1; ->$_at_ActionCodes; $_l_IncludeDocs)
End if 
ERR_MethodTrackerReturn("SD2_SearchforWorkFlow"; $_t_oldMethodName)