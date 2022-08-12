If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]PurchJobs_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vJob)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].PurchJobs_Sub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Modified record:C314([ORDER_ITEMS:25]))
			DB_t_CurrentFormUsage:="PJ"
			OrderI_SubLP
		End if 
		RELATE ONE:C42([ORDER_ITEMS:25]Job_Code:34)
		vJob:=[JOBS:26]Job_Name:2
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "PurchJobs_Sub")
		If ([ORDER_ITEMS:25]Item_Number:27=0)
			OrderI_NoPJ
			[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
			[ORDER_ITEMS:25]State:46:="A"
			[ORDER_ITEMS:25]Quantity:3:=1
		End if 
		vJob:=""
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].PurchJobs_Sub"; $_t_oldMethodName)
