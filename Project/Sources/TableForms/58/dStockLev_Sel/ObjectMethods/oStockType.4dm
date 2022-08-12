If (False:C215)
	//object Name: [STOCK_LEVELS]dStockLev_Sel.Variable9
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable9"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[STOCK_TYPES:59]; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Name:2; "Stock Type")
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_LEVELS].dStockLev_Sel.Variable9"; $_t_oldMethodName)
