//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI_SubLPPC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentSelectedRecord; $_l_RecordsinSelection)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_SubLPPC")
//StockI_SubLPPC
If ([STOCK_MOVEMENTS:40]Company_From:2#"")
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
	QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[STOCK_MOVEMENTS:40]Company_From:2)
	If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		
	End if 
Else 
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
	
End if 

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
		If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
			$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
			$_l_CurrentSelectedRecord:=1
			Repeat 
				If ($_l_CurrentSelectedRecord<$_l_RecordsinSelection)
					If ([PRODUCTS_SUPPLIERS:148]Cost_Price:2=0)
						NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
						$_l_CurrentSelectedRecord:=$_l_CurrentSelectedRecord+1
					End if 
				End if 
			Until ($_l_CurrentSelectedRecord=$_l_RecordsinSelection) | ([PRODUCTS_SUPPLIERS:148]Cost_Price:2#0)
		End if 
	End if 
End if 
[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
vTot:=1
ERR_MethodTrackerReturn("StockI_SubLPPC"; $_t_oldMethodName)
