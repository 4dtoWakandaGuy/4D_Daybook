//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_FileO
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
	C_LONGINT:C283(WIN_CURRENTMENU)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_FileO")
FORM SET OUTPUT:C54([CURRENT_STOCK:62]; "StockCurr_Out")
WIN_t_CurrentOutputform:="StockCurr_Out"
WIN_CURRENTMENU:=97
ERR_MethodTrackerReturn("StockCurr_FileO"; $_t_oldMethodName)