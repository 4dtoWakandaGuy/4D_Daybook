//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders StockSel
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

$_t_oldMethodName:=ERR_MethodTracker("Orders StockSel")
RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
$0:=([MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
ERR_MethodTrackerReturn("Orders StockSel"; $_t_oldMethodName)