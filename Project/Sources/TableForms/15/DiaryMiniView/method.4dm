If (False:C215)
	//Table Form Method Name: [USER]DiaryMiniView
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SD2_t_MiniDiarycode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DiaryMiniView"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "DiaryMiniView")
		If ([DIARY:12]Diary_Code:3#SD2_t_MiniDiarycode)
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SD2_t_MiniDiarycode)
		End if 
		//all we need here is to get the task type information
		
End case 
ERR_MethodTrackerReturn("FM [USER].DiaryMiniView"; $_t_oldMethodName)
