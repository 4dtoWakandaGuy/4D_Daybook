If (False:C215)
	//object Name: [STOCK_TYPES]StockTypes_in.oAllocationAllowedCB
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_TYPES].StockTypes_in.oAllocationAllowedCB"; Form event code:C388)
DB_bo_RecordModified:=True:C214
If ([STOCK_TYPES:59]Allocation_Allowed:8=False:C215)
	[STOCK_TYPES:59]Allocated:6:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_TYPES].StockTypes_in.oAllocationAllowedCB"; $_t_oldMethodName)
