//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Subscript OIIte
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
	C_TEXT:C284($_t_oldMethodName; vProdName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript OIIte")
//Subscript OIIte - used in Del Not Items' LP to change the Product name
// & in Order FormSR
USE SET:C118("AMaster")
QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
FIRST RECORD:C50([SUBSCRIPTIONS:93])
If ([SUBSCRIPTIONS:93]Product_Name:2#"")
	If ([SUBSCRIPTIONS:93]Product_Name:2="+@")
		vProdName:=vProdName+Substring:C12([SUBSCRIPTIONS:93]Product_Name:2; 2; 32000)
	Else 
		vProdName:=[SUBSCRIPTIONS:93]Product_Name:2
	End if 
End if 
ERR_MethodTrackerReturn("Subscript OIIte"; $_t_oldMethodName)