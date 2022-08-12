If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Highlight Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_OpenDocument;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Highlight Button1"; Form event code:C388)
If (SD_at_OpenDocument>0)
	Case of 
		: (SD_at_OpenDocument=1)
			DB_OpenWordDoc
		: (SD_at_OpenDocument=3)  //open letter
			
			//open letter
			If ([DIARY:12]Diary_Code:3#"")
				Diary_LetSee
			Else 
				ZDiary_ModL
			End if 
		: (SD_at_OpenDocument=4)
			If ([DIARY:12]Diary_Code:3#"")
				Diary_LetSee
			Else 
				ZDiary_ModL
			End if 
		: (SD_at_OpenDocument=5)
			If ([DIARY:12]Diary_Code:3#"")
			Else 
			End if 
	End case 
End if 

SD_at_OpenDocument:=0
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Highlight Button1"; $_t_oldMethodName)
