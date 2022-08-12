If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].Diary_In
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; vTimesTitle; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  // | ($_l_event=On Resize )
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_In")
		vTimesTitle:="Time"
		WS_AutoscreenSize(1; 420; 580; Table name:C256(->[DIARY:12])+"_"+"Diary_In")
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
End case 
Diary_InLP
ERR_MethodTrackerReturn("FM [DIARY].Diary_In"; $_t_oldMethodName)
