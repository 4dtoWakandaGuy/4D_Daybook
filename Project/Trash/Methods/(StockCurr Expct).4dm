//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr Expct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_StockDates; 0)
	ARRAY LONGINT:C221($_al_ItemNumbers; 0)
	ARRAY REAL:C219($_ar_StockItemQuantities; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr Expct")
//StockCurr Expct - what you expect in
If (Count parameters:C259>=2)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$2; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0)
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		ARRAY LONGINT:C221($_al_ItemNumbers; 0)
		ARRAY REAL:C219($_ar_StockItemQuantities; 0)
		SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Item_Number:5; $_al_ItemNumbers; [CURRENT_STOCK:62]Quantity:4; $_ar_StockItemQuantities)
		$_l_ArraySize:=Size of array:C274($_al_ItemNumbers)
		ARRAY DATE:C224($_ad_StockDates; $_l_ArraySize)
		For ($_l_Index; 1; $_l_ArraySize)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_ItemNumbers{$_l_Index})
			$_ad_StockDates{$_l_Index}:=[ORDER_ITEMS:25]Supply_by_Date:31
		End for 
		SORT ARRAY:C229($_ad_StockDates; $_al_ItemNumbers; $_ar_StockItemQuantities; >)
		$0:=""
		For ($_l_Index; 1; $_l_ArraySize)
			$0:=$0+String:C10($_ar_StockItemQuantities{$_l_Index})+"  "+String:C10($_ad_StockDates{$_l_Index})+Char:C90(13)
		End for 
	Else 
		$0:="None"
	End if 
Else 
	$0:="None"
End if 
ERR_MethodTrackerReturn("StockCurr Expct"; $_t_oldMethodName)
