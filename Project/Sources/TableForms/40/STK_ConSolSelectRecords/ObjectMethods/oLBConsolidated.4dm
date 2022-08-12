If (False:C215)
	//object Name: [STOCK_MOVEMENTS]STK_ConSolSelectRecords.oLBConsolidated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_ab_Selected;0)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY INTEGER(STK_ad_DisplayDates;0)
	//ARRAY REAL(STK_ar_aisplayQuantities;0)
	//ARRAY REAL(STK_ar_OldQuantity;0)
	//ARRAY TEXT(STK_at_DisplayReferences;0)
	C_DATE:C307($_d_DisplayDate)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_REAL:C285($_r_SplitOff)
	C_TEXT:C284($_t_DisplayReference; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].STK_ConSolSelectRecords.oLBConsolidated"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(STK_LB_StockItems; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)  //Quantity
				If (STK_ar_aisplayQuantities{$_l_Row}>STK_ar_OldQuantity{$_l_Row})
					Gen_Alert("You may not increase the expected quantity for a reference here")
					STK_ar_aisplayQuantities{$_l_Row}:=STK_ar_OldQuantity{$_l_Row}
				Else 
					If (STK_ar_aisplayQuantities{$_l_Row}<STK_ar_OldQuantity{$_l_Row})
						$_r_SplitOff:=STK_ar_OldQuantity{$_l_Row}-STK_ar_aisplayQuantities{$_l_Row}
						$_t_DisplayReference:=STK_at_DisplayReferences{$_l_Row}
						$_d_DisplayDate:=STK_ad_DisplayDates{$_l_Row}
						APPEND TO ARRAY:C911(STK_ab_Selected; False:C215)
						APPEND TO ARRAY:C911(STK_ar_OldQuantity; $_r_SplitOff)
						APPEND TO ARRAY:C911(STK_ar_aisplayQuantities; $_r_SplitOff)
						APPEND TO ARRAY:C911(STK_at_DisplayReferences; $_t_DisplayReference)
						APPEND TO ARRAY:C911(STK_ad_DisplayDates; $_d_DisplayDate)
						STK_ar_OldQuantity{$_l_Row}:=STK_ar_aisplayQuantities{$_l_Row}
						
					End if 
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].STK_ConSolSelectRecords.oLBConsolidated"; $_t_oldMethodName)
