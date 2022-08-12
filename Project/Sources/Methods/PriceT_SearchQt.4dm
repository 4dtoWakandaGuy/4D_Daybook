//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_SearchQt
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
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_SearchQt")
If (Count parameters:C259=0)
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=[ORDER_ITEMS:25]Quantity:3; *)
	QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>=[ORDER_ITEMS:25]Quantity:3)
Else 
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$1; *)
	QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>=$1)
End if 
ERR_MethodTrackerReturn("PriceT_SearchQt"; $_t_oldMethodName)