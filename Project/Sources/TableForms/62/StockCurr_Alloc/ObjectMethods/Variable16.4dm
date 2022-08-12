If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_Alloc.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 13:02
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_Alloc.Variable16"; Form event code:C388)
OrderI_xUnalloc
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].StockCurr_Alloc.Variable16"; $_t_oldMethodName)
