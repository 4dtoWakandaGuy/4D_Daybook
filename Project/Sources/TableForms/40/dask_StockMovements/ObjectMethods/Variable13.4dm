If (False:C215)
	//object Name: [STOCK_MOVEMENTS]dask_StockMovements.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Identity;0)
	//Array TEXT(GEN_at_RecordCode;0)
	C_TEXT:C284($_t_oldMethodName; PO_S20_PurchaseOrder)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].dask_StockMovements.Variable13"; Form event code:C388)
PO_S20_PurchaseOrder:=GEN_at_RecordCode{GEN_at_Identity}
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].dask_StockMovements.Variable13"; $_t_oldMethodName)