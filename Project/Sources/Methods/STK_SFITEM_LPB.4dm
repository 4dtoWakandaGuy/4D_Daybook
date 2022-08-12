//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SFITEM_LPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2011 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283(STK_l_ClassDirection)
	C_TEXT:C284($_t_oldMethodName; vLocation; vProduct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SFITEM_LPB")

If ([SF_STOCKMOVEMENT_ITEMS:194]X_ID:1=0)
	[SF_STOCKMOVEMENT_ITEMS:194]X_ID:1:=AA_GetNextIDinMethod(->[SF_STOCKMOVEMENT_ITEMS:194]X_ID:1)
	
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2="")
	[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2:=[SF_STOCKMOVEMENTS:193]Movement_Code:2
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4=0)
	[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=1
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Code:2=[SF_STOCKMOVEMENTS:193]Movement_Code:2)
	[SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_Date:29:=[SF_STOCKMOVEMENTS:193]Created_Date:7
	STK_MovementHeaderIN_LPB
End if 
STK_l_ClassDirection:=STK_L_ItemGetDirection([SF_STOCKMOVEMENT_ITEMS:194]Stock_Movement_MovementType:27; [SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockTypePrevious:22; [SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_StockType:21)

vProduct:=""
vLocation:=""
If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
	OBJECT SET ENTERABLE:C238([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; False:C215)
	OBJECT SET VISIBLE:C603(*; "oSerials"; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENT_ITEMS:194]Currency:5; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCurrencies"; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Layer:23; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLayers"; False:C215)
End if 
If (Not:C34(<>StockAnal))
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Analysis:25; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAnalysis"; False:C215)
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6#0)
	[SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)  //4.0.035/6
	If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0) | (STK_l_ClassDirection=1) | (STK_l_ClassDirection=-1)  //1 means in coming or -1 means outgoing
		If (STK_l_ClassDirection#-2)
			//if in coming
			Case of 
				: (STK_l_ClassDirection=1)
					[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6
					//anything else
				: (STK_l_ClassDirection=-1)
					//[SF_STOCKMOVEMENT_ITEMS]Stock_item_AccountingUnitCost-[SF_STOCKMOVEMENT_ITEMS]Unit_Cost_Value
				Else 
					If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0)
						[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6-[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19
					End if 
			End case 
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)
		End if 
	End if 
End if 
If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_Thread_Reference:9=0)
	
	//only do this is we are putting the record on screen-so contect here!!
	//get the rest of the thread into arrays
End if 
//[SF_STOCKMOVEMENT_ITEMS]Assembly_Component_Quantity
//[SF_STOCKMOVEMENT_ITEMS]Assembly_Required_Quantity
//[SF_STOCKMOVEMENT_ITEMS]Currency
//[SF_STOCKMOVEMENT_ITEMS]Currency_Previous
//[SF_STOCKMOVEMENT_ITEMS]Current_Stock_ID
//[SF_STOCKMOVEMENT_ITEMS]Current_Stock_Representational
//[SF_STOCKMOVEMENT_ITEMS]Current_StockIDPrevious
//[SF_STOCKMOVEMENT_ITEMS]Item_Movement_Class
//[SF_STOCKMOVEMENT_ITEMS]Previous_CS_Representational
//[SF_STOCKMOVEMENT_ITEMS]Stock_item_AnalysisPrevious
//[SF_STOCKMOVEMENT_ITEMS]Stock_item_Barcode
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_CalledOff_Quantity
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_layerPrevious
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_Location
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_Location_Reference
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_PreviousBarCode
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_PreviousID
//[SF_STOCKMOVEMENT_ITEMS]Stock_item_PreviousLocation
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_PreviousSerial
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_ResidualQuantity
//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_Status
//[SF_STOCKMOVEMENT_ITEMS]Stock_item_Status_Name
//[SF_STOCKMOVEMENT_ITEMS]Stock_itemInverted



//[SF_STOCKMOVEMENT_ITEMS]StockItem_NoCurrentStock
ERR_MethodTrackerReturn("STK_SFITEM_LPB"; $_t_oldMethodName)
