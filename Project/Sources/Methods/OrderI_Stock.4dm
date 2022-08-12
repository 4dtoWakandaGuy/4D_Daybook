//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_Stock
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Stock")
//OrderI_Stock
//SEARCH([STOCK LEVELS];[STOCK LEVELS]Product Code=[ORDER ITEMS]Product Code;*)
//SEARCH([STOCK LEVELS]; & ;[STOCK LEVELS]Stock Type=◊SG1)
//[ORDER ITEMS]Sort Order:=Sum([STOCK LEVELS]Free Level)
ERR_MethodTrackerReturn("OrderI_Stock"; $_t_oldMethodName)