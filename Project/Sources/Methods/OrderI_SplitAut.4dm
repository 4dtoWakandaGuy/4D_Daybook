//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SplitAut
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
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SplitAut")
QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; OrderI_SplitSrc)
CREATE SET:C116([ORDER_ITEMS:25]; "$Set")
While (Records in set:C195("$Set")>0)
	ONE RECORD SELECT:C189([ORDER_ITEMS:25])
	CREATE SET:C116([ORDER_ITEMS:25]; "$one")
	DIFFERENCE:C122("$Set"; "$one"; "$Set")
	vQuantity:=Gen_Round(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2; 6)
	If (OK=1)
		OrderI_Split2
	End if 
	USE SET:C118("$Set")
End while 
ERR_MethodTrackerReturn("OrderI_SplitAut"; $_t_oldMethodName)