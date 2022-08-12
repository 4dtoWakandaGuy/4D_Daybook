If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_ViewAG.3D Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SD_bo_ViewingList; SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_event; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.3D Button1"; Form event code:C388)
$_l_event:=Form event code:C388
If (False:C215)
	Case of 
		: ($_l_event=On Clicked:K2:4)
			If (Not:C34(<>SD_bo_ViewingList))
				<>SD_bo_ViewingList:=True:C214
				SD_l_RecNeedssaving:=1
				SD_l_EditingDiaryRecord:=1
				SD_bo_AddingDiaryRecord:=True:C214
				If (Modified record:C314([DIARY:12]))
					SuperDiary_SaveChk
				End if 
				
				USE SET:C118("DMaster")
				If (Records in selection:C76([DIARY:12])>0)
					
					CREATE SET:C116([DIARY:12]; "◊passedSet")
					ZProc("Diary_Mod_Selection"; DB_ProcessMemoryinit(4); "View Diary")
				Else 
					CREATE EMPTY SET:C140([DIARY:12]; "◊passedSet")
					Gen_Alert("There are no records to display")
					
				End if 
			End if 
			
		: ($_l_event=On Double Clicked:K2:5)
			If (Not:C34(<>SD_bo_ViewingList))
				<>SD_bo_ViewingList:=True:C214
				
				SD_l_RecNeedssaving:=1
				SD_l_EditingDiaryRecord:=1
				SD_bo_AddingDiaryRecord:=True:C214
				If (Modified record:C314([DIARY:12]))
					SuperDiary_SaveChk
				End if 
				
				USE SET:C118("DMaster")
				If (Records in selection:C76([DIARY:12])>0)
					
					CREATE SET:C116([DIARY:12]; "◊passedSet")
					ZProc("Diary_Mod_Selection"; DB_ProcessMemoryinit(4); "View Diary")
				Else 
					CREATE EMPTY SET:C140([DIARY:12]; "◊passedSet")
					Gen_Alert("There are no records to display")
					
				End if 
			End if 
			
	End case 
Else 
	//New Code
	
	
	ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary")
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.3D Button1"; $_t_oldMethodName)
