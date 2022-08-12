//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD_at_ResultNames2;0)
	//ARRAY TEXT(SD_at_ResultCodes2;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; dl_ResultT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Pop-up/Drop-down List1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SD_at_ResultNames2>0)
			
			[DIARY:12]Result_Code:11:=SD_at_ResultCodes2{SD_at_ResultNames2}
			dl_ResultT:=SD_at_ResultNames2{SD_at_ResultNames2}
			Diary_InD
			SD_at_ResultNames:=0
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Pop-up/Drop-down List1"; $_t_oldMethodName)
