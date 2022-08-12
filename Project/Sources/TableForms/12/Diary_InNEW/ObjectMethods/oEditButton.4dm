If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oEditButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $SPAN; CB_Edit; SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oEditButton"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Read only state:C362([DIARY:12]))
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			[DIARY:12]Done:14:=False:C215
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
			SD_l_EditingDiaryRecord:=1
			
		End if 
		CB_Edit:=0
		
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oEditButton"; $_t_oldMethodName)
