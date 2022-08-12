//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SubLPPC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPPC")
//OrderI_SubLPPC
If (DB_t_CurrentFormUsage="NAT")
	//DEFAULT TABLE([SERVICE CALLS])
Else 
	//DEFAULT TABLE([ORDERS])
End if 

Macro_AccType("PRD_SetFurtherAnal")
OrderI_SubLPPC2
OrderI_SubRel
vCompName:=[COMPANIES:2]Company_Name:2
If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
	If ([PRODUCTS:9]Issues_Number:27>0)
		If (([ORDER_ITEMS:25]Invoice_Number:17="") | ([ORDER_ITEMS:25]Invoice_Number:17="SUBS"))
			[ORDER_ITEMS:25]Invoice_Number:17:="SUBS*"
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubLPPC"; $_t_oldMethodName)
