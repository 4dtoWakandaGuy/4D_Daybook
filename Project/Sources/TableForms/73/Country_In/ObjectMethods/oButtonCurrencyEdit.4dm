If (False:C215)
	//object Name: [COUNTRIES]Country_In.oCurrencyEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2012 15:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_LONGINT:C283(COU_l_EditCurrency)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COUNTRIES].Country_In.oCurrencyEdit"; Form event code:C388)

OBJECT SET VISIBLE:C603(CCM_at_CurrencyNames; True:C214)
OBJECT SET VISIBLE:C603(COU_l_EditCurrency; False:C215)
ERR_MethodTrackerReturn("OBJ [COUNTRIES].Country_In.oCurrencyEdit"; $_t_oldMethodName)