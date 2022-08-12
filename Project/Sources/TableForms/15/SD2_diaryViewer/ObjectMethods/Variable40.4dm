If (False:C215)
	//object Name: [USER]SD2_diaryViewer.Variable40
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	C_BOOLEAN:C305(SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307(SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283(<>PER_l_CurrentUserSepDiaryWindow; $_l_Difference; $_l_DockLeft; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; SD2_l_CallBackProcessID; SD3_l_FloatingDiaryList)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SD_t_DiaryDefaultUser; SD_t_PersonFilterInitials; SD_t_PersonFilterName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.Variable40"; Form event code:C388)
//◊SuperDiary
If (Self:C308->>0)
	SD_t_PersonFilterName:=SD_at_DiaryOwners{SD_at_DiaryOwners}
	SD_t_PersonFilterInitials:=SD_at_PersonInitials{SD_at_DiaryOwners}
	Case of 
		: (SD_at_DiaryOwners{SD_at_DiaryOwners}="Other peoples diaries")
			SD_t_PersonFilterInitials:=SD_SelectOtherUser(<>PER_t_CurrentUserInitials)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_PersonFilterInitials)
			SD_t_PersonFilterName:=[PERSONNEL:11]Name:2
			UNLOAD RECORD:C212([PERSONNEL:11])
		: (SD_at_DiaryOwners{SD_at_DiaryOwners}="Multiple DIaries")
			If (SD3_l_FloatingDiaryList=0)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				If ($_l_WindowLeft<232)
					SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				End if 
				
				SD3_l_FloatingDiaryList:=New process:C317("SD_MultiOwnerList"; 32000; "Multi Diary"; SD_t_DiaryDefaultUser; Current process:C322; True:C214)
				
				
				
			Else 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				If ($_l_WindowLeft<232)
					$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
					$_l_Difference:=232-$_l_WindowLeft
					$_l_DockLeft:=INT_GetDock("R")
					If ($_l_DockLeft<($_l_WindowRight+$_l_Difference)) & ($_l_DockLeft>0)
						SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_DockLeft-1; $_l_WindowBottom)
					Else 
						SET WINDOW RECT:C444(232; $_l_WindowTop; 232+$_l_WindowWidth; $_l_WindowBottom)
					End if 
					
				End if 
				SET PROCESS VARIABLE:C370(SD3_l_FloatingDiaryList; SD2_l_CallBackProcessID; Current process:C322)
				SHOW PROCESS:C325(SD3_l_FloatingDiaryList)
				BRING TO FRONT:C326(SD3_l_FloatingDiaryList)
				SD3_bo_FloatingDiarydisplayed:=True:C214
			End if 
			
	End case 
	
	//************** commented out 03/07/08 -kmw **************
	//If (SD2_T_SearchValue#"")
	//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
	//Else
	//SD2_DiaryViewManageSelection
	//SD2_DiaryVIewManageView (-1)
	//End if
	//**************************************************************
	SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.Variable40"; $_t_oldMethodName)
