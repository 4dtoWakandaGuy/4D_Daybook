If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch1; r2; s1; s2; s3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_List"; Form event code:C388)
//LP dAsk_List
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_List")
		r2:=1
		s2:=1
		ch1:=1
		OBJECT SET ENABLED:C1123(ch1; False:C215)
		OBJECT SET ENABLED:C1123(s1; False:C215)
		OBJECT SET ENABLED:C1123(s2; False:C215)
		OBJECT SET ENABLED:C1123(s3; False:C215)
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Data Change:K2:15)
		If (r2=0)
			OBJECT SET ENABLED:C1123(ch1; True:C214)
			OBJECT SET ENABLED:C1123(s1; True:C214)
			OBJECT SET ENABLED:C1123(s2; True:C214)
			OBJECT SET ENABLED:C1123(s3; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(ch1; False:C215)
			OBJECT SET ENABLED:C1123(s1; False:C215)
			OBJECT SET ENABLED:C1123(s2; False:C215)
			OBJECT SET ENABLED:C1123(s3; False:C215)
		End if 
		
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_List"; $_t_oldMethodName)
