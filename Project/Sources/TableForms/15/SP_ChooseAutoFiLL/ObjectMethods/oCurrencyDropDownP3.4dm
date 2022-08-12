If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable25
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
	//ARRAY LONGINT(SP_al_CurrencyIDs;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_CurrencyNames;0)
	C_LONGINT:C283(SP_l_AFcurrencyID)
	C_TEXT:C284($_t_oldMethodName; SP_t_FCurrencyCode; SP_t_FCurrencyCode2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable25"; Form event code:C388)
If (SP_at_CurrencyNames>0)
	SP_t_FCurrencyCode:=SP_at_CurrencyCode{SP_at_CurrencyNames}
	SP_t_FCurrencyCode2:=SP_t_FCurrencyCode
	SP_l_AFcurrencyID:=SP_al_CurrencyIDs{SP_at_CurrencyNames}
End if 
SP_at_CurrencyNames:=0
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable25"; $_t_oldMethodName)
