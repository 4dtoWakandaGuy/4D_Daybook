If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Items Print
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
	C_TEXT:C284($_t_oldMethodName; vVATTitleF)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items Print"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	vVATTitleF:=Term_VATWT("VAT/Total")
	Form_vT([ORDER_ITEMS:25]Print_Description:45; [ORDER_ITEMS:25]Description:44)
End if 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Items Print"; $_t_oldMethodName)
