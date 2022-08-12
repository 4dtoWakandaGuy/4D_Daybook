If (False:C215)
	//Table Form Method Name: [ADDITIONAL_RECORD_ANALYSIS]Furthers_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ADDITIONAL_RECORD_ANALYSIS].Furthers_in"; Form event code:C388)
$_l_event:=Form event code:C388
Minor_LP_Ex(->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; ->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3; ->[ADDITIONAL_RECORD_ANALYSIS:53]; "Furthers"; "1"; "")


Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		//WS_AutoscreenSize(2; 180; )
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); "Furthers_in")
		WS_AutoscreenSize(2; 180; 615)
		INT_SetInput(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); "Furthers_in")
		If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); "Furthers_in")
		If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]); "Furthers_in")
		If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:Furthers_In"; $_t_oldMethodName)
