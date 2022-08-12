If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dAsk_Bud.Variable5
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
	C_OBJECT:C1216($_obj_FormEvent)
	C_TEXT:C284($_t_oldMethodName; $_t_Period)
End if 
//Code Starts Here
$_obj_FormEvent:=FORM Event:C1606

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oPeriodCode"; Form event code:C388)
Case of 
	: ($_obj_FormEvent.code=On Data Change:K2:15)
		If (Not:C34(Form:C1466.NoLookupLists))
			$_t_Period:=Form:C1466.Period
			HIDE WINDOW:C436
			Check_MinorNC(->$_t_Period; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
			Form:C1466.Period:=$_t_Period
			SHOW WINDOW:C435
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oPeriodCode"; $_t_oldMethodName)

