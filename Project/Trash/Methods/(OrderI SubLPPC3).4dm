//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubLPPC3
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CurrentSelectedRecord; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPPC3")
//OrderI_SubLPPC3
QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; >)
If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
	$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
	$_l_CurrentSelectedRecord:=1
	Repeat 
		If ($_l_CurrentSelectedRecord<$_l_RecordsinSelection)
			If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
				NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
				$_l_CurrentSelectedRecord:=$_l_CurrentSelectedRecord+1
			End if 
		End if 
	Until ($_l_CurrentSelectedRecord=$_l_RecordsinSelection) | ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
	If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10=0)
		ORDER BY:C49([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; >)
	End if 
End if 
OrderI_SubCostI
If ([PRODUCTS_SUPPLIERS:148]Company_Code:1#"")
	[ORDER_ITEMS:25]Supplier_Code:20:=[PRODUCTS_SUPPLIERS:148]Company_Code:1
	[ORDER_ITEMS:25]Supply_by_Date:31:=<>DB_d_CurrentDate+[PRODUCTS_SUPPLIERS:148]Lead_Days:6
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
		If (([PRODUCTS:9]Bundle_Assembly:36) | ([PRODUCTS:9]Bundle_Show:37=2))
			QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
			If (Records in selection:C76([COMPONENTS:86])>0)
				If ([PRODUCTS:9]Bundle_Assembly:36)
					[ORDER_ITEMS:25]Purchase_Order_Number:18:="BUNDLE*"
				Else 
					[ORDER_ITEMS:25]Purchase_Order_Number:18:="ASSEMBLY*"
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubLPPC3"; $_t_oldMethodName)
