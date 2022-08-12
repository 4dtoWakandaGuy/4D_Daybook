If (False:C215)
	//Table Form Method Name: [USER]Diary_Types
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 09:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Locations;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_Al_DiaryTypeIDs2;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	//ARRAY TEXT(SD2_at_DiaryTypes2;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD2_bo_recordModified)
	C_LONGINT:C283($_l_DiaryTypeRow; $_l_event; $_l_SIzeofArray; SD2_l_CBThredead; SD2_l_CurrentDiaryType; sRB_l_Diary; sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DiaryType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Diary_Types"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Diary_Types")
		SD2_bo_recordModified:=False:C215
		ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
		ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 4)
		SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; Size of array:C274(SD2_at_DiaryLocations))
		
		INT_SetLongintCheckFormat(->SD2_aI_DiaryLocationsSEL)
		
		
		
		SD2_LoadDiaryTypes
		If (Size of array:C274(SD2_al_DiaryTypeIDS)#Size of array:C274(SD2_at_DiaryTypes))
			ARRAY LONGINT:C221(SD2_al_DiaryTypeIDS; Size of array:C274(SD2_at_DiaryTypes))
			ARRAY TEXT:C222(SD2_at_DiaryTypes; Size of array:C274(SD2_at_DiaryTypes))
			ARRAY LONGINT:C221(SD2_al_DiaryTypeOriginal; Size of array:C274(SD2_at_DiaryTypes))
			ARRAY LONGINT:C221(SD2_al_DiaryTypeDiary; Size of array:C274(SD2_at_DiaryTypes))
			ARRAY LONGINT:C221(SD2_al_DiaryDone; Size of array:C274(SD2_at_DiaryTypes))
			$_l_SIzeofArray:=Size of array:C274(SD2_al_DiaryDone)
			If (Size of array:C274(SD2_AL_DiaryTypeSettings)>$_l_SIzeofArray)
				Repeat 
					DELETE FROM ARRAY:C228(SD2_AL_DiaryTypeSettings; Size of array:C274(SD2_AL_DiaryTypeSettings); 1)
				Until (Size of array:C274(SD2_AL_DiaryTypeSettings)=$_l_SIzeofArray)
			End if 
			
		End if 
		COPY ARRAY:C226(SD2_al_DiaryTypeIDS; SD2_Al_DiaryTypeIDs2)
		COPY ARRAY:C226(SD2_at_DiaryTypes; SD2_at_DiaryTypes2)
		
		$_l_DiaryTypeRow:=Find in array:C230(SD2_Al_DiaryTypeIDs2; -999)
		If ($_l_DiaryTypeRow<0)
			APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -9991)
			APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "-")
			
			APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -999)
			APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "Add Time Manager Type")
		End if 
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; Size of array:C274(SD2_al_DiaryLocations))
		If (SD2_l_CurrentDiaryType>0)
			SD2_LoadDiaryActionType(->SD2_l_CurrentDiaryType; ->SD2_t_DiaryType)
		Else 
			OBJECT SET VISIBLE:C603(*; "oThreadOption"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oThreadedObjects@"; False:C215)
		End if 
		INT_SetLongintCheckFormat(->SD2_aI_DiaryLocationsSEL)
		//DIA_lb_Locations
		LBi_InclSetupJustStyle(->DIA_lb_Locations)
		WS_AutoscreenSize(3; 350; 500)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM:Diary_Types"; $_t_oldMethodName)
