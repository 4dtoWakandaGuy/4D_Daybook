If (False:C215)
	//Table Form Method Name: [ORDERS]Orders_List
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
	C_TEXT:C284($_t_oldMethodName; vContName; vTitleR; vVATTitleF)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Orders_List"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
	
	RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	vContName:=[CONTACTS:1]Contact_Name:31
	Orders_Status
	vTitleR:="SALES ORDERS"
	vVATTitleF:=Term_VATWT("VAT")
End if 
ERR_MethodTrackerReturn("FM [ORDERS].Orders_List"; $_t_oldMethodName)
