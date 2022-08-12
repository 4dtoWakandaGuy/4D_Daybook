//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_DisLPA
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
	C_LONGINT:C283(vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_DisLPA")
If ([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13<=vSNo)
	ACCEPT:C269
Else 
	Gen_Alert("You can only Disassemble as many Levels as there are available"; "Try again")
End if 
ERR_MethodTrackerReturn("StockAss_DisLPA"; $_t_oldMethodName)