If (False:C215)
	//Table Form Method Name: [CONTACTS]dAsk_NewCont
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
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; r1)
	C_TEXT:C284($_t_oldMethodName; SD_t_AttachContactCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VProfadd; vTitle2; VwholeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dAsk_NewCont"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "dAsk_NewCont")
		vTitle2:=""
		vProfadd:=""
		VwholeName:=""
		ARRAY TEXT:C222(AA_at_ProffesionallAdditions; 0)
		ARRAY TEXT:C222(AA_at_Salutations; 0)
		ARRAY TEXT:C222(AA_at_SNprefix; 0)
		
		r1:=1
		CREATE EMPTY SET:C140([CONTACTS:1]; "Rejected2")
		SD_t_AttachContactCode:=""
		WS_AutoscreenSize(2; 232; 369)
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[CONTACTS:1])
		
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].dAsk_NewCont"; $_t_oldMethodName)
