If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dAsk_Bud.Variable11
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
	C_TEXT:C284($_t_Code; $_t_oldMethodName; ACC_t_AnalysisCodeFrom)
End if 
//Code Starts Here
$_obj_FormEvent:=FORM Event:C1606

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oAnalysisCode"; $_obj_FormEvent.code)
Case of 
	: ($_obj_FormEvent.code=On Data Change:K2:15)
		If (Not:C34(Form:C1466.NoLookupLists))
			$_t_Code:=Form:C1466.AnalysisCodeFrom
			Check_MinorNC(->$_t_Code; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")
			Form:C1466.AnalysisCodeFrom:=$_t_Code
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dAsk_Bud.oAnalysisCode"; $_t_oldMethodName)
