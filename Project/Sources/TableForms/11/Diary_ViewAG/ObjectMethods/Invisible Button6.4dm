If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Invisible Button6
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
	//ARRAY BOOLEAN(SD_LB_Items;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Invisible Button6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LBi_SCPT_ArrowClick(->SD_LB_Items; "down")  // 26/06/06 pb
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Invisible Button6"; $_t_oldMethodName)
