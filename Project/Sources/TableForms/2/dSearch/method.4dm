If (False:C215)
	//Table Form Method Name: [COMPANIES]dSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; xNext)
	C_TEXT:C284($_t_oldMethodName; vRequest)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dSearch"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dSearch")
		Case of 
			: (Character code:C91(Substring:C12(vRequest; 1; 1))=215)
				vRequest:=Substring:C12(vRequest; 2; 32000)
				HIGHLIGHT TEXT:C210(vRequest; 100; 100)
			: (vRequest="•None")
				vRequest:=""
				OBJECT SET ENABLED:C1123(xNext; False:C215)
		End case 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(Current process)
		// : (Outside call)
		//   In_ButtdCall
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dSearch"; $_t_oldMethodName)
