If (False:C215)
	//Table Form Method Name: [COMPANIES]COM_MiniView
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
	C_TEXT:C284($_t_oldMethodName; COM_at_AddressDetails; SD2_t_Minicompanycode; vDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].COM_MiniView"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If ([COMPANIES:2]Company_Code:1#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD2_t_Minicompanycode)
		End if 
		Address_Details
		COM_at_AddressDetails:=vDetails
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].COM_MiniView"; $_t_oldMethodName)
