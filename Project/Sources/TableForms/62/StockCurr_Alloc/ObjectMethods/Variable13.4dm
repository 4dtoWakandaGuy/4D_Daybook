If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_Alloc.Variable13
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
	C_LONGINT:C283(ch1; vNo; vStockLevel; vStockUA)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_Alloc.Variable13"; Form event code:C388)
If (ch1=0)
	QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
	vStockLevel:=vStockUA
	vNo:=Records in selection:C76([CURRENT_STOCK:62])
Else 
	StockCurr_Sel3
	vNo:=Records in selection:C76([CURRENT_STOCK:62])
End if 
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].StockCurr_Alloc.Variable13"; $_t_oldMethodName)
