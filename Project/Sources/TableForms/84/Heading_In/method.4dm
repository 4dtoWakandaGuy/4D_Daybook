If (False:C215)
	//Table Form Method Name: Object Name:      [HEADINGS].Heading_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 12:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].Heading_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)  //| ($_l_event=On Resize)
		WS_AutoscreenSize(2; 600; 460)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[HEADINGS:84]); "Heading_in")
		WS_AutoscreenSize(2; 600; 460)
		INT_SetInput(Table:C252(->[HEADINGS:84]); WIN_t_CurrentInputForm)
End case 
Headings_InLP
ERR_MethodTrackerReturn("FM:Heading_in"; $_t_oldMethodName)
