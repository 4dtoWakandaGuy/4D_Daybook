If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Jobs_TCSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_TrState;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Jobs_TCSub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Modified record:C314([ORDER_ITEMS:25]))
			DB_t_CurrentFormUsage:="JobTC"
			OrderI_SubLP
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Jobs_TCSub")
		If ((DB_GetModuleSettingByNUM(1))=5)
			[ORDER_ITEMS:25]State:46:="A"
			OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]State:46; False:C215)
		Else 
			If (SD_at_TrState=1)
				[ORDER_ITEMS:25]State:46:="B"
			Else 
				[ORDER_ITEMS:25]State:46:="A"
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
			OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Price_Code:36; False:C215)
		End if 
		DB_t_CurrentFormUsage:="JobTC"
		[ORDER_ITEMS:25]Job_Code:34:=[ORDERS:24]Your_Order_Number:10
		[ORDER_ITEMS:25]Job_Stage:35:=[ORDERS:24]Source:18
		[ORDER_ITEMS:25]Quantity:3:=1
		OrderI_SubLPB
End case 
ERR_MethodTrackerReturn("FM:Jobs_TCSub"; $_t_oldMethodName)
