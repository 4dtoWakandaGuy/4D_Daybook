//%attributes = {}
If (False:C215)
	//Project Method Name:      Subscript_LetDe
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
	C_LONGINT:C283(rOrd)
	C_TEXT:C284($_t_oldMethodName; ProductsD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript_LetDe")
//Subscript_LetDe tails - called from Letter_AllDets
If (rOrd=2)
	USE SET:C118("AMaster")
	QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
End if 
If (rOrd=3)
	Subscript_OIFin
	ProductsD:=""
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
		ProductsD:=ProductsD+String:C10([ORDER_ITEMS:25]Quantity:3)+" * "+[ORDER_ITEMS:25]Product_Name:13+Char:C90(13)
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
End if 
ERR_MethodTrackerReturn("Subscript_LetDe"; $_t_oldMethodName)