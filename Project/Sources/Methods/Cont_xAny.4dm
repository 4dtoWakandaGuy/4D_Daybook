//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_xAny
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 21:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xSelect)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_xAny")
//xAdd Contacts to Diary
If ((DB_GetModuleSettingByNUM(Module_DiaryManager)=2) | (DB_GetModuleSettingByNUM(Module_DiaryManager)=4))
	If (Records in set:C195("Userset")>0)
		CREATE SET:C116([CONTACTS:1]; "OMaster")
		USE SET:C118("userset")
		CREATE SET:C116([CONTACTS:1]; "Extra")
		READ WRITE:C146([DIARY:12])
		DB_t_CurrentFormUsage:="AddO"
		Diary_FileI
		Open_Pro_Window("Enter Multiple Diary Items"; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
		ADD RECORD:C56([DIARY:12]; *)
		Close_ProWin(Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		If (OK=1)
			
			USE SET:C118("Extra")
			Gen_Confirm("Add "+String:C10(Records in selection:C76([CONTACTS:1]))+" Diary Items?"; "Yes"; "No")
			If (OK=1)
				CREATE SET:C116([DIARY:12]; "DMaster")
				FIRST RECORD:C50([CONTACTS:1])
				While (Not:C34(End selection:C36([CONTACTS:1])))
					USE SET:C118("DMaster")
					DUPLICATE RECORD:C225([DIARY:12])
					[DIARY:12]x_ID:50:=0
					
					DiarySetCode
					[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
					[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
					RELATE ONE:C42([CONTACTS:1]Company_Code:1)
					If ([DIARY:12]Person:8="")
						[DIARY:12]Person:8:=[COMPANIES:2]Sales_Person:29
						If ([DIARY:12]Person:8="")
							[DIARY:12]Person:8:=[COMPANIES:2]Taken_By:26
						End if 
					End if 
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
					NEXT RECORD:C51([CONTACTS:1])
				End while 
				USE SET:C118("DMaster")
			End if 
			DB_DeletionControl(->[DIARY:12])
			
			DELETE RECORD:C58([DIARY:12])
		End if 
		UNLOAD RECORD:C212([DIARY:12])
		READ ONLY:C145([DIARY:12])
		DB_t_CurrentFormUsage:=""
		USE SET:C118("OMaster")
		//_O_ENABLE BUTTON(xSelect)
		OBJECT SET ENABLED:C1123(xSelect; True:C214)
	Else 
		Gen_Alert("Please first highlight the records to which you "+"want to allocate Diary Items"; "Try again")
	End if 
Else 
	Gen_Alert("You do not have Access to the Diary Manager"; "Cancel")
End if 
ERR_MethodTrackerReturn("Cont_xAny"; $_t_oldMethodName)