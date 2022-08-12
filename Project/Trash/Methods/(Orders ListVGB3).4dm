//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_ListVGB3
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
	//Array TEXT(GEN_at_Identity;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB3")
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
FIRST RECORD:C50([ORDER_ITEMS:25])
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
	If (Find in array:C230(GEN_at_Identity; [ORDER_ITEMS:25]Product_Code:2)>0)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		$0:=$0+[PRODUCTS:9]Model_Code:5+", "
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
$0:=Substring:C12($0; 1; Length:C16($0)-2)
ERR_MethodTrackerReturn("Orders_ListVGB3"; $_t_oldMethodName)