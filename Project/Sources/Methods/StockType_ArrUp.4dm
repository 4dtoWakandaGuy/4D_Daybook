//%attributes = {}
If (False:C215)
	//Project Method Name:      StockType_ArrUp
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
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_LONGINT:C283($_l_StockTypeRow)
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockType_ArrUp")
//Called by StockLev_Sel*, StockCurrSel*
//*Both of these alse refer to ◊stockType
$_l_StockTypeRow:=Find in array:C230(STK_at_AllStockTypes; vStatus)
If ($_l_StockTypeRow>0)
	STK_at_AllStockTypes:=$_l_StockTypeRow
End if 
ERR_MethodTrackerReturn("StockType_ArrUp"; $_t_oldMethodName)
