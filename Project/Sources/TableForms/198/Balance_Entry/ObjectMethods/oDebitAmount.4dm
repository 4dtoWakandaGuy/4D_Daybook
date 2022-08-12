
If (False:C215)
	//Object Name:      [ACC_Bank_Statements].Balance_Entry.oDebitAmount
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACC_Bank_Statements]Balance_Entry.oDebitAmount"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		If (Form:C1466.Bank_DebitAmount#0)
			OBJECT SET ENTERABLE:C238(*; "oCreditAmount"; False:C215)
		Else 
			OBJECT SET ENTERABLE:C238(*; "oCreditAmount"; True:C214)
		End if 
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [ACC_Bank_Statements]Balance_Entry.oDebitAmount"; $_t_oldMethodName)
