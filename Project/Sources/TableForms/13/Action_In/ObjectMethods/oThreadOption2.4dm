If (False:C215)
	//object Name: [ACTIONS]Action_In.oThreadOption2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 23:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_event; SD2_l_CBThreaded; sRB_l_Diary; sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oThreadOption2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		sRB_l_Original:=Abs:C99(sRB_l_Diary-1)
		//SD2_l_CBThreaded
		SD2_bo_recordModified:=True:C214
		[ACTIONS:13]IsThreaded:14:=(SD2_l_CBThreaded=1)
		[ACTIONS:13]ThreadOption:15:=1
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oThreadOption2"; $_t_oldMethodName)
