//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGB8
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB8")
RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
$0:=[PRODUCTS:9]Price_List:8
ERR_MethodTrackerReturn("Orders_ListVGB8"; $_t_oldMethodName)