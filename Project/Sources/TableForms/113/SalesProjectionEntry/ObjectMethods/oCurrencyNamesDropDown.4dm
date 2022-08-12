If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Variable9
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
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//Array Text(SP_at_CurrencyNames;0)
	//ARRAY LONGINT(SP_al_CurrencyIDs;0)
	C_LONGINT:C283(SP_l_CurrencyID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesCurrency)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable9"; Form event code:C388)
If (SP_at_CurrencyNames>0)
	SP_t_SalesCurrency:=SP_at_CurrencyCode{SP_at_CurrencyNames}
	SP_l_CurrencyID:=SP_al_CurrencyIDs{SP_at_CurrencyNames}
End if 
SP_at_CurrencyNames:=0
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable9"; $_t_oldMethodName)