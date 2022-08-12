If (False:C215)
	//object Name: [USER]Diary_Types.oThreadedObjects3
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
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_event; sRB_l_Diary; sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_Types.oThreadedObjects3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		sRB_l_Original:=Abs:C99(sRB_l_Diary-1)
		SD2_bo_recordModified:=True:C214
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Diary_Types.oThreadedObjects3"; $_t_oldMethodName)
