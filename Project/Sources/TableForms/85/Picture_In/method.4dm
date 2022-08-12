If (False:C215)
	//Table Form Method Name: [PICTURES]Picture_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2011 13:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(WIN_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PICTURES].Picture_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PICTURES:85]); "Picture_In")
		WS_AutoscreenSize(2; 610; 590)
		INT_SetInput(Table:C252(->[PICTURES:85]); WIN_t_CurrentInputForm)
		
End case 
Pictures_InLP
ERR_MethodTrackerReturn("FM:[PICTURES].Picture_In"; $_t_oldMethodName)
