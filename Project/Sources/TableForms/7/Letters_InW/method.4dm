If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Letters_inW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(WIN_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Letters_inW"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WIN_t_CurrentInputForm:="Letters_inW"
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "Letters_inW")
		
End case 

Letters_InLP
ERR_MethodTrackerReturn("FM:Letters_inW"; $_t_oldMethodName)
