If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_NewComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bo_CompanyRejected)
	C_LONGINT:C283($_l_event; r2)
	C_TEXT:C284($_t_oldMethodName; SD_t_AttachContactCode; vCompany; vCompName; vContract; VProfadd; vSearch; vTitle2; VwholeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_NewComp"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_NewComp")
		
		SD_bo_CompanyRejected:=False:C215
		
		CREATE EMPTY SET:C140([COMPANIES:2]; "Rejected")
		CREATE EMPTY SET:C140([CONTACTS:1]; "Rejected2")
		SD_t_AttachContactCode:=""
		WS_AutoscreenSize(2; 232; 369)
		vTitle2:=""
		vProfadd:=""
		VwholeName:=""
		ARRAY TEXT:C222(AA_at_ProffesionallAdditions; 0)
		ARRAY TEXT:C222(AA_at_Salutations; 0)
		ARRAY TEXT:C222(AA_at_SNprefix; 0)
		r2:=1
		GOTO OBJECT:C206(VcompName)
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_NewComp"; $_t_oldMethodName)
