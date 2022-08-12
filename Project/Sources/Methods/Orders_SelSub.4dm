//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_SelSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 06:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection; $l)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_SelSub")
QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0)
$_l_RecordsInSelection:=Records in selection:C76([SUBSCRIPTIONS:93])
OK:=1
If ($_l_RecordsInSelection>10000)
	Gen_Confirm("There are "+String:C10($_l_RecordsInSelection)+" records to link, which may take some time.  Proceed?"; "Yes"; "No")
End if 
If (OK=1)
	CREATE EMPTY SET:C140([ORDERS:24]; "Master")
	
	SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_OrderItemNumbers)
	SORT ARRAY:C229($_al_OrderItemNumbers; >)
	$l:=0
	For ($_l_Index; 1; $_l_RecordsInSelection)
		If ($l#$_al_OrderItemNumbers{$_l_Index})
			$l:=$_al_OrderItemNumbers{$_l_Index}
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumbers{$_l_Index})
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			ADD TO SET:C119([ORDERS:24]; "Master")
		End if 
	End for 
	
	INTERSECTION:C121("Master"; "OrMaster"; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118("OrMaster")
	CREATE SET:C116([ORDERS:24]; "Master")
End if 
ERR_MethodTrackerReturn("Orders_SelSub"; $_t_oldMethodName)
