//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr_FileI
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_FileI")
FORM SET INPUT:C55([CURRENT_STOCK:62]; "StockCurr In13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="StockCurr In13"
ERR_MethodTrackerReturn("StockCurr_FileI"; $_t_oldMethodName)