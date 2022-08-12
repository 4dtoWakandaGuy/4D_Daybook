If (False:C215)
	//Table Form Method Name: [COMPANIES]dComp_Dedup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch1; ch3)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dComp_Dedup"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dComp_Dedup")
		ch1:=1
		ch3:=1
		OBJECT SET TITLE:C194(ch2; <>DB_t_Address1Label)
		OBJECT SET TITLE:C194(ch3; <>DB_t_TownLabel)
		OBJECT SET TITLE:C194(ch4; <>DB_t_PostcodeLabel)
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dComp_Dedup"; $_t_oldMethodName)
