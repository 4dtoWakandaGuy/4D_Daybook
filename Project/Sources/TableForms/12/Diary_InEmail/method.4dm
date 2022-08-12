If (False:C215)
	//Table Form Method Name: [DIARY]Diary_InEmail
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_event; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_InEmail"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Case of 
				
				
			: ([DOCUMENTS:7]Document_Class:14=Text Email)
				
				FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
				READ WRITE:C146([USER:15])
				If (<>SYS_l_LoggedInaccount=0)
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
				Else 
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
				End if 
				MODIFY RECORD:C57([USER:15]; *)
				CANCEL:C270
			: ([DOCUMENTS:7]Document_Class:14#0)
				FORM SET INPUT:C55([DIARY:12]; "Diary_inLW")
				
			Else 
				OpenHelp(Table:C252(->[DIARY:12]); "Diary_InEmail")
				INT_SetInput(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentInputForm)
				DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_InEmail")
				If (Records in selection:C76([DIARY:12])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
				
		End case 
	: ($_l_event=On Unload:K2:2)
		
End case 

Diary_InLLP
ERR_MethodTrackerReturn("FM:Diary_InEmail"; $_t_oldMethodName)
