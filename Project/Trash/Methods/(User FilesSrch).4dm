//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User FilesSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>UserAdd; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User FilesSrch")
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1<=999; *)
QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#14; *)
If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#4; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#15; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#19; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#25; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_WPManager))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#5; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesOrders)<2) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2))
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#6; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#13; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#14; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_NominalLedger))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#7; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#8; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#28; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
	
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#9; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#12; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#10; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#18; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#16; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#17; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_Sequences))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#20; *)
End if 
If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#21; *)
End if 
If (<>UserAdd#"@avid@")
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#26; *)
	QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1#27; *)
End if 

QUERY:C277([IDENTIFIERS:16])
ORDER BY:C49([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1; >)
ERR_MethodTrackerReturn("User FilesSrch"; $_t_oldMethodName)