If (False:C215)
	//object Name: [USER]User_In.Field213
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_aI_PriorityDF;0)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_BOOLEAN:C305(SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_event; $_l_PriorityRow; SD_l_SaturdayWork; SD_l_SundayWork)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Field213"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([USER:15]SuperDiaryActive:245=True:C214)
			<>SD3_l_DiaryVersion:=1  //SuperDiary is active
			ARRAY TEXT:C222(DB_at_USERTAB; 16)
			DB_at_USERTAB{16}:="Time Manager"
			ARRAY LONGINT:C221(DB_al_UserTabPage; 16)
			DB_al_UserTabPage{16}:=16
			SD_LoadPrefs(-1)
			SD_l_SaturdayWork:=Num:C11(SD_bo_SaturdayWork)
			SD_l_SundayWork:=Num:C11(SD_bo_SundayWork)
			$_l_PriorityRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11([USER:15]Diary Priority:68))
			If ($_l_PriorityRow<0)
				$_l_PriorityRow:=Find in array:C230(SD_at_PriorityNM; [USER:15]Diary Priority:68)
			End if 
			If ($_l_PriorityRow<0)
				$_l_PriorityRow:=3
			End if 
			ARRAY INTEGER:C220(SD_aI_PriorityDF; Size of array:C274(SD_at_PriorityNM))
			SD_aI_PriorityDF{$_l_PriorityRow}:=1
			WT_DataManagerListBuild
		Else 
			<>SD3_l_DiaryVersion:=0  //SuperDiary is inactive
			ARRAY TEXT:C222(DB_at_USERTAB; 15)
			ARRAY LONGINT:C221(DB_al_UserTabPage; 15)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:User_In,015245"; $_t_oldMethodName)
