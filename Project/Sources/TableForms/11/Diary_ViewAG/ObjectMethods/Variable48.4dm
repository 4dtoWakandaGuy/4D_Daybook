If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Variable48
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
	C_LONGINT:C283($_l_event; SD_l_EventSortDirection)
	C_PICTURE:C286(SD_Pic_EventSort)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable48"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_l_EventSortDirection:=Abs:C99(SD_l_EventSortDirection-1)
		//GET PICTURE FROM LIBRARY(22223-SD_l_EventSortDirection; SD_Pic_EventSort)
		SD_Pic_EventSort:=Get_Picture(22223-SD_l_EventSortDirection)
		SD_HL_Sort(1)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Variable48"; $_t_oldMethodName)
