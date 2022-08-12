If (False:C215)
	//Table Form Method Name: [COMPANIES]StatementWDetail
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].StatementWDetail"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		Comp_StateLP
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].StatementWDetail"; $_t_oldMethodName)
