If (False:C215)
	//object Name: [USER]CUR_ConversionRates.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CUR_bo_CurrencyModify)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CUR_S5_CurrencyCode2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CUR_ConversionRates.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (CUR_S5_CurrencyCode2#"")
			CUR_bo_CurrencyModify:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CUR_ConversionRates.Variable2"; $_t_oldMethodName)
