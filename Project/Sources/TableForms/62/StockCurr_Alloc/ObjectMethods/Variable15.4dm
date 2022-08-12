If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_Alloc.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_Alloc.Variable15"; Form event code:C388)
//TRACE
OrderI_xAlloc
ERR_MethodTrackerReturn("OBJ:StockCurr_Alloc,xSelect"; $_t_oldMethodName)
