
If (False:C215)
	//Object Name:      [ACCOUNT_BALANCES].dCurrConv.oConvertTo
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/04/2022
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_FormEvent)
End if 
//Code Starts Here

$_obj_FormEvent:=FORM Event:C1606
Case of 
	: ($_obj_FormEvent.code=On Clicked:K2:4)
		Form:C1466.DoNotConvert:=Num:C11(Not:C34(Form:C1466.Convert=1))
End case 

