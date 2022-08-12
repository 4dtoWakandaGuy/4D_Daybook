If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_List.Field18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_List.Field18"; Form event code:C388)
RELATE ONE:C42([CURRENT_STOCK:62]Layer_Code:12)
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].StockCurr_List.Field18"; $_t_oldMethodName)