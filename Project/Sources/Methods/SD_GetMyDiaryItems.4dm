//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetMyDiaryItems
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
	//ARRAY LONGINT(<>SD_al_DiaryItemsCheck;0)
	C_BOOLEAN:C305($_bo_OK; procComplete)
	C_DATE:C307(SDgetdate)
	C_LONGINT:C283(SDgetpersonID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetMyDiaryItems")
$_bo_OK:=False:C215
Repeat 
	PAUSE PROCESS:C319(Current process:C322)
	procComplete:=False:C215
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=SDgetpersonID)
	RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4=SDgetdate; *)
	QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Done:14=False:C215; *)
	QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
	RELATE MANY SELECTION:C340([DIARY_ITEMOWNERS:106]DIARY_CODE:1)
	LONGINT ARRAY FROM SELECTION:C647([DIARY_ITEMOWNERS:106]; <>SD_al_DiaryItemsCheck)
	UNLOAD RECORD:C212([DIARY:12])
	UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
	procComplete:=True:C214
Until ($_bo_OK)
ERR_MethodTrackerReturn("SD_GetMyDiaryItems"; $_t_oldMethodName)