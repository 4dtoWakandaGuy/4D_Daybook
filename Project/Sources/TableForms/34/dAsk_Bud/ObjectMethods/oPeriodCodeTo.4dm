If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dAsk_Bud.Variable8
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
	C_OBJECT:C1216($_obj_FormEvent)
	C_TEXT:C284($_t_code; $_t_oldMethodName; $_t_Period; ACC_t_PeriodTo)
End if 
//Code Starts Here
$_obj_FormEvent:=FORM Event:C1606
TRACE:C157

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oPeriodCodeTo"; $_obj_FormEvent.code)
Case of 
	: ($_obj_FormEvent.code=On Data Change:K2:15)
		
		If (Not:C34(Form:C1466.NoLookupLists))
			$_t_code:=Form:C1466.PeriodCodeto
			Check_MinorNC(->$_t_code; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
			Form:C1466.PeriodCodeto:=$_t_code
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oPeriodCodeto"; $_t_oldMethodName)
