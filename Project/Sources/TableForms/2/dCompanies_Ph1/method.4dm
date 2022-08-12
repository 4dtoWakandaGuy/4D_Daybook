If (False:C215)
	//Table Form Method Name: [COMPANIES]dCompanies_Ph1
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
	C_LONGINT:C283($_l_event; ch0; ch1; ch2; ch4; r1; s1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dCompanies_Ph1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dCompanies_Ph1")
		ch0:=1
		ch1:=1
		ch2:=1
		ch4:=1
		r1:=1
		s1:=1
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dCompanies_Ph1"; $_t_oldMethodName)
