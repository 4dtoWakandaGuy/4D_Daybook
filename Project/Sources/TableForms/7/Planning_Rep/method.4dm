If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Planning_Rep
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(DMT_UserDetails)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DM_T_UserName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Planning_Rep"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DM_T_UserName:=DB_GetOrganisation
		DMT_UserDetails:=DB_GetOrganisationAddress
		
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Planning_Rep"; $_t_oldMethodName)
