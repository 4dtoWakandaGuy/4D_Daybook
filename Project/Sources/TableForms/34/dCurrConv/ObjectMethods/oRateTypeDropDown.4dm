If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv.Variable10
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
	//ARRAY TEXT(arrListNames;0)
	//ARRAY TEXT(CUR_at_RateTypes;0)
	C_OBJECT:C1216($_obj_FormEvent)
	C_TEXT:C284($_t_oldMethodName; vType_)
End if 
//Code Starts Here

$_obj_FormEvent:=FORM Event:C1606
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv.oRateTypeDrop"; $_obj_FormEvent.code)
//Check_Lists (->vType_;"Rate Types")
Case of 
	: ($_obj_FormEvent.code=On Clicked:K2:4)
		Form:C1466.RateType:=CUR_at_RateTypes{CUR_at_RateTypes}
		CUR_at_RateTypes{0}:=CUR_at_RateTypes{CUR_at_RateTypes}
		CUR_at_RateTypes:=0
		OBJECT SET VISIBLE:C603(*; "oRateType"; False:C215)
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv.Variable10"; $_t_oldMethodName)
