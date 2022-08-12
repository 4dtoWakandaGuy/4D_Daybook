If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oDiaryActionFilter9
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oDiaryActionFilter9"; Form event code:C388)
//
//Added 11/07/08 -kmw
//
$_l_event:=Form event code:C388
If ($_l_event=On Data Change:K2:15)
	SD2_DiaryVIewManageView(-1)
End if 
//
//
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oDiaryActionFilter9"; $_t_oldMethodName)