//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDiaryActionType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_DiaryTypeRow; $_l_Index; $_l_LocationRow; $_l_ShowPost; $_l_ShowThread; SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_CurrentDiaryType; sRB_l_Diary; sRB_l_Original)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryActionType")
//This method will load a diary action type to screen
SD2_bo_recordModified:=False:C215
$1->:=SD2_al_DiaryTypeIDS{SD2_at_DiaryTypes}
$_l_DiaryTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; $1->)
If ($_l_DiaryTypeRow>0)
	$2->:=SD2_at_DiaryTypes{$_l_DiaryTypeRow}
	//SD2_al_DiaryLocations;->SD2_at_DiaryLocations
	For ($_l_Index; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
		If (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow})>=$_l_Index)
			$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}{$_l_Index})
			If ($_l_LocationRow>0)  //it should be
				SD2_aI_DiaryLocationsSEL{$_l_LocationRow}:=1
			End if 
		End if 
	End for 
	$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 1)  //because these are hard coded IDS
	$_l_ShowThread:=0
	If ($_l_LocationRow>0)
		//$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$Ref3}
		If ($_l_ShowThread=0)
			$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 2)
			If ($_l_LocationRow>0)
				$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
			End if 
		End if 
	End if 
	If ($_l_ShowThread>0)
		OBJECT SET ENTERABLE:C238(SD2_l_CBThreaded; True:C214)
		OBJECT SET VISIBLE:C603(*; "oThreadedObjects@"; True:C214)
		SD2_l_CBThreaded:=SD2_al_DiaryTypeThreaded{$_l_DiaryTypeRow}
		sRB_l_Original:=SD2_al_DiaryTypeOriginal{$_l_DiaryTypeRow}
		sRB_l_Diary:=SD2_al_DiaryTypeDiary{$_l_DiaryTypeRow}
	Else 
		OBJECT SET ENTERABLE:C238(SD2_l_CBThreaded; False:C215)
		OBJECT SET VISIBLE:C603(*; "oThreadedObjects@"; False:C215)
	End if 
	$_l_ShowPost:=0
	$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 3)  //because these are hard coded IDS
	If ($_l_LocationRow>0)
		$_l_ShowPost:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
	End if 
	If ($_l_ShowPost>0)
		SD2_l_CBPostAction:=SD2_al_DiaryDone{$_l_DiaryTypeRow}
	Else 
		//OBJECT SET VISIBLE(SD2_l_CBThreaded;False)
	End if 
	
Else 
	SD2_l_CurrentDiaryType:=0
	
End if 
If (SD2_l_CBThreaded=1)
	//OBJECT SET VISIBLE(*;"oThreadOption";True)
Else 
	//OBJECT SET VISIBLE(*;"oThreadOption";False)
End if 
ERR_MethodTrackerReturn("SD2_LoadDiaryActionType"; $_t_oldMethodName)
