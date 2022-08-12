If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELDS]dFurthFld
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/05/2011 16:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELDS].dFurthFld"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad)) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 450; 570)
		INT_SetInput(Table:C252(->[CUSTOM_FIELDS:98]); WIN_t_CurrentInputForm)
		
End case 
FurthFld_InLP
ERR_MethodTrackerReturn("FM:dFurthFld"; $_t_oldMethodName)
