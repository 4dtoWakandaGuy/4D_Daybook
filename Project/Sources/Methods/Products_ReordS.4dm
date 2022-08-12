//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_ReordS
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
	C_LONGINT:C283(vStockLevel)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_ReordS")
Products_Reord2
vStockLevel:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
$0:=(vStockLevel<[PRODUCTS:9]Minimum:11)
ERR_MethodTrackerReturn("Products_ReordS"; $_t_oldMethodName)