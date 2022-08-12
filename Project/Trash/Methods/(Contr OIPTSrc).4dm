//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr_OIPTSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2010 12:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr_OIPTSrc")

If (DB_t_CurrentFormUsage3=[ORDER_ITEMS:25]Product_Code:2)
	$0:=DB_bo_RecordModified
Else 
	$0:=False:C215
	If ([ORDER_ITEMS:25]Product_Code:2#"")
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
			PriceT_FilterDates
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3)
				PriceT_FilterDates
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[CONTRACT_TYPES:19]Price_Group:7; *)
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
					PriceT_FilterDates
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						$0:=True:C214
					End if 
				Else 
					$0:=True:C214
				End if 
			Else 
				$0:=True:C214
			End if 
		Else 
			$0:=True:C214
		End if 
	End if 
	DB_t_CurrentFormUsage3:=[ORDER_ITEMS:25]Product_Code:2
	DB_bo_RecordModified:=$0
End if 
ERR_MethodTrackerReturn("Contr_OIPTSrc"; $_t_oldMethodName)