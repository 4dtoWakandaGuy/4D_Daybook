If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Items_List
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


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items_List"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
	Orders_Status
	vVATTitleF:=Term_VATWT("VAT")
End if 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Items_List"; $_t_oldMethodName)
