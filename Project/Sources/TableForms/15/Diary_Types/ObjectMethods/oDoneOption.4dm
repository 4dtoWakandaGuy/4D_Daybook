If (False:C215)
	//object Name: [USER]Diary_Types.oDoneOption
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_Types.oDoneOption"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		SD2_bo_recordModified:=True:C214
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Diary_Types.oDoneOption"; $_t_oldMethodName)
