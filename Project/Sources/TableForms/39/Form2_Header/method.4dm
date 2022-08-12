If (False:C215)
	//Table Form Method Name: [INVOICES]Form2_Header
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; PRT_bo_HasBreakFooter)
	C_LONGINT:C283($_l_event; PRT_l_FooterSize; PRT_l_HeaderSize; PRT_l_MaxSize; PRT_l_PageNo)
	C_TEXT:C284($_t_oldMethodName; WS_t_PageText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Form2_Header"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Printing Detail:K2:18)
		
		PRT_l_HeaderSize:=305
		PRT_l_MaxSize:=760
		PRT_l_FooterSize:=165
		PRT_bo_HasBreakFooter:=False:C215
		WS_t_PageText:="Page: "+String:C10(PRT_l_PageNo)
End case 
Invoices_FormLP
ERR_MethodTrackerReturn("FM [INVOICES].Form2_Header"; $_t_oldMethodName)
