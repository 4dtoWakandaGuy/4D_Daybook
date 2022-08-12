If (False:C215)
	//Table Form Method Name: [JOB_TYPES]types_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 07:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; $_l_event)
	C_TEXT:C284(DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm; $_t_oldMethodName; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_TYPES].types_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
		
		WS_AutoscreenSize(1; 435; 610)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[JOB_TYPES:65]); "types_in")
		WS_AutoscreenSize(1; 435; 610)
		INT_SetInput(Table:C252(->[JOB_TYPES:65]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[JOB_TYPES:65]); "types_in")
		If (Records in selection:C76([JOB_TYPES:65])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_event=On Resize:K2:27)
		INT_SetInput(Table:C252(->[JOB_TYPES:65]); WIN_t_CurrentInputForm)
End case 
JTypes_InLP
ERR_MethodTrackerReturn("FM:[ORDER_ITEMS].Items_in"; $_t_oldMethodName)
