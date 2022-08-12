If (False:C215)
	//Table Form Method Name: Object Name:      [HEADINGS].TB_Subtotal
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(VATOT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].TB_Subtotal"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
End case 
ERR_MethodTrackerReturn("FM [HEADINGS].TB_Subtotal"; $_t_oldMethodName)
