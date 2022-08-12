If (False:C215)
	//Table Form Method Name: [USER]Contact_select
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ContactInfo;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Bottom; $_l_Bottom2; $_l_event; $_l_Left; $_l_Left2; $_l_Right; $_l_Right2; $_l_Top; $_l_Top2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Contact_select"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Contact_select")
		WS_AutoscreenSize(2; 190; 365)
		SET WINDOW TITLE:C213("Similiar Contact Names")
		SD_at_ContactInfo:=0  //ensure no company selected
		INT_SetDialog
		OBJECT GET COORDINATES:C663(*; "oSelectContact"; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
		OBJECT GET COORDINATES:C663(*; "oLBContactInfor"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
		OBJECT SET COORDINATES:C1248(*; "oLBContactInfor"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Top-5)
End case 
ERR_MethodTrackerReturn("FM [USER].Contact_select"; $_t_oldMethodName)
