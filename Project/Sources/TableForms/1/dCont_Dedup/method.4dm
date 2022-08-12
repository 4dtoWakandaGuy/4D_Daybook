If (False:C215)
	//Table Form Method Name: [CONTACTS]dCont_Dedup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch6; ch7)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>Forename; <>Surname; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dCont_Dedup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "dCont_Dedup")
		ch6:=1
		ch7:=1
		OBJECT SET TITLE:C194(ch2; <>DB_t_Address1Label)
		OBJECT SET TITLE:C194(ch3; <>DB_t_TownLabel)
		OBJECT SET TITLE:C194(ch4; <>DB_t_PostcodeLabel)
		OBJECT SET TITLE:C194(ch6; <>Forename)
		OBJECT SET TITLE:C194(ch7; <>Surname)
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[CONTACTS:1])
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].dCont_Dedup"; $_t_oldMethodName)
