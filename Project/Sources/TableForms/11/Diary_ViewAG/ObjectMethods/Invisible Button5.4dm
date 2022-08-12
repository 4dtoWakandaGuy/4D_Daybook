If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Invisible Button5
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
	C_LONGINT:C283($_l_event; SD_l_ToSortDirection)
	C_PICTURE:C286(SD_Pic_ToDoSort)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Invisible Button5"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_l_ToSortDirection:=Abs:C99(SD_l_ToSortDirection-1)
		//GET PICTURE FROM LIBRARY(22223-SD_l_ToSortDirection; SD_Pic_ToDoSort)
		SD_Pic_ToDoSort:=Get_Picture(22223-SD_l_ToSortDirection)
		
		SD_HL_Sort(3)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Invisible Button5"; $_t_oldMethodName)
