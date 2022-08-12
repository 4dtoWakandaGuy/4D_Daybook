If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dAsk_Bud.Variable4
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
	C_BOOLEAN:C305(<>NAL)
	C_OBJECT:C1216($_obj_FormEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_obj_FormEvent:=FORM Event:C1606

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oCheckBoxFilterLookupLists"; Form event code:C388)
Case of 
	: ($_obj_FormEvent.code=On Clicked:K2:4)
		<>NAL:=Form:C1466.NoLookupLists
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oCheckBoxFilterLookupLists"; $_t_oldMethodName)
